include <../mo/mo.scad>

motorShaftDepth = 14;
motorShaftDiameter = 4;
motorGearShoulderDepth = 2;
motorGearShoulderDiameter = 12;
motorGearCapDepth = 3;
motorGearCapDiameter = 22;
motorGearDepth = 8.2;
motorGearDiameter = 22;
motorMotorDepth = 27.5;
motorMotorDiameter = 21.6;
motorMotorCapDepth = 2;
motorMotorCapDiameter = 21.6;
motorMotorEndCapDepth = 2;
motorMotorEndCapDiameter = 8;
motorConnectorDepth = 5;
motorConnectorWidth = 1;
motorConnectorHeight = 3;

motorBodyLength = 2*motorGearCapDepth+motorGearDepth+motorMotorDepth+motorMotorCapDepth+motorConnectorDepth;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, -motorShaftDepth, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ motorMotorDiameter/3, motorBodyLength, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ -motorMotorDiameter/3, motorBodyLength, 0 ], [ 0, 0, 1 ], 180 ],
];

module actPlanetaryGearMotorPrecision( p = 0, info = false ) {
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
      color( [0.1,0.1,0.1] ){
        translate([0,0,-motorGearShoulderDepth/2])
          cylinder( h = motorGearShoulderDepth, r = motorGearShoulderDiameter/2, center = true  );
        translate([0,0,motorGearCapDepth/2])
          cylinder( h = motorGearCapDepth, r = motorGearCapDiameter/2, center = true  );
        translate([0,0,motorGearCapDepth+motorGearDepth+motorGearCapDepth/2])
          cylinder( h = motorGearCapDepth, r = motorGearCapDiameter/2, center = true );
        translate([0,0,2*motorGearCapDepth+motorGearDepth+motorMotorDepth+motorMotorCapDepth+motorMotorEndCapDepth/2])
          cylinder( h = motorMotorEndCapDepth, r = motorMotorEndCapDiameter/2, center = true  );
        translate([0,0,2*motorGearCapDepth+motorGearDepth+motorMotorDepth+motorMotorCapDepth/2])
          cylinder( h = motorMotorCapDepth, r = motorMotorCapDiameter/2, center = true );
      }
   } 
}

function actPlanetaryGearMotorPrecisionPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actPlanetaryGearMotorPrecisionPosition( 1 ) )
  actPlanetaryGearMotorPrecision( 0, info = true, $name = true );
