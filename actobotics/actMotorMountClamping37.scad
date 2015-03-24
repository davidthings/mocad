include <../mo/mo.scad>

ClampDepth = 0.375*in;
ClampMountDistance = 0.967 * in;
ClampMountHoleDistance = 1.061 * in;
ClampScrewOffsetX = -0.86*in;
ClampScrewOffsetZ = -0.125*in;

positions = [
  [ [ 0, 0, 0 ],         [ 0, 0, 1 ], 0 ],
  [ [ 0, ClampDepth/2, 0 ], [ 0, 0, 1 ],  0 ],
  [ [ 0, ClampDepth, 0 ], [ 0, 0, 1 ],  180 ],
  [ [ 0, ClampDepth/2, ClampMountDistance ], [ 1, 0, 0 ], -90 ],
  [ [ -ClampMountHoleDistance/2, ClampDepth/2, ClampMountDistance ], [ 1, 0, 0 ], -90 ],
  [ [ ClampMountHoleDistance/2, ClampDepth/2, ClampMountDistance ], [ 1, 0, 0 ], -90 ],

[ [ ClampScrewOffsetX, ClampDepth/2, ClampScrewOffsetZ ], [ 1, 0, 0 ], 90 ]
];

module actMotorMountClamping37( p = 0, info = false ) {
  moPresent( positions, p, info )
      color( Steel )
        import("./stl/actobotics_aluminum_clamping_motor_mount_37mm.stl");
}

function actMotorMountClamping37Position( p ) = positions[ p ];

moMoveOriginTo( actMotorMountClamping37Position( 1 ) )
  actMotorMountClamping37( 0, info = true, $name = true );
