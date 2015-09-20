include <../mo/mo.scad>


SectionPositionCount = 9;

// Spec[ 0 ] = length
// Spec[ 1 ] = radius
// Spec[ 2 ] = thickness
// Spec[ 3 ] = position spacing

// Pos[ 0 ] = section
// Pos[ 1 ] = position index

defaultSpec = [ 5 * in, 0.5 * in, 0.06 * in, 1 * in ];


module moTube( spec = defaultSpec, p = [ 0, 0 ], info = false, tubeColor = Aluminum ) {
  color( tubeColor ) {
    moPitch( 3 ) {
      linear_extrude( height = spec[ 0 ] ) {
        difference() {
          circle( r = spec[ 1 ], center = true );
          circle( r = spec[ 1 ] - spec[ 2 ], center = true );
        }
      }
    }
  }


 if ( info ) {
    moPartOrigin();
    for ( i = [ 0 : spec[ 0 ] / spec[ 3 ] ] )
      for ( j = [ 0 : SectionPositionCount - 1 ] ) {
        pi = [ i, j ];
        moMoveTo( moTubePosition( pi, spec ) )
          moPosition2( pi );
      }
  }

  if ( $name )
    moPartLabel( parent_module( 1 ) );
}


function moTubePositionSection( s, r, t ) = ( s == 0 ) ? [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ] :
                                                            ( s == 1 ) ? [ [ r, 0, 0 ], [ 0, 0, 1 ], 90 ] :
                                                            ( s == 2 ) ? [ [ 0, 0, r ], [ 1, 0, 0 ], -90 ] :
                                                            ( s == 3 ) ? [ [ -r, 0, 0 ], [ 0, 0, 1 ], -90 ] :
                                                            ( s == 4 ) ? [ [ 0, 0, -r ], [ 1, 0, 0 ], 90 ] :
                                                            ( s == 5 ) ? [ [ r - t, 0, 0 ], [ 0, 0, 1 ], -90 ] :
                                                            ( s == 6 ) ? [ [ 0, 0, r - t ], [ 1, 0, 0 ], 90 ] :
                                                            ( s == 7 ) ? [ [ -r + t, 0, 0 ], [ 0, 0, 1 ], 90 ] :
                                                             [ [ 0, 0, -h/2 + t ], [ 1, 0, 0 ], -90 ];


function moTubePosition( p = [0, 0 ], spec ) = moMoveToPosition( [ [ 0, p[0]*spec[3], 0 ], [ 1, 0, 0 ], 0 ], moTubePositionSection( p[ 1 ], spec[ 1 ], spec[ 2 ] ) );

demoSpec = [ 5 * in, 0.5 * in, 0.06 * in, 1 * in ];

moMoveOriginTo( moTubePosition( [ 0, 0 ], demoSpec ) )
  moTube( demoSpec, [ 0 , 0 ], info = true, $name=true );
