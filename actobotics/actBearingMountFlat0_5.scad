include <../mo/mo.scad>

// Located in free space... not even in the same place as the 1/4 incher
mountOffsetX = -0.18*in;
mountOffsetY = -0.575*in;
mountOffsetZ = -1.177*in;

mountOutsideSize = 1.31*in;
mountHoleDistance = 1.061*in;
mountDepth = 0.20 * in;
mountFlangeDepth = 0.125 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ mountHoleDistance/2, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, -mountHoleDistance/2 ], [ 0, 0, 1 ], 0 ],
  [ [ -mountHoleDistance/2, 0, 0  ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, mountHoleDistance/2 ], [ 0, 0, 1 ], 0 ],

  [ [ 0, mountDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ mountHoleDistance/2, mountFlangeDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, mountFlangeDepth, -mountHoleDistance/2 ], [ 0, 0, 1 ], 180 ],
  [ [ -mountHoleDistance/2, mountFlangeDepth, 0  ], [ 0, 0, 1 ], 180 ],
  [ [ 0, mountFlangeDepth, mountHoleDistance/2 ], [ 0, 0, 1 ], 180 ],

  // [ [ -mountOutsideSize/2, 0, -mountOutsideSize/2 ], [ 0, 0, 1 ], 0 ] // Reference Mark
];

module actBearingMountFlat0_5( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      translate( [ mountOffsetX, mountOffsetY, mountOffsetZ ] )
        import("./stl/actobotics_1_2_bore_flat_bearing_mount.stl");
}

function actBearingMountFlat0_5Position( p = 0 ) = positions[ p ];

moMoveOriginTo( actBearingMountFlat0_5Position( 5 ) )
  actBearingMountFlat0_5( 0, info = true );


