include <../mo/mo.scad>

// CAD - https://www.servocity.com/html/aluminum_motor_mount_b__555128.html
mountDepth = 0.34*in;
mountHoleDepth = 0.22*in;
mountFlangeDepth = 0.1 * in; // CAD not specific
mountHeight = 1.32*in;
mountHeight_2 = mountHeight / 2;;
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

  [ [ mainMountHolesS45_2, mountHoleDepth, -mountHeight_2 ], [ 1, 0, 0 ], 90 ],
  [ [ 0, mountHoleDepth, -mountHeight_2 ], [ 1, 0, 0 ], 90 ],
  [ [ -mainMountHolesS45_2, mountHoleDepth, -mountHeight_2 ], [ 1, 0, 0 ], 90 ],
  [ [ -mainMountHolesS45_2, mountHoleDepth, mountHeight_2 ], [ 1, 0, 0 ], -90 ],
  [ [ 0, mountHoleDepth, mountHeight_2 ], [ 1, 0, 0 ], -90 ],
  [ [ mainMountHolesS45_2, mountHoleDepth, mountHeight_2 ], [ 1, 0, 0 ], -90 ],
];

module actMotorMountD( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Aluminum )
      moRoll()
        import("./stl/actobotics_aluminum_motor_mount_d.stl");
}

function actMotorMountDPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actMotorMountDPosition( 0 ) )
  actMotorMountD( 0, info = true, $name = true );