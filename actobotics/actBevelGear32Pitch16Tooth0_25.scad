include <../mo/mo.scad>

gearOffset = 0.253 * in;
gearDepth = 0.438*in;
gearMountingDistance = 0.75*in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, gearDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, gearMountingDistance, 0 ], [ 0, 0, 1 ], 180 ],
];

module actBevelGear32Pitch16Tooth0_25( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Brass )
      translate( [ 0, gearOffset, 0 ] )
        import("./stl/actobotics_32_pitch_16_tooth_bevel_gear_1_4.stl");
}

function actBevelGear32Pitch16Tooth0_25Position( p = 0 ) = positions[ p ];

use <../actobotics/actBevelGear32Pitch32Tooth0_25.scad>

moMoveOriginTo( actBevelGear32Pitch16Tooth0_25Position( 2 ) ) {
  actBevelGear32Pitch16Tooth0_25( 0, info = true );
  moMoveTo( actBevelGear32Pitch16Tooth0_25Position( 2 ) ) {
    moYaw()
      moPose( [ 0, 5.5, 0 ] )
        actBevelGear32Pitch32Tooth0_25( 2, info = true);
  }
}
