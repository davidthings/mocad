include <../mo/mo.scad>

module moGrid( p = [ 0, 0 ], xs = 3, ys = 3, s = 0.5 * in, info = false ) {
  if ( info == true ) {
    moMoveOriginTo( moGridPosition( p, s = s ) ) {
      for ( yi = [ -ys + 1 : ys - 1] )
        for ( xi = [ -xs + 1 : xs -1 ] )
          translate( [xi * s, 0, yi * s])
            moPosition2( [ xi, yi ] );
    }
    moPartOrigin();
  }
  if ( $name )
    moPartLabel( parent_module( 1 ) );
}

function moGridPosition( p = [ 0, 0 ],  s = 0.5 * in ) = [
  [
    (p[0]) * s,
    0,
    (p[1]) * s
  ],
  [ 0, 0, 1 ],
  0
];

moMoveOriginTo( moGridPosition( [ 2, 2, ] ) )
  moGrid( [0, 0], info = true, $name = true );

