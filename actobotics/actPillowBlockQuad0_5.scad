include <../mo/mo.scad>

// CAD drawing is off in space, sadly - completely random offsets
mountDepth = 0.25*in;
mountHoleDistance = 1.061*in;
mountWidth = 1.32*in;
mountOffsetX = -0.329 * in;
mountOffsetY = -0.522 * in;
mountOffsetZ = -1.1279 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, mountDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ mountWidth/2, mountDepth/2, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ mountWidth/2, mountDepth/2, -mountHoleDistance/2 ], [ 0, 0, 1 ], 90 ],

  [ [ -mountWidth/2, mountDepth/2, -mountHoleDistance/2 ], [ 0, 0, 1 ], -90 ],
  [ [ -mountWidth/2, mountDepth/2, 0 ], [ 0, 0, 1 ], -90 ],
  [ [ -mountWidth/2, mountDepth/2, mountHoleDistance/2 ], [ 0, 0, 1 ], -90 ],

  [ [ mountWidth/2, mountDepth/2, mountHoleDistance/2 ], [ 0, 0, 1 ], 90 ]
];

module actPillowBlockQuad0_5( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Aluminum )
      rotate( [ 0, 0, 0 ] )
      translate( [ mountOffsetX, mountOffsetY, mountOffsetZ ] )
        import("./stl/actobotics_1_2_ball_bearing_quad_pillow_block.stl");
}

function actPillowBlockQuad0_5Position( p = 0 ) = positions[ p ];

moMoveOriginTo( actPillowBlockQuad0_5Position( 1 ) )
  actPillowBlockQuad0_5( 0, info = true );

