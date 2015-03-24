include <../mo/mo.scad>

CouplerOffsetY = 0.375 * in;
CouplerDepth = 0.75 * in;
CouplerHubDiameter = 0.42 * in;
CouplerSetScrewDepth = 0.135 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, CouplerDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, CouplerSetScrewDepth, CouplerHubDiameter/2 ], [ 1, 0, 0 ], -90 ],
  [ [ 0, CouplerDepth - CouplerSetScrewDepth, CouplerHubDiameter/2 ], [ 1, 0, 0 ], -90 ],
];

module actShaftCouplerSetScrew0_25To4mm( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      import("./stl/actobotics_set_screw_shaft_coupler_1_4_to_4mm.stl");
}

function actShaftCouplerSetScrew0_25To4mmPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actShaftCouplerSetScrew0_25To4mmPosition( 0 ) )
  actShaftCouplerSetScrew0_25To4mm( 0, info = true, $name = true  );




