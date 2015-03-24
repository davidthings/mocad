use <../actobotics/actWheelHeavyDuty6.scad>
use <../actobotics/actHubAdapterD.scad>
use <../actobotics/actMotorMountClamping37.scad>
use <../actobotics/actHubSpacer_1_0.scad>
use <../actobotics/actSetScrewHub0_77Spacing0_25.scad>
use <../actobotics/actSetScrewHub0_77Spacing6.scad>
use <../actobotics/actGearMotorPrecision.scad>
use <../mocad/moLogo.scad>

include <../mo/mo.scad>

//difference() {
//  act3WheelDriveMotor( left = true );
//  color( Red )
//    cube( [ 200, 200, 200 ] );
//}

act3WheelDriveMotor( left = true );

module act3WheelDriveMotor( left = true ) {

  clampMountPosition = actMotorMountClamping37Position( 3 );
  clampPosition = moAttachPosition( 0, 0, 0, clampMountPosition ); 
  clampCenter = actMotorMountClamping37Position( ( left ) ? 2 : 1 );
  
  moMoveTo( clampPosition )
    actMotorMountClamping37( );
  
  motorClampJoint = moLinearPosition( ( left ) ? -0.3 * in : -0.5 * in );
  motorPosition = moAttachPosition( clampPosition, clampCenter, motorClampJoint );
  motorShaftPosition = actGearMotorPrecisionPosition( 3 );
  
  moMoveTo( motorPosition )
    actGearMotorPrecision(  );
  
  hubToMotorJoint = moFlipPosition;
  hubOtherSidePosition = actSetScrewHub0_77Spacing6Position( 1 );
  hubPosition = moAttachPosition( motorPosition, motorShaftPosition, hubToMotorJoint );
  moMoveTo( hubPosition )
    actSetScrewHub0_77Spacing6();
  
  hubAdapterPosition = moAttachPosition( hubPosition, hubOtherSidePosition, moFlipPosition );
  hubAdapterOtherSidePosition = actHubAdapterDPosition( [1,0] );

  moMoveTo( hubAdapterPosition )
    actHubAdapterD( );
    
  wheelPosition = moAttachPosition( hubAdapterPosition, hubAdapterOtherSidePosition, moFlipPosition );

  moMoveTo( wheelPosition )
    actWheelHeavyDuty6();
}

