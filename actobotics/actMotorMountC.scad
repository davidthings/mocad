include <../mo/mo.scad>

//https://www.servocity.com/html/aluminum_motor_mount_c__555124.html
// Diagram and drawings don't match.  Will need to measure.
MountLength = 1.32*in;
MountWidth = 0.57*in;
MountHeight = 0.97*in;
MountDepth = 0.28*in;
MountPartDepth = 0.12*in;
MountMotorHoleDistance = 25;
MountHoleDistance = 1.061*in;
MountOffsetZ = 0.13*in;


MountFlangeDepth = 0.1* in; // Unspecified

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -MountMotorHoleDistance/2, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ MountMotorHoleDistance/2, 0, 0 ], [ 0, 0, 1 ], 0 ],

  [ [ 0, MountPartDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ -MountMotorHoleDistance/2, MountPartDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ MountMotorHoleDistance/2, MountPartDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ 0, MountDepth, MountHeight ], [ 0, 0, 1 ], 180 ],
  [ [ -MountMotorHoleDistance/2, MountDepth, MountHeight ], [ 0, 0, 1 ], 180 ],
  [ [ MountMotorHoleDistance/2, MountDepth, MountHeight ], [ 0, 0, 1 ], 180 ],

  [ [ 0, MountPartDepth, MountHeight ], [ 0, 0, 1 ], 0 ],
  [ [ -MountMotorHoleDistance/2, MountPartDepth, MountHeight ], [ 0, 0, 1 ], 0 ],
  [ [ MountMotorHoleDistance/2, MountPartDepth, MountHeight ], [ 0, 0, 1 ], 0 ],

];

module actMotorMountC( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Aluminum )
     //translate( [ 0, 0, -AdpaterOffsetZ ] )
        import("./stl/actobotics_aluminum_motor_mount_c.stl");
}

function actMotorMountCPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actMotorMountCPosition( 0 ) )
  actMotorMountC( 0, info = true, $name=true );
