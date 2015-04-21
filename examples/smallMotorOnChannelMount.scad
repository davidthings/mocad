use <../actobotics/actMotorMountPlanetaryA.scad>
use <../actobotics/actPlanetaryGearMotorPrecision.scad>
use <../actobotics/actHubMountQuad90C.scad>
use <../actobotics/actBevelGear32Pitch16Tooth4.scad>

module motorOnMount(  ) {
  moFlip()
    actHubMountQuad90C();
  actMotorMountPlanetaryA(  );
  moMoveTo( actMotorMountPlanetaryA( 1 ) )
    moFlip()
      actPlanetaryGearMotorPrecision();
}

motorOnMount();

