use <../actobotics/actMotorMountPlanetaryA.scad>
use <../actobotics/actPlanetaryGearMotorPrecision.scad>


module motorOnMount(  ) {
  actMotorMountPlanetaryA(  );
  moMoveTo( actMotorMountPlanetaryA( 1 ) )
    moFlip()
      actPlanetaryGearMotorPrecision();
}

motorOnMount();

