include <../mo/mo.scad>

mountDepth = 0.15*in;
mountFlangeDepth = mountDepth / 3; // CAD not specific
mountHeight = 0.75*in;
mountDistance = 0.66*in;
motorMountHoles = 26*mm;
motorMountHoles_2 = motorMountHoles/2;
motorMountHolesS45_2 = motorMountHoles_2 * sin( 45 );
mainMountHoles = 1.5*in;
mainMountHoles_2 = mainMountHoles/2;
mainMountHolesS45_2 = mainMountHoles_2 * sin( 45 );

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, mountDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -motorMountHolesS45_2, mountFlangeDepth, -motorMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],
  [ [ motorMountHolesS45_2, mountFlangeDepth, -motorMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],
  [ [ motorMountHolesS45_2, mountFlangeDepth, motorMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],
  [ [ -motorMountHolesS45_2, mountFlangeDepth, motorMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],

  [ [ -mainMountHolesS45_2, mountDepth, -mainMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],
  [ [ mainMountHolesS45_2, mountDepth, -mainMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],
  [ [ mainMountHolesS45_2, mountDepth, mainMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],
  [ [ -mainMountHolesS45_2, mountDepth, mainMountHolesS45_2 ], [ 0, 0, 1 ], 180 ],

  [ [ -mainMountHolesS45_2, 0, -mainMountHolesS45_2 ], [ 0, 0, 1 ], 0 ],
  [ [ mainMountHolesS45_2, 0, -mainMountHolesS45_2 ], [ 0, 0, 1 ], 0 ],
  [ [ mainMountHolesS45_2, 0, mainMountHolesS45_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -mainMountHolesS45_2, 0, mainMountHolesS45_2 ], [ 0, 0, 1 ], 0 ],
];

module actMotorMountPlanetaryB( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Aluminum )
        import("./stl/actobotics_planetary_motor_mount_b.stl");
}

function actMotorMountPlanetaryBPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actMotorMountPlanetaryBPosition( 1 ) )
  actMotorMountPlanetaryB( 0, info = true, $name = true );