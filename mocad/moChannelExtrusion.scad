include <../mo/mo.scad>

SectionPositionCount = 7;

module moChannelExtrusion( spec, p = [0,0], info = false ) {
  color( Aluminum ) {
    moPitch( 3 ) {
      linear_extrude( height = spec[ 0 ] ) {   
        polygon( [ [ -spec[1]/2, -spec[2]/2 ], [ spec[1]/2, -spec[2]/2  ], [ spec[1]/2,spec[2]/2 ], [ spec[1]/2-spec[3],spec[2]/2 ], [ spec[1]/2-spec[3],-spec[2]/2+spec[3] ], 
                   [ -spec[1]/2+spec[3],-spec[2]/2+spec[3] ], [ -spec[1]/2+spec[3],spec[2]/2 ], [-spec[1]/2,spec[2]/2 ] ] );       
      }
    }
  }
  
  if ( info ) {
    moPartOrigin();
    for ( i = [ 0 : spec[ 0 ] / spec[ 4 ] ] )
      for ( j = [ 0 : SectionPositionCount - 1 ] ) {
        pi = [ i, j ];
        moMoveTo( moChannelExtrusionPosition( pi, spec ) )
          moPosition2( pi );
      }
  }
  
  if ( $name )
    moPartLabel( parent_module( 1 ) );

}

function moChannelExtrusionPositionSection( s, w, h, t ) = ( s == 0 ) ? [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ] :
                                                            ( s == 1 ) ? [ [ w/2, 0, 0 ], [ 0, 0, 1 ], 90 ] :
                                                            ( s == 2 ) ? [ [ 0, 0, h/2 ], [ 1, 0, 0 ], -90 ] :
                                                            ( s == 3 ) ? [ [ -w/2, 0, 0 ], [ 0, 0, 1 ], -90 ] :
                                                            ( s == 4 ) ? [ [ w/2 - t, 0, 0 ], [ 0, 0, 1 ], -90 ] :
                                                            ( s == 5 ) ? [ [ 0, 0, h/2 - t ], [ 1, 0, 0 ], 90 ] :
                                                             [ [ -w/2 + t, 0, 0 ], [ 0, 0, 1 ], 90 ];

function moChannelExtrusionPosition( p = [0, 0 ], spec ) = moMoveToPosition( [ [ 0, p[0]*spec[4], 0 ], [ 1, 0, 0 ], 0 ], moChannelExtrusionPositionSection( p[ 1 ], spec[ 1 ], spec[ 2 ], spec[ 3 ] ) ); 


demoSpec = [ 5 * in, 1 * in, 0.5 * in, 0.06 * in, 1 * in ];

moMoveOriginTo( moChannelExtrusionPosition( [0,0], demoSpec ) )
  moChannelExtrusion( demoSpec, [0,0], info = true, $name=true );

/*

include <../mo/mo.scad>


SectionPositionCount = 9;

// Spec[ 0 ] = length
// Spec[ 1 ] = Width
// Spec[ 2 ] = Height
// Spec[ 3 ] = Thickness
// Spec[ 4 ] = position spacing

// Pos[ 0 ] = section
// Pos[ 1 ] = position index


module moRectangularTube( spec, p = [ 0, 0 ], info = false ) {
  color( Aluminum ) {
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
    for ( i = [ 0 : spec[ 0 ] / spec[ 4 ] ] )
      for ( j = [ 0 : SectionPositionCount - 1 ] ) {
        pi = [ i, j ];
        moMoveTo( moRectangularTubePosition( pi, spec ) )
          moPosition2( pi );
      }
  }
  
  if ( $name )
    moPartLabel( parent_module( 1 ) );
}


function moRectangularTubePositionSection( s, w, h, t ) = ( s == 0 ) ? [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ] :
                                                            ( s == 1 ) ? [ [ w/2, 0, 0 ], [ 0, 0, 1 ], 90 ] :
                                                            ( s == 2 ) ? [ [ 0, 0, h/2 ], [ 1, 0, 0 ], -90 ] :
                                                            ( s == 3 ) ? [ [ -w/2, 0, 0 ], [ 0, 0, 1 ], -90 ] :
                                                            ( s == 4 ) ? [ [ 0, 0, -h/2 ], [ 1, 0, 0 ], 90 ] :
                                                            ( s == 5 ) ? [ [ w/2 - t, 0, 0 ], [ 0, 0, 1 ], -90 ] :
                                                            ( s == 6 ) ? [ [ 0, 0, h/2 - t ], [ 1, 0, 0 ], 90 ] :
                                                            ( s == 7 ) ? [ [ -w/2 + t, 0, 0 ], [ 0, 0, 1 ], 90 ] :
                                                             [ [ 0, 0, -h/2 + t ], [ 1, 0, 0 ], -90 ];


function moRectangularTubePosition( p = [0, 0 ], spec ) = moMoveToPosition( [ [ 0, p[0]*spec[4], 0 ], [ 1, 0, 0 ], 0 ], moRectangularTubePositionSection( p[ 1 ], spec[ 1 ], spec[ 2 ], spec[ 3 ] ) ); 


demoSpec = [ 5 * in, 1 * in, 1 * in, 0.06 * in, 1 * in ];

moMoveOriginTo( moRectangularTubePosition( [ 0, 0 ], demoSpec ) )
  moRectangularTube( demoSpec, [ 0 , 0 ], info = true, $name=true );


*/
