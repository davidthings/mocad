include <../mo/mo.scad>

BearingDepth = 0.187 * in;
BearingWithoutFlangeDepth = 0.143*in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BearingDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, BearingWithoutFlangeDepth, 0 ], [ 0, 0, 1 ], 180 ],
];

module actBallBearingFlanged0_25( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      import("./stl/actobotics_flanged_ball_bearing_1_4_od_1_2.stl");
}

function actBallBearingFlanged0_25Position( p = 0 ) = positions[ p ];

moMoveOriginTo( actBallBearingFlanged0_25Position( 2 ) )
  actBallBearingFlanged0_25( 2, info = true, $name=true );

