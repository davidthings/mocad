include <../mo/mo.scad>

GearOffsetY = 0.375 * in;
GearDepth = 0.5 * in;
GearHubDiameter = 0.419 * in;
GearSetScrewDepth  = GearDepth / 4;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, GearDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, GearSetScrewDepth, GearHubDiameter/2 ], [ 1, 0, 0 ], -90 ],
];

module actPinionGear32Pitch0_25Bore0_5PD( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Brass )
      translate( [ 0, GearOffsetY, 0 ] )
      rotate( [ 90, 0, 0 ] )
        import("./stl/actobotics_32_pitch_pinion_gear_0.25_bore_0.5_pd.stl");
}

function actPinionGear32Pitch0_25Bore0_5PDPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actPinionGear32Pitch0_25Bore0_5PDPosition( 0 ) )
  actPinionGear32Pitch0_25Bore0_5PD( 0, info = true, $name = true  );




