include <../mo/mo.scad>

// CAD - https://www.servocity.com/html/planetary_gearmotor_mount_a__5.html
mountDepth = 0.17*in;
mountFlangeDepth = 0.1 * in; // CAD not specific
mountHeight = 0.75*in;
mountDistance = 0.66*in;

motorMountNarrowWidth = 18*mm;

mainMountHoles = 0.770 * in;
mainMountHoles_2 = mainMountHoles/2;
mainMountHolesS45_2 = mainMountHoles_2 * sin( 45 );

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, mountDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ motorMountNarrowWidth / 2, mountFlangeDepth, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, mountFlangeDepth, -motorMountNarrowWidth / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ -motorMountNarrowWidth / 2, mountFlangeDepth, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, mountFlangeDepth, motorMountNarrowWidth / 2 ], [ 0, 0, 1 ], 0 ],

  [ [ -mainMountHolesS45_2, mountDepth, -mainMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],
  [ [ mainMountHolesS45_2, mountDepth, -mainMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],
  [ [ mainMountHolesS45_2, mountDepth, mainMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],
  [ [ -mainMountHolesS45_2, mountDepth, mainMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],

  [ [ mainMountHolesS45_2, 0, -mainMountHolesS45_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -mainMountHolesS45_2, 0, -mainMountHolesS45_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -mainMountHolesS45_2, 0, mainMountHolesS45_2 ], [ 0, 0, 1 ], 0 ],
  [ [ mainMountHolesS45_2, 0, mainMountHolesS45_2 ], [ 0, 0, 1 ], 0 ],
];

module actMotorMountPlanetaryA( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Aluminum )
        import("./stl/actobotics_planetary_motor_mount_a.stl");
}

function actMotorMountPlanetaryA( p = 0 ) = positions[ p ];

moMoveOriginTo( actMotorMountPlanetaryA( 0 ) )
  actMotorMountPlanetaryA( 0, info = true, $name = true );