include <../mo/mo.scad>

BearingDepth = 0.312 * in;
BearingWithoutFlangeDepth = 0.25*in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BearingDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, BearingWithoutFlangeDepth, 0 ], [ 0, 0, 1 ], 180 ],
];

module actBallBearingFlanged0_5( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      import("./stl/actobotics_flanged_ball_bearing_1_2.stl");
}

function actBallBearingFlanged0_5Position( p = 0 ) = positions[ p ];

moMoveOriginTo( actBallBearingFlanged0_5Position( 1 ) )
  actBallBearingFlanged0_5( 0, info = true );

