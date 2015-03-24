include <../mo/mo.scad>

mountFudgeX = 2.71*in;;
mountFudgeY = 1.25*in;;
mountFudgeZ = -1.75*in;
mountDepth = 0.25*in;
mountHeight = 0.75*in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
];

module actActuatorMountHeavy( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      translate( [ mountFudgeX, mountFudgeY, mountFudgeZ ] )
// This is not the same awesome quality as the other Servo City files
        import("./stl/actobotics_heavy_actuator_mount.stl");
}


function actActuatorMountHeavyPosition( p = 0 ) = position[ p ];

moMoveOriginTo( actActuatorMountHeavyPosition( 0 ) )
  actActuatorMountHeavy( 0, info = true );
