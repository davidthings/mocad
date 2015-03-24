include <../mo/mo.scad>

MountDepth = 0.24*in;
MountLength = 1.32*in;
MountDistance = 0.22*in;
MountSmallHoles = 0.439*in;
MountHoles = 1.061*in;
MountFlangeHeight = 0.12*in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, MountFlangeHeight, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -MountSmallHoles/2, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ MountSmallHoles/2, 0, 0 ], [ 0, 0, 1 ], 0 ],

  [ [ -MountLength/2, MountDepth/2, 0 ], [ 0, 0, 1 ], -90 ],
  [ [ MountLength/2, MountDepth/2, 0 ], [ 0, 0, 1 ], 90 ],

  [ [ -MountSmallHoles/2, MountFlangeHeight, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ MountSmallHoles/2, MountFlangeHeight, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -MountSmallHoles/2, MountFlangeHeight, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ MountSmallHoles/2, MountFlangeHeight, 0 ], [ 0, 0, 1 ], 180 ],

  [ [  0, MountDepth/2, -MountDistance ], [ 1, 0, 0 ], 90 ],
  [ [  -MountHoles/2, MountDepth/2, -MountDistance ], [ 1, 0, 0 ], 90 ],
  [ [  MountHoles/2, MountDepth/2, -MountDistance ], [ 1, 0, 0 ], 90 ],
];

module actSideMountDual90E( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      //translate( [ 0, 0, MountOffset ] )
      import("./stl/actobotics_90_degree_dual_side_mount_e.stl");
}

function actSideMountDual90EPosition( p = 0 ) = position[ p ];

moMoveOriginTo( actSideMountDual90EPosition( 1 ) )
  actSideMountDual90E( 0, info = true );
