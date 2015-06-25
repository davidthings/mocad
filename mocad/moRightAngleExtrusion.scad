include <../mo/mo.scad>

module moRightAngleExtrusion( spec, p = 0, info = false ) {
  color( Yellow ) {
    moPitch( 3 ) {
      linear_extrude( height = spec[ 0 ] ) {
        translate( [ spec[ 1 ] / 2, spec[ 2 ] / 2, 0 ] )
          difference() {
            square( [ spec[ 1 ], spec[ 2 ] ], center = true );
            translate( [ spec[ 3 ], spec[ 3 ], 0 ] ) 
              square( [ spec[ 1 ] - spec[ 3 ], spec[ 2 ] - spec[ 3 ] ], center = true );
          
        }
      }
    }
  }
  
  if ( info ) {
    moPartOrigin();
    //echo( "SPEC:", spec );
    for ( i = [ 0 : 1 ] )
      moMoveTo( moRightAngleExtrusionPosition( i, spec ) )
        moPosition( i );
  }
  if ( $name )
    moPartLabel( parent_module( 1 ) );

}

function moRightAngleExtrusionPosition( p = 0, spec ) =
  ( p == 0 ) ?  [ [0, 0, 0], [0,0,1],0 ] : [ [0, spec[ 0 ], 0], [ 0,0,1],180 ];

demoSpec = [ 5 * in, 1 * in, 1 * in, 0.06 * in ];

moMoveOriginTo( moRightAngleExtrusionPosition( 0, demoSpec ) )
  moRightAngleExtrusion( demoSpec, 0, info = true, $name=true );

echo( moRightAngleExtrusionPosition( 0, demoSpec ) );
echo( moRightAngleExtrusionPosition( 1, demoSpec ) );

