use <../actobotics/actMotorMountPlanetaryB.scad>
use <../actobotics/actPlanetaryGearMotorHDPrecision.scad>
use <../actobotics/actHubMountQuad90C.scad>

module motorOnMount(  ) {
  moFlip()
    actHubMountQuad90C();
  moMoveOriginTo( actMotorMountPlanetaryBPosition( 1 ) ) {
    actMotorMountPlanetaryB(  );
    moFlip()
      actPlanetaryGearMotorHDPrecision();
  }
}

motorOnMount();

