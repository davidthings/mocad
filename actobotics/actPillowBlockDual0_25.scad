include <../mo/mo.scad>

// off in space, sadly - completely random offsets
MountDepth = 0.25*in;
MountHeight = 0.75*in;
MountHoleDistance = 1.061 * in;
MountOffsetX = -0.325 * in;
MountOffsetY = -0.5225 * in;
MountOffsetZ = -0.9272 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, MountDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ -MountHoleDistance/2, MountDepth/2, MountHeight], [ 1, 0, 0 ], -90 ],
  [ [ 0, MountDepth/2, MountHeight], [ 1, 0, 0 ], -90 ],
  [ [ MountHoleDistance/2, MountDepth/2, MountHeight], [ 1, 0, 0 ], -90 ],
];

module actPillowBlockDual0_25( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Aluminum )
      translate( [ MountOffsetX, MountOffsetY, MountOffsetZ ] )
        import("./stl/actobotics_1_4_bore_pillow_block.stl");
}

function actPillowBlockDual0_25Position( p = 0 ) = positions[ p ];

moMoveOriginTo( actPillowBlockDual0_25Position( 1 ) )
  actPillowBlockDual0_25( 0, info = true );

