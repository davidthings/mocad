include <../mo/mo.scad>

// Wow.  Lots of uncertainty!
// The main problem is that the diagram doesn't say how thick the flanges are.
// And the diagram origin is at the corner of BOTH!
MountDistance = 0.37*in - 0.12*in;
MountWidth = 1.3*in;
MountFlangeDistance = 0.125*in;
MountHoleToFlangeDistance = 0.06*in;
MountHoleDistance = 1.061*in;
MountOffset = -0.03*in;
MountThinFlangeDistance = 0.185*in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, MountFlangeDistance, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -MountHoleDistance/2, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ MountHoleDistance/2, 0, 0 ], [ 0, 0, 1 ], 0 ],

  [ [ -MountHoleDistance/2, MountFlangeDistance, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ MountHoleDistance/2, MountFlangeDistance, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ 0, -MountDistance, -MountHoleToFlangeDistance ], [ 1, 0, 0 ], -90 ],
  [ [ -MountHoleDistance/2, -MountDistance, -MountHoleToFlangeDistance ], [ 1, 0, 0 ], -90 ],
  [ [ MountHoleDistance/2, -MountDistance, -MountHoleToFlangeDistance ], [ 1, 0, 0 ], -90 ],

  [ [ 0, -MountDistance, -MountThinFlangeDistance ], [ 1, 0, 0 ], 90 ],
  [ [ -MountHoleDistance/2, -MountDistance, -MountThinFlangeDistance ], [ 1, 0, 0 ], 90 ],
  [ [ MountHoleDistance/2, -MountDistance, -MountThinFlangeDistance ], [ 1, 0, 0 ], 90 ],
];

module actSideMountDual90B( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      translate( [ 0, 0, MountOffset ] )
        import("./stl/actobotics_90_degree_dual_side_mount_b.stl");
}

function actSideMountDual90BPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actSideMountDual90BPosition( 1 ) )
  actSideMountDual90B( 0, info = true );
