include <../mo/mo.scad>

moSocketHeadCapScrew6_32BodyDiameter = 0.1380 * in;
moSocketHeadCapScrew6_32HeadDiameter = 0.226 * in;
moSocketHeadCapScrew6_32HeadHeight = 0.138 * in;
moSocketHeadCapScrew6_32HeadSocketDiameter = 7/64 * in + 0.02 * in;
moSocketHeadCapScrew6_32HeadKeyEngagement = 0.064 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ]
];

module moSocketHeadCapScrew6_32( l = 1 * in, p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel ) {
      moPitch(){
        translate( [0,0,-l/2] )
          cylinder( h = l, d = moSocketHeadCapScrew6_32BodyDiameter, center = true );

          translate( [0,0,moSocketHeadCapScrew6_32HeadHeight/2] )
          difference() {
            cylinder( h = moSocketHeadCapScrew6_32HeadHeight, d = moSocketHeadCapScrew6_32HeadDiameter, center = true );
            translate( [0,0, moSocketHeadCapScrew6_32HeadKeyEngagement/2 + Epsilon ])
              cylinder( h = moSocketHeadCapScrew6_32HeadKeyEngagement + 2 * Epsilon,
                        d = moSocketHeadCapScrew6_32HeadSocketDiameter, center = true, $fn=6 );
          }
       }
    }
}

function moSocketHeadCapScrew6_32Position( p = 0 ) = positions[ p ];

moMoveOriginTo( moSocketHeadCapScrew6_32Position( 0 ) )
  moSocketHeadCapScrew6_32( 1 * in, info = true, $name = true );
