use <../actobotics/actMotorMountPlanetaryB.scad>
use <../actobotics/actPlanetaryGearMotorHDPrecision.scad>

module motorOnMount(  ) {
  moMoveOriginTo( actMotorMountPlanetaryBPosition( 1 ) ) {
    actMotorMountPlanetaryB( info = true );
    moFlip()
      actPlanetaryGearMotorHDPrecision();
  }
}

motorOnMount();

