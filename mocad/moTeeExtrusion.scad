include <../mo/mo.scad>


SectionPositionCount = 4;

// Spec[ 0 ] = length
// Spec[ 1 ] = Width
// Spec[ 2 ] = Height
// Spec[ 3 ] = Thickness
// Spec[ 4 ] = position spacing

// Pos[ 0 ] = section
// Pos[ 1 ] = position index

module moTeeExtrusion( spec, p = [ 0, 0 ], info = false ) {
  color( Aluminum ) {
    moPitch( 3 ) {
      linear_extrude( height = spec[ 0 ] ) {   
        polygon( [ [ -spec[1]/2, 0 ], [ spec[1]/2, 0 ], [ spec[1]/2,spec[3] ], [ spec[3]/2,spec[3] ], [ spec[3]/2,spec[2] ], [ -spec[3]/2,spec[2] ], [ -spec[3]/2,spec[3] ], [-spec[1]/2,spec[3] ] ] );       
      }
    }
  }
  
  if ( info ) {
    moPartOrigin();
    for ( i = [ 0 : spec[ 0 ] / spec[ 4 ] ] )
      for ( j = [ 0 : SectionPositionCount - 1 ] ) {
        pi = [ i, j ];
        moMoveTo( moTeeExtrusionPosition( pi, spec ) )
          moPosition2( pi );
      }
  }

  if ( $name )
    moPartLabel( parent_module( 1 ) );

}

function moTeeExtrusionPositionSection( s, w, h, t ) = ( s == 0 ) ? [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ] :
                                                            ( s == 1 ) ? [ [ w/2, 0, 0 ], [ 0, 0, 1 ], 90 ] :
                                                            ( s == 3 ) ? [ [ -w/2, 0, 0 ], [ 0, 0, 1 ], -90 ] :
                                                             [ [ 0, 0, -h - t / 2 ], [ 1, 0, 0 ], 90 ];

function moTeeExtrusionPosition( p = [0, 0 ], spec ) = moMoveToPosition( [ [ 0, p[0]*spec[4], 0 ], [ 1, 0, 0 ], 0 ], moTeeExtrusionPositionSection( p[ 1 ], spec[ 1 ], spec[ 2 ], spec[ 3 ] ) ); 


demoSpec = [ 5 * in, 1 * in, 0.5 * in, 0.06 * in, 1 * in ];

moMoveOriginTo( moTeeExtrusionPosition( [ 0, 0], demoSpec ) )
  moTeeExtrusion( demoSpec, [0,0], info = true, $name=true );


