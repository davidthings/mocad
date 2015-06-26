include <../mo/mo.scad>

// Spec[ 0 ] = length
// Spec[ 1 ] = Width
// Spec[ 2 ] = Height
// Spec[ 3 ] = Thickness
// Spec[ 4 ] = position spacing

// Pos[ 0 ] = section
// Pos[ 1 ] = position index

SectionPositionCount = 4;

module moRightAngleExtrusion( spec, p = 0, info = false ) {
  color( Aluminum ) {
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
    for ( i = [ 0 : spec[ 0 ] / spec[ 4 ] ] )
      for ( j = [ 0 : SectionPositionCount - 1 ] ) {
        pi = [ i, j ];
        moMoveTo( moRightAngleExtrusionPosition( pi, spec ) )
          moPosition2( pi );
      }
  }
  
  if ( $name )
    moPartLabel( parent_module( 1 ) );

}

function moRightAngleExtrusionPositionSection( s, w, h, t ) = ( s == 0 ) ? [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ] :
                                                            ( s == 1 ) ? [ [ w, 0, 0 ], [ 0, 0, 1 ], 90 ] :
                                                              [ [ 0, 0, -h ], [ 1, 0, 0 ], 90 ];

function moRightAngleExtrusionPosition( p = [0, 0 ], spec ) = moMoveToPosition( [ [ 0, p[0]*spec[4], 0 ], [ 1, 0, 0 ], 0 ], moRightAngleExtrusionPositionSection( p[ 1 ], spec[ 1 ], spec[ 2 ], spec[ 3 ] ) ); 

demoSpec = [ 5 * in, 1 * in, 1 * in, 0.06 * in, 1 * in ];

moMoveOriginTo( moRightAngleExtrusionPosition( [0,0], demoSpec ) )
  moRightAngleExtrusion( demoSpec, [0,0], info = true, $name=true );

