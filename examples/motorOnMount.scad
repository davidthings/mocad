use <../actobotics/actMotorMountPlanetaryB.scad>
use <../actobotics/actPlanetaryGearMotorHDPrecision.scad>

module motorOnMount(  ) {
  moMoveOriginTo( actMotorMountPlanetaryBPosition( 1 ) ) {
    actMotorMountPlanetaryB( 0, info = false );
    moFlip()
      actPlanetaryGearMotorHDPrecision();
  }
}

motorOnMount();

