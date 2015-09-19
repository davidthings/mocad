include <../mo/mo.scad>

// Spec needs to be an array of orientations and offsets, that will also become some of the positions.
// spec = [
//          [ [ location ], [ rotation_vector ], rotation_angle ], // first one is the part reference point
//          [ [ location ], [ rotation_vector ], rotation_angle, diameter, depth ],
//          ...

TubeFittingWall = 0.1 * in;
TubeFittingDiameter = 0.25 * in;
TubeFittingDistance  = TubeFittingDiameter / 2 + TubeFittingWall;
TubeFittingSocketLength = 0.5 * in;

TubeFittingScrewDiameter = 0.125 * in;
TubeFittingScrewSocketLength = TubeFittingDistance / 2;

TubeFittingDefaultSpec = [
  [ [ -TubeFittingDistance, TubeFittingDistance, TubeFittingDistance ], [ 0, 0, 1 ], 180  ],
  [ [ 0, -0.125 * in, 0 ], [ 1, 0, 0 ], 0, TubeFittingDiameter,  TubeFittingSocketLength ],
  [ [ 0.125 * in, 0, 0 ], [ 0, 0, 1 ], 90, TubeFittingDiameter, TubeFittingSocketLength ],
  [ [ 0, 0, -0.125 * in ], [ 1, 0, 0 ], 90, TubeFittingDiameter, TubeFittingSocketLength ],

  [ [ 0, TubeFittingDistance/2, 0 ], [ 0, 0, 1 ], 180, TubeFittingScrewDiameter,  TubeFittingScrewSocketLength ],
  [ [ -TubeFittingDistance/2, 0, 0 ], [ 0, 0, 1 ], -90, TubeFittingScrewDiameter, TubeFittingScrewSocketLength ],
  [ [ 0, 0, TubeFittingDistance/2 ], [ 1, 0, 0 ], -90, TubeFittingScrewDiameter, TubeFittingScrewSocketLength ]

];

module moTubeFittingSolidCore( spec, wall  ) {
  for ( i = [ 1 : len( spec ) - 1 ] ) {
    moMoveTo( spec[ i ] )
      rotate( [ 90, 0, 0 ] )
        translate( [ 0, 0, spec[ i ][ 4 ] / 2 ] )
          cylinder( h = spec[ i ][ 4 ], d = spec[ i ][ 3 ] + 2 * wall, center = true );
  }
}

module moTubeFitting( p = [ 0, 0 ], spec = TubeFittingDefaultSpec, doHull = true, wall = TubeFittingWall, info = false ) {
    // move the part per the first parameter spec
    moMoveOriginTo( moTubeFittingPosition( p, spec ) ) {

        
      difference() {
      
          color( BlackDelrin ) {
            if ( doHull ) {
              hull()
                moTubeFittingSolidCore( spec, wall );            
            } else 
                moTubeFittingSolidCore( spec, wall );                          
          }
          color( BlackDelrin ) {
              for ( i = [ 1 : len( spec ) - 1 ] ) {
                moMoveTo( spec[ i ] )
                  rotate( [ 90, 0, 0 ] ) 
                    translate( [ 0, 0, spec[ i ][ 4 ] / 2 ] )
                      cylinder( h = spec[ i ][ 4 ] + 2 * Epsilon, d = spec[ i ][ 3 ], center = true );
              }
            }
          }
        
        
      if ( info ) {
        l = len( spec );
        moPosition2( [0,0] );
        
        moMoveTo( moTubeFittingPosition( [ 0, 1 ], spec ) ) {
          moPosition2( [0,1] );
        }
        for ( i = [ 1 : l - 1 ] ) {
          pi = [ i, 0 ];
          moMoveTo( moTubeFittingPosition( pi, spec ) )
            moPosition2( pi );
       }
        for ( i = [ 1 : l - 1 ] ) {
          pi = [ i, 1 ];
          moMoveTo( moTubeFittingPosition( pi, spec ) )
            moPosition2( pi );
       }
      }  
      if ( $name == true )
       moPartLabel( parent_module(2) );   
 
     }  
     
     if ( info ) {
        moPartOrigin();
     }
 }
  

function moTubeFittingPosition( p = [ 0, 0 ], spec ) = ( p[ 0 ] == 0 ) ? ( ( p[ 1 ] == 0 ) ? moOriginPosition : spec[ 0 ] ) :
                                                         ( p[ 1 ] == 0 ) ? spec[ p[ 0 ] ] : 
                                                         moCombinePositions( spec[ p[ 0 ] ], [ [ 0, -spec[ p[ 0 ] ][ 4 ], 0, ], [ 1, 0, 0 ], 0 ] );

TubeFittingDemoScrewSocketLength = TubeFittingDistance * 1.25;

TubeFittingDemoSpec = [
  [ [ -TubeFittingDistance, TubeFittingDistance, TubeFittingDistance ], [ 0, 0, 1 ], 180  ],
  [ [ 0, 0, 0 ], [ 1, 0, 0 ], 0, TubeFittingDiameter,  TubeFittingSocketLength ],
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 60, TubeFittingDiameter, TubeFittingSocketLength ],
  [ [ 0, 0, 0 ], [ 1, 0, 0 ], 60, TubeFittingDiameter, TubeFittingSocketLength ],

  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 180, TubeFittingScrewDiameter,  TubeFittingDemoScrewSocketLength ],
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], -120, TubeFittingScrewDiameter, TubeFittingDemoScrewSocketLength ],
  [ [ 0, 0, 0 ], [ 1, 0, 0 ], -120, TubeFittingScrewDiameter, TubeFittingDemoScrewSocketLength ]

];
 
//[ spec[ p[ 0 ]][ 0 ], spec[ p[ 0 ]][ 1 ], spec[ p[ 0 ]][ 2 ] ];
translate( [ -5 * in, 0, 0 ] ) {
  moMoveOriginTo( moTubeFittingPosition( [0 , 0 ], TubeFittingDefaultSpec ) )
  moTubeFitting( [ 0, 0 ], doHull = false, info = true, $name = true );
}

translate( [ 0, 0, 0 ] ) {
  moMoveOriginTo( moTubeFittingPosition( [0 , 0 ], TubeFittingDefaultSpec ) )
  moTubeFitting( [ 0, 0 ], doHull = true, info = true, $name = true );
}

translate( [ 5 * in, 0, 0 ] ) {
  moMoveOriginTo( moTubeFittingPosition( [0 , 0 ], TubeFittingDemoSpec ) )
  moTubeFitting( [ 0, 0 ], TubeFittingDemoSpec, doHull = false, info = true, $name = true );
}
