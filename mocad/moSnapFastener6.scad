include <../mo/mo.scad>

moSnapFastener6BodyDiameter = 0.1380 * in;
moSnapFastener6HeadDiameter = 0.3 * in;
moSnapFastener6HeadHeight = 0.1 * in;
moSnapFastener6AnchorDiameter = 0.25 * in;
moSnapFastener6AnchorHeight = 0.25 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ]
];

module moSnapFastener6( l = 0.25 * in, p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Nylon ) {
      moPitch(){
        translate( [0,0,-(moSnapFastener6AnchorHeight+l)/2] )
          union() {
            cylinder( h = moSnapFastener6AnchorHeight+l, d = moSnapFastener6BodyDiameter, center = true );
            translate( [ 0,0,-l/2 ] )
            cylinder( h = moSnapFastener6AnchorHeight, r2 = moSnapFastener6AnchorDiameter/2, r1 = moSnapFastener6BodyDiameter/2, center = true );
          }
          translate( [0,0,moSnapFastener6HeadHeight/2] )
            cylinder( h = moSnapFastener6HeadHeight, d = moSnapFastener6HeadDiameter, center = true );
       }
    }
}

module moSnapFastener6Move( from, to ) {
  coreMove( positions, from, to )
    children();
}

function moSnapFastener6Position( p = 0 ) = positions[ p ];

moMoveOriginTo( moSnapFastener6Position( 0 ) )
  moSnapFastener6( 0.2 * in, info = true, $name = true );
