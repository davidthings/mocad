include <../mo/mo.scad>

gearOffset = 0.267 * in;
gearDepth = 0.45*in;
gearMountingDistance = 0.75*in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, gearDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, gearMountingDistance, 0 ], [ 0, 0, 1 ], 180 ],
];

module actBevelGear32Pitch16Tooth4( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Brass )
      translate( [ 0, gearOffset, 0 ] )
        import("./stl/actobotics_32_pitch_16_tooth_bevel_gear_4.stl");
}

function actBevelGear32Pitch16Tooth4Position( p = 0 ) = positions[ p ];

moMoveOriginTo( actBevelGear32Pitch16Tooth4Position( 2 ) )
  actBevelGear32Pitch16Tooth4( 0, info = true );
