include <../mo/mo.scad>

// No flange distance on mini CAD diagram
MountDepth = 0.25*in;
MountDistance = 0.272*in;
MountOffset = 0.207*in;
MountSmallHoles = 0.544*in;
MountToFlange = 0.145*in;
MountHoles = 1.061*in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, MountDepth, 0 ], [ 0, 0, 1 ], 180 ],  

  [ [ -MountSmallHoles/2, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ MountSmallHoles/2, 0, 0 ], [ 0, 0, 1 ], 0 ],

  [ [ -MountSmallHoles/2, MountDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ MountSmallHoles/2, MountDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ 0, MountDepth/2, MountDistance ], [ 1, 0, 0 ], -90 ],
  [ [ -MountHoles/2, MountDepth/2, MountDistance ], [ 1, 0, 0 ], -90 ],
  [ [ MountHoles/2, MountDepth/2, MountDistance ], [ 1, 0, 0 ], -90 ],

  [ [ -MountHoles/2, MountDepth/2, MountToFlange ], [ 1, 0, 0 ], 90 ],
  [ [ MountHoles/2, MountDepth/2, MountToFlange ], [ 1, 0, 0 ], 90 ],
];

module actSideMountDual90C( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      translate( [ 0, 0, MountOffset ] )
      import("./stl/actobotics_90_degree_dual_side_mount_c.stl");
}

function actSideMountDual90CPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actSideMountDual90CPosition( 1 ) )
  actSideMountDual90C( 0, info = true );
