include <../mo/mo.scad>

module moRectangularTube( spec, p = 0, info = false ) {
  color( Yellow ) {
    moPitch( 3 ) {
      linear_extrude( height = spec[ 0 ] ) {
        difference() {
          square( [ spec[ 1 ], spec[ 2 ] ], center = true );
          square( [ spec[ 1 ] - 2 * spec[ 3 ], spec[ 2 ] - 2 * spec[ 3 ] ], center = true );
        }
      }
    }
  }
  
  if ( info ) {
    moPartOrigin();
    //echo( "SPEC:", spec );
    for ( i = [ 0 : 1 ] )
      moMoveTo( moRectangularTubePosition( i, spec ) )
        moPosition( i );
  }
  if ( $name )
    moPartLabel( parent_module( 1 ) );

}

function moRectangularTubePosition( p = 0, spec ) =
  ( p == 0 ) ?  [ [0, 0, 0], [0,0,1],0 ] : [ [0, spec[ 0 ], 0], [ 0,0,1],180 ];

demoSpec = [ 5 * in, 1 * in, 1 * in, 0.06 * in ];

moMoveOriginTo( moRectangularTubePosition( 0, demoSpec ) )
  moRectangularTube( demoSpec, 0, info = true, $name=true );


