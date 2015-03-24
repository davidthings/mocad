include <../mo/mo.scad>

ClampDepth = 0.375*in;
ClampMountDistance = 0.75 * in;
ClampMountHoleDistance = 1.061 * in; // Not explicit in CAD
ClampScrewOffsetX = -0.763*in; // Not explicit
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

module actMotorMountClamping32( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      translate( [ 0, ClampDepth, 0 ] )
        moFlip()        
          import("./stl/actobotics_32mm_clamping_motor_mount.stl");
}

function actMotorMountClamping32Position( p ) = positions[ p ];

moMoveOriginTo( actMotorMountClamping32Position( 1 ) )
  actMotorMountClamping32( 0, info = true, $name = true );
