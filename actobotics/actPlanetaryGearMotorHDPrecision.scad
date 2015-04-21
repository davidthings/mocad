include <../mo/mo.scad>

motorShaftDepth = 14;
motorShaftDiameter = 6;
motorGearShoulderDepth = 3;
motorGearShoulderDiameter = 18;
motorGearCapDepth = 4;
motorGearCapDiameter = 32;
motorGearDepth = 20.5;
motorGearDiameter = 32;
motorMotorDepth = 52.1;
motorMotorDiameter = 38;
motorMotorCapDepth = 5;
motorMotorCapDiameter = 38;
motorMotorEndCapDepth = 5;
motorMotorEndCapDiameter = 18;
motorConnectorDepth = 6;
motorConnectorWidth = 1;
motorConnectorHeight = 4;
motorBodyLength = 2*motorGearCapDepth+motorGearDepth+motorMotorDepth+motorMotorCapDepth+motorConnectorDepth;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, -motorShaftDepth, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ motorMotorDiameter/3, motorBodyLength, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ -motorMotorDiameter/3, motorBodyLength, 0 ], [ 0, 0, 1 ], 180 ],
];

module actPlanetaryGearMotorHDPrecision( p = 0, info = false ) {
  moPresent( positions, p, info )
    rotate( [-90,0,0] ){
      color( Steel ) {
        translate([0,0,-motorShaftDepth/2])
          cylinder( h = motorShaftDepth, r = motorShaftDiameter/2, center = true  );
        translate([0,0,motorGearCapDepth+motorGearDepth/2])
          cylinder( h = motorGearDepth, r = motorGearDiameter/2, center = true  );
        translate([0,0,2*motorGearCapDepth+motorGearDepth+motorMotorDepth/2])
          cylinder( h = motorMotorDepth, r = motorMotorDiameter/2, center = true  );
        translate([motorMotorDiameter/3,0,2*motorGearCapDepth+motorGearDepth+motorMotorDepth+motorMotorCapDepth+motorConnectorDepth/2])
          cube( [ motorConnectorWidth, motorConnectorHeight, motorConnectorDepth ], center = true  );
        translate([-motorMotorDiameter/3,0,2*motorGearCapDepth+motorGearDepth+motorMotorDepth+motorMotorCapDepth+motorConnectorDepth/2])
          cube( [ motorConnectorWidth, motorConnectorHeight, motorConnectorDepth ], center = true  );
      }
      color( [0.4,0.4,0.4] ){
        translate([0,0,-motorGearShoulderDepth/2])
          cylinder( h = motorGearShoulderDepth, r = motorGearShoulderDiameter/2, center = true  );
        translate([0,0,motorGearCapDepth/2])
          cylinder( h = motorGearCapDepth, r = motorGearCapDiameter/2, center = true  );
        translate([0,0,motorGearCapDepth+motorGearDepth+motorGearCapDepth/2])
          cylinder( h = motorGearCapDepth, r = motorGearCapDiameter/2, center = true );
      }
      color( [0.15,0.15,0.55] ) {
        translate([0,0,2*motorGearCapDepth+motorGearDepth+motorMotorDepth+motorMotorCapDepth+motorMotorEndCapDepth/2])
          cylinder( h = motorMotorEndCapDepth, r = motorMotorEndCapDiameter/2, center = true  );
        translate([0,0,2*motorGearCapDepth+motorGearDepth+motorMotorDepth+motorMotorCapDepth/2])
          cylinder( h = motorMotorCapDepth, r = motorMotorCapDiameter/2, center = true );
      }
   }
}

function actPlanetaryGearMotorHDPrecisionPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actPlanetaryGearMotorHDPrecisionPosition( 2 ) )
  actPlanetaryGearMotorHDPrecision( 0, info = true, $name = true );
