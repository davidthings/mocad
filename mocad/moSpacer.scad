include <../mo/mo.scad>

module SpacerBuild( t, d, id, caps ) {
  color( BlackDelrin ) {
    rotate( [90,0,0] )
      difference() {
        cylinder( h = t, r = d/2, center = true  );
        if ( id > 0 ) 
        cylinder( h = t + 2 * Epsilon, r = id/2 + Epsilon, center = true  );
      }
  }
}

function moSpacerPosition( p = 0, t = 1 * in ) = [   
  [
    0,
    ( ( p == 0 ) || ( p == 3 ) ) ? 0 : ( ( p == 1 ) ? -t/2 : t/2 ),
    0        
  ],
  [
    0,
    0,
    1,
  ],
  ( p==2 ) ? 180 : 0
];

module moSpacer( p = 0, t = 0.0625 * in, d = 0.375 * in, id = 0.25 * in, info = false ) {
  moMoveOriginTo( moSpacerPosition( p, t ) ) 
  {
    SpacerBuild( t, d, id );
    if ( info == true ) {
      for ( i = [ 0 : 2 ] ) {
        moMoveTo( moSpacerPosition( i, t ) )
          moPosition( i );
       }
    }
  }
  if ( info == true )
    moPartOrigin();
  if ( $name )
    moPartLabel( parent_module( 1 ) );
}

// Make  Spacer - centered
moMoveOriginTo( moSpacerPosition( 1 ) )
  moSpacer( 0, t = 0.0625*in, d = 0.375*in, id = 0.25 * in, caps = false, info = true, $name = true );
