include <../mo/mo.scad>

// Note the MountDepth does not agree with the STL file... 
// Mini diagram on the site does not give hole spacing
// Nor flange width
MountDepth = 0.239*in;
MountHeight = 0.34*in;
MountDistance = 0.225*in;
MountFlangeHeight = 0.125 * in;
MountHoleDistance = 1.061*in;
MountSmallHoleDistance = 0.439*in; // Guess
MountWidth = 1.3*in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, MountDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -MountHoleDistance/2, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ MountHoleDistance/2, 0, 0 ], [ 0, 0, 1 ], 0 ],

  [ [ -MountHoleDistance/2, MountDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ MountHoleDistance/2, MountDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -MountHoleDistance/2, MountDepth/2, MountDistance], [ 1, 0, 0 ], -90 ],
  [ [ -MountSmallHoleDistance/2, MountDepth/2, MountDistance], [ 1, 0, 0 ], -90 ],
  [ [ 0, MountDepth/2, MountDistance], [ 1, 0, 0 ], -90 ],
  [ [ MountSmallHoleDistance/2, MountDepth/2, MountDistance], [ 1, 0, 0 ], -90 ],
  [ [ MountHoleDistance/2, MountDepth/2, MountDistance], [ 1, 0, 0 ], -90 ],

  [ [ -MountSmallHoleDistance/2, MountDepth/2, MountDistance-MountFlangeHeight], [ 1, 0, 0 ], 90 ],
  [ [ MountSmallHoleDistance/2, MountDepth/2, MountDistance-MountFlangeHeight], [ 1, 0, 0 ], 90 ],

  [ [ 0, MountDepth/2, MountDistance-MountFlangeHeight], [ 1, 0, 0 ], 90 ],
];

module actSideMountDual90A( p = 0, info = false ) {
  moPresent( positions, p, info );
    color( Steel )
      translate( [ -MountWidth/2, 0, MountDistance ] )
        import("./stl/actobotics_90_degree_dual_side_mount_a.stl");
}

function actSideMountDual90APosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actSideMountDual90APosition( 1 ) )
  actSideMountDual90A( 0, info = true );
