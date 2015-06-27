use <../actobotics/actMotorMountPlanetaryA.scad>
use <../actobotics/actPlanetaryGearMotorPrecision.scad>
use <../actobotics/actHubMountQuad90C.scad>
use <../actobotics/actBevelGear32Pitch16Tooth4.scad>

module smallMotorOnChannelMount( flipMount = 0 ) {
  moPitch( ( flipMount != 0 ) ? 0 : 2 )
    actHubMountQuad90C();
  actMotorMountPlanetaryA(  );
  moMoveTo( actMotorMountPlanetaryA( 1 ) )
    moFlip()
      actPlanetaryGearMotorPrecision();
}

smallMotorOnChannelMount( 1 );

