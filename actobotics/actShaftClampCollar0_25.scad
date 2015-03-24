include <../mo/mo.scad>

ClampDepth = 0.28 * in;
ClampBodyDepth = 0.25 * in;
ClampOutsideDiameter = 0.375 * in;
ClampScrewDistance = 0.215 * in; // Not specified in diagrams

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, ClampDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ -ClampScrewDistance, ClampBodyDepth/2, ClampOutsideDiameter/2 ], [ 1, 0, 0 ], -90 ],

];

module actShaftClampCollar0_25( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      import("./stl/actobotics_1_4_shaft_clamp_collar.stl");
}

function actShaftClampCollar0_25Position( p = 0 ) = positions[ p ];

moMoveOriginTo( actShaftClampCollar0_25Position( 1 ) )
  actShaftClampCollar0_25( 0, info = true );


