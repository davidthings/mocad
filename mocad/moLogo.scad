include <../mo/mo.scad>

blockSize = 0.10 * in;
blockThickness = 0.05 * in;
//sphereRadius = .3 * in;
//sphereOffset = sphereRadius + 7.35 * blockSize;

//sphereRadius = .345 * in;
//sphereOffset = sphereRadius + 6.9 * blockSize;

//sphereRadius = .15 * in;
//sphereOffset = sphereRadius + 8.9 * blockSize;

sphereOffset = 5.65 * blockSize;


//sphereRadius = .25 * in;
//sphereOffset = sphereRadius + 7.9 * blockSize;

mColor = [ 0.9, 0.9, 0.9 ];
punct1Color = [ 0.45, 0.45, 0.45 ];
punct2Color = [ 0.3, 0.3, 0.3 ];

sphereColor = [ 0.8, 0.6, 0.0 ];
//sphereColor = [ 0.9, 0.9, 0.9 ];
//sphereColor = [ 0.5, 0.5, 0.5 ];


// This is a great letter spacing setup  -11.5, -9.5, 3.0, 11.5
//scale( [ 0.5, 1, 1 ] )
//moPose( [ 0, 0, 0 ], t = [ 0 * blockSize, 0, 0 ] ) {
//  color( mColor ) { // [ 1, 1, 1 ] ) {
//    moPose( [ 90, 90, 0 ], [-9.25 * blockSize, 0, 0] )
//      8bit_str( "m", 1, blockSize, blockThickness  );
//  }
//  color( punct1Color ) {
//    moPose( [ 90, 90, 0 ], [-5, 0, 0] )
//      8bit_str( "(", 1, blockSize, blockThickness  );
//    moPose( [ 90, 90, 0 ], [5.0 * blockSize, 0, 0] )
//      8bit_str( ")", 1, blockSize, blockThickness  );
//  }
//  color( punct2Color ) {
//    moPose( [ 90, 90, 0 ], [11.5 * blockSize, 0, 0] )
//      8bit_str( "{", 1, blockSize, blockThickness  );
//    moPose( [ 90, 90, 0 ], [25 * blockSize, 0, 0] )
//      8bit_str( "}", 1, blockSize, blockThickness  );
//  }
//}


module moLogo() {
  moPose( [ 0, 0, 0 ], t = [ -3.5 * blockSize, 0, -blockSize * 1.75] ) {
    f  = "Liberation Sans:style=Bold";
    color( mColor ) { // [ 1, 1, 1 ] ) {
      moPose( [ 90, 0, 0 ], [-8 * blockSize, 0, -blockSize/2] )
        text( "m", blockSize * 5 , blockThickness, font = f  );
    }
    color( punct1Color ) {
      moPose( [ 90, 0, 0 ], [-4, 0, 0] )
        text( "(", blockSize * 4, blockThickness, font = f  );
      moPose( [ 90, 0, 0 ], [1.0 * blockSize, 0, 0] )
        text( ")", blockSize * 4, blockThickness, font = f  );
    }
    color( punct2Color ) {
      moPose( [ 90, 0, 0 ], [3.5 * blockSize, 0, 0] )
        text( "{", blockSize * 5, blockThickness, font = f  );
      moPose( [ 90, 0, 0 ], [12 * blockSize, 0, 0] )
        text( "}", blockSize * 5, blockThickness, font = f  );
    }
  }
  
  // unless we're going for smooth, $fn more than 16 loses detail as we shrink.  Facets have to be the same size as the
  // features
  
  // $fn's of 5 and 4 look very minecrafty
  
  moPose( [ 0, 0, 13 ], t = [ sphereOffset, 0, 0 ] ) {
   scale( [ 1, 1, 1 ] )
    color( sphereColor ) {
      //sphere( r = sphereRadius, center = true, $fn=13 );
      cylinder( h = 0.75 * in, r1 = 0.15 * in, r2 = 0.075* in, center = true , $fn=13 );
    }    
  }
  
  if ( $name )
    moPartLabel( parent_module( 1 ) );
  
  //  translate( [ 0, 0, -20 * in ] )
  //    color( [ 0, 0, 0 ] )
  //      // cube( [ 500 * in, 500 * in, 0.125 * in ], center = true );
  //      cylinder( h = 1 * in, r = 500 * in );
  //
  //
  //  translate( [ 0, 20 * in ] )
  //    color( [ 0, 0, 0 ] )
  //      moPitch()
  //      // cube( [ 500 * in, 500 * in, 0.125 * in ], center = true );
  //      cylinder( h = 1 * in, r = 500 * in );
  
  
  //
}

function moLogoDimensions() = [ 22 * blockSize, 0.3 * in, 0.75 * in ];

moLogo( $name = true );

//moPartOrigin();
//#cube( moLogoDimensions(), center = true );

