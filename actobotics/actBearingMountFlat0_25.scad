include <../mo/mo.scad>

// CAD diagram located in free space
mountOffsetX = -0.265*in;
mountOffsetY = -0.6*in;
mountOffsetZ = -1.115*in;

mountOutsideSize = 1.31*in;
mountHoleDistance = 1.061*in;
mountDepth = 0.20 * in;
mountFlangeDepth = 0.125 * in;

positions = [
  [   [ 0, 0, 0 ], [ 0, 0, 1 ],  0],
  [   [mountHoleDistance/2, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [   [mountHoleDistance/2, 0, -mountHoleDistance/2], [ 0, 0, 1 ], 0 ],
  [   [0, 0, -mountHoleDistance/2], [ 0, 0, 1 ], 0 ],
  [   [-mountHoleDistance/2, 0, -mountHoleDistance/2], [ 0, 0, 1 ], 0 ],
  [   [-mountHoleDistance/2, 0, 0], [ 0, 0, 1 ], 0 ],
  [   [-mountHoleDistance/2, 0, mountHoleDistance/2], [ 0, 0, 1 ], 0 ],
  [   [0, 0, mountHoleDistance/2 ], [ 0, 0, 1 ], 0 ],
  [   [mountHoleDistance/2, 0, mountHoleDistance/2], [ 0, 0, 1 ], 0 ],

  [   [ 0, mountDepth, 0 ],[ 0, 0, 1 ],  180,    ],
  [   [ -mountHoleDistance/2, mountFlangeDepth, 0], [0,0,1], 180  ],
  [   [mountHoleDistance/2, mountFlangeDepth, -mountHoleDistance/2], [ 0, 0, 1 ], 180 ],
  [   [ 0, mountFlangeDepth, -mountHoleDistance/2], [0,0,1], 180, ],
  [   [-mountHoleDistance/2, mountFlangeDepth, -mountHoleDistance/2], [ 0, 0, 1 ], 180 ],
  [   [mountHoleDistance/2, mountFlangeDepth, 0],   [0,0,1], 180, ],
  [   [-mountHoleDistance/2, mountFlangeDepth, mountHoleDistance/2], [ 0, 0, 1 ], 180 ],
  [   [ 0, mountFlangeDepth, mountHoleDistance/2 ], [0,0,1], 180, ],
  [   [mountHoleDistance/2, mountFlangeDepth, mountHoleDistance/2], [ 0, 0, 1 ], 180 ],
];

module actBearingMountFlat0_25( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      translate( [ mountOffsetX, mountOffsetY, mountOffsetZ ] )
        import("./stl/actobotics_1_4_bore_flat_bearing_mount.stl");
}

function actBearingMountFlat0_25Position( p = 0 ) = positions[ p ];

moMoveOriginTo( actBearingMountFlat0_25Position( 9 ) )
  actBearingMountFlat0_25( 0, info = true );


