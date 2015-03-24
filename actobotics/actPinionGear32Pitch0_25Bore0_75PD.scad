include <../mo/mo.scad>

GearOffsetY = 0.375 * in;
GearDepth = 0.5 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, GearDepth, 0 ], [ 0, 0, 1 ], 180 ],
];

module actPinionGear32Pitch0_25Bore0_75PD( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Brass )
      translate( [ 0, GearOffsetY, 0 ] )
      rotate( [ 0, 0, 90 ] )
        import("./stl/actobotics_32_pitch_pinion_gear_0.25_bore_0.75_pd.stl");
}

function actPinionGear32Pitch0_25Bore0_75PDPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actPinionGear32Pitch0_25Bore0_75PDPosition( 1 ) )
  actPinionGear32Pitch0_25Bore0_75PD( 0, info = true );



