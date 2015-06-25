include <../mo/mo.scad>

// CAD - https://www.servocity.com/html/planetary_gearmotor_mount_b__5.html
mountDepth = 0.24*in;
mountFlangeDepth = 0.1 * in; // CAD not specific
mountHeight = 0.75*in;
mountDistance = 0.66*in;

motorMountNarrowWidth = 25*mm;
motorMountMediumWidth = 28*mm;
motorMountWideWidth = 31*mm;
motorMountNarrowHeight = 7*mm;

mainMountHoles = 1.5*in;
mainMountHoles_2 = mainMountHoles/2;
mainMountHolesS45_2 = mainMountHoles_2 * sin( 45 );

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, mountDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ motorMountNarrowWidth / 2, mountFlangeDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ -motorMountNarrowWidth / 2, mountFlangeDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ motorMountWideWidth / 2, mountFlangeDepth, -motorMountNarrowHeight ], [ 0, 0, 1 ], 180 ],
  [ [ -motorMountWideWidth / 2, mountFlangeDepth, -motorMountNarrowHeight ], [ 0, 0, 1 ], 180 ],

  [ [ motorMountMediumWidth / 2, mountFlangeDepth, motorMountNarrowHeight ], [ 0, 0, 1 ], 180 ],
  [ [ -motorMountMediumWidth / 2, mountFlangeDepth, motorMountNarrowHeight ], [ 0, 0, 1 ], 180 ],

  [ [ 0, mountFlangeDepth, motorMountMediumWidth / 2 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, mountFlangeDepth, -motorMountMediumWidth / 2 ], [ 0, 0, 1 ], 180 ],

[ [ -mainMountHolesS45_2, mountDepth, -mainMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],
  [ [ mainMountHolesS45_2, mountDepth, -mainMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],
  [ [ mainMountHolesS45_2, mountDepth, mainMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],
  [ [ -mainMountHolesS45_2, mountDepth, mainMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],

  [ [ mainMountHolesS45_2, 0, -mainMountHolesS45_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -mainMountHolesS45_2, 0, -mainMountHolesS45_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -mainMountHolesS45_2, 0, mainMountHolesS45_2 ], [ 0, 0, 1 ], 0 ],
  [ [ mainMountHolesS45_2, 0, mainMountHolesS45_2 ], [ 0, 0, 1 ], 0 ],
];

module actMotorMountB( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Aluminum )
        import("./stl/actobotics_aluminum_motor_mount_b.stl");
}

function actMotorMountBPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actMotorMountBPosition( 0 ) )
  actMotorMountB( 0, info = true, $name = true );