include <../mo/mo.scad>

module shaftBuild( l, d, id, caps ) {
  color( Stainless ) {
    rotate( [90,0,0] )
      difference() {
        cylinder( h = l, r = d/2, center = true  );
        if ( id > 0 ) 
        cylinder( h = l + 2 * Epsilon, r = id/2, center = true  );
      }
    if ( caps == true ) {
      translate( [ 0, l/2, 0 ] )
        sphere( r = d/2  );
      translate( [ 0, -l/2, 0 ] )
        sphere( r = d/2 );
    }
  }
}

function moShaftPosition( p = 0, l = 1 * in ) = [   
  [
    0,
    ( ( p == 0 ) || ( p == 3 ) ) ? 0 : ( ( p == 1 ) ? -l/2 : l/2 ),
    0        
  ],
  [
    0,
    0,
    1,
  ],
  ( p==2 ) ? 180 : 0
];

module moShaft( p = 0, l = 1 * in, d = 0.25 * in, id = 0, caps = false, info = false ) {
  moMoveOriginTo( moShaftPosition( p, l ) ) 
  {
    shaftBuild( l, d, id, caps );
    if ( info == true ) {
      for ( i = [ 0 : 2 ] ) {
        moMoveTo( moShaftPosition( i, l ) )
          moPosition( i );
       }
    }
  }
  if ( info == true )
    moPartOrigin();
  if ( $name )
    moPartLabel( parent_module( 1 ) );
}

// Make  shaft - centered
moMoveOriginTo( moShaftPosition( 1, 2 * in ) )
  moShaft( 0, l = 2*in, d = 0.25*in, caps = false, info = true, $name = true );
