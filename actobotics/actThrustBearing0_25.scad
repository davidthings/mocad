include <../mo/mo.scad>

BearingDepth = 0.195*in;

positions = [
  [ [ 0, 0, 0 ],  [ 0, 0, 1 ], 0 ],
  [ [ 0, BearingDepth, 0 ], [ 0, 0, 1 ], 180 ],
];

module actThrustBearing0_25( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      translate( [ 0, BearingDepth/2, 0 ] )
        import("./stl/actobotics_thrust_bearing_1_4.stl");
}

function actThrustBearing0_25Position( p = 0 ) = positions[ p ];

moMoveOriginTo( actThrustBearing0_25Position( 1 ) )
  actThrustBearing0_25( 0, info = true );
