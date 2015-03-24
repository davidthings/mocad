include <../mo/mo.scad>

motorShaftOffset = 7;
motorShaftDepth = 21;
motorShaftDiameter = 6;
motorGearShoulderDepth = 6;
motorGearShoulderDiameter = 12;
motorGearDepth = 24.5;
motorGearDiameter = 37;
motorMotorDepth = 40;
motorMotorDiameter = 34.5;
motorMotorCapDepth = 2;
motorMotorCapDiameter = 21.6;
motorMotorEndCapDepth = 2;
motorMotorEndCapDiameter = 8;
motorConnectorDepth = 4.4;
motorConnectorWidth = 0.5;
motorConnectorHeight = 2.5;
motorMountScrewCircle = 31;
motorMountScrewDiameter = 3;
motorMountScrewX = 7;
motorMountScrewZ = 13; // guestimating
motorMountScrewDepth = 6;

motorBodyLength = motorGearDepth+motorMotorDepth+motorConnectorDepth;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, -motorShaftOffset ], [ 0, 0, 1 ], 0 ],
  [ [ 0, -motorShaftDepth, -motorShaftOffset ], [ 0, 0, 1 ], 0 ],
  [ [ 0, -motorGearShoulderDepth, -motorShaftOffset ], [ 0, 0, 1 ], 0 ],
  [ [ motorMotorDiameter/3, motorBodyLength, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ -motorMotorDiameter/3, motorBodyLength, 0 ], [ 0, 0, 1 ], 180 ],
];

module actGearMotorPrecision( p = 0, info = false ) {
  moPresent( positions, p, info )
    rotate( [-90,0,0] ){
      color( Steel ) {
        translate( [ 0, motorShaftOffset, 0 ] ) {
          translate([0,0,-motorShaftDepth/2])
            cylinder( h = motorShaftDepth, r = motorShaftDiameter/2, center = true  );
          translate([0,0,-motorGearShoulderDepth/2])
            cylinder( h = motorGearShoulderDepth, r = motorGearShoulderDiameter/2, center = true  );
        }
        translate([0,0,motorGearDepth/2]) {
          difference() 
          {
            cylinder( h = motorGearDepth, r = motorGearDiameter/2, center = true  );      
            translate( [ motorMountScrewCircle/2, 0, -motorGearDepth/2+motorMountScrewDepth / 2 - Epsilon ] )
              cylinder( h = motorMountScrewDepth, d = motorMountScrewDiameter, center = true  );      
            translate( [ -motorMountScrewCircle/2, 0, -motorGearDepth/2+motorMountScrewDepth / 2 - Epsilon ] )
              cylinder( h = motorMountScrewDepth, d = motorMountScrewDiameter, center = true  );      

            translate( [ motorMountScrewX, motorMountScrewZ, -motorGearDepth/2+motorMountScrewDepth / 2 - Epsilon ] )
              cylinder( h = motorMountScrewDepth, d = motorMountScrewDiameter, center = true  );      
            translate( [ -motorMountScrewX, motorMountScrewZ, -motorGearDepth/2+motorMountScrewDepth / 2 - Epsilon ] )
              cylinder( h = motorMountScrewDepth, d = motorMountScrewDiameter, center = true  );      
            
            translate( [ motorMountScrewX, -motorMountScrewZ, -motorGearDepth/2+motorMountScrewDepth / 2 - Epsilon ] )
              cylinder( h = motorMountScrewDepth, d = motorMountScrewDiameter, center = true  );      
            translate( [ -motorMountScrewX, -motorMountScrewZ, -motorGearDepth/2+motorMountScrewDepth / 2 - Epsilon ] )
              cylinder( h = motorMountScrewDepth, d = motorMountScrewDiameter, center = true  );      

          }
        }
        translate([motorMotorDiameter/3,0,motorGearDepth+motorMotorDepth+motorConnectorDepth/2])
          cube( [ motorConnectorWidth, motorConnectorHeight, motorConnectorDepth ], center = true  );
        translate([-motorMotorDiameter/3,0,motorGearDepth+motorMotorDepth+motorConnectorDepth/2])
          cube( [ motorConnectorWidth, motorConnectorHeight, motorConnectorDepth ], center = true  );
      }
      color( Brass ) {
        translate([0,0,motorGearDepth+motorMotorDepth/2])
          cylinder( h = motorMotorDepth, r = motorMotorDiameter/2, center = true  );
      }
   } 
}

function actGearMotorPrecisionPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actGearMotorPrecisionPosition( 1 ) )
  actGearMotorPrecision( 0, info = true, $name = true );
