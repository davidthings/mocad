use <../actobotics/actAluminumChannel12.scad>
use <../actobotics/actWheelHeavyDuty4.scad>
use <../actobotics/actWheelHeavyDuty6.scad>
use <../actobotics/actHubAdapterD.scad>
use <../mocad/moShaft.scad>
use <../actobotics/actCollarSetScrew0_25.scad>
use <../actobotics/actHubSwivel.scad>
use <../actobotics/actChannelBracketB.scad>
use <../actobotics/actMotorMountClamping37.scad>
use <../actobotics/actHubSpacer_1_0.scad>
use <../actobotics/actBallBearingFlanged0_25.scad>
use <../actobotics/actSetScrewHub0_77Spacing0_25.scad>
use <../actobotics/actSetScrewHub0_77Spacing6.scad>
use <../actobotics/actGearMotorPrecision.scad>
use <../mocad/moSocketHeadCapScrew6_32.scad>
use <../mocad/moLogo.scad>

include <../mo/mo.scad>

// act3WheelBotParts( );

$time = 0;

translate( [ 20 * in, -10 * in, 0 ] )
  rotate( [ 0, 0, 25 ] )
  scale( [ 2, 2, 2 ] )
    moLogo();

module act3WheelBotParts() {
  $name = true;

  moGridParts( [ 0, 10 * in, 0], [ 4 * in, 0, 0 ], rotate = 20 ) {
    union(){ moPartLabel( "moSocketHeadCapScrew6_32" );
      moDuplicatedParts(  [ 0, 0, 0 ], [ 0, 1 * in, 0 ], 24, rotate = 0 )
        moSocketHeadCapScrew6_32( l=0.25 * in,$name = false ); }
    moDuplicatedParts(  [ 0, 0, 0 ], [ 0, 4 * in, 0 ], 2, rotate = 0 )
      actBallBearingFlanged0_25();
    actHubSwivel(  );
    actHubSpacer_1_0();
    moDuplicatedParts(  [ 0, 0, 0 ], [ 0, 4 * in, 0 ], 2 )
      actHubAdapterD();
    moDuplicatedParts(  [ 0, 0, 0 ], [ 0, 4 * in, 0 ], 2 )
      actCollarSetScrew0_25();
    actSetScrewHub0_77Spacing0_25();
    moDuplicatedParts(  [ 0, 0, 0 ], [ 0, 4 * in, 0 ], 2 )
    actSetScrewHub0_77Spacing6();
    moDuplicatedParts(  [ 0, 0, 0 ], [ 0, 4 * in, 0 ], 2 )
      moShaft();
    moDuplicatedParts(  [ 0, 0, 0 ], [ 0, 4 * in, 0 ], 2 )
      actGearMotorPrecision();
    moDuplicatedParts(  [ 0, 0, 0 ], [ 0, 4 * in, 0 ], 2 )
      actMotorMountClamping37();
    actChannelBracketB();
    actWheelHeavyDuty4();
    moDuplicatedParts(  [ 0, 0, 0 ], [ 0, 4 * in, 0 ], 2 )
      actWheelHeavyDuty6();
    moDuplicatedParts(  [ 0, 0, 0 ], [ 0, 4 * in, 0 ], 2 )
      actAluminumChannel12();
  }
}


act3WheelBot();

module act3WheelBot() {
  // Main Channel Location - just make it up, find reference points
  mainChannelOrigin = [ [ 0, 0, 0 ], [ 1, 0, 0 ], 90 ];
  mainChannelFront = actAluminumChannel12Position( [ 0, 0, 0 ] );
  mainChannelRear = actAluminumChannel12Position( [ 14, 0, 0 ] );

  // Shift the channel to the correct location
  moMoveTo( mainChannelOrigin )
    actAluminumChannel12(  );
  
  // Make and place the Spacer
  channelToSpacerJoint = moFlipPosition;
  spacer = moAttachPosition( mainChannelOrigin, mainChannelFront, channelToSpacerJoint, 0 );
  spacerBase = actHubSpacer_1_0Position( [1,0] ); 
  moAttach( mainChannelOrigin, mainChannelFront, channelToSpacerJoint )
    actHubSpacer_1_0( );
  
  // Make and place the Swivel
  channelToSwivelJoint = moFlipPosition;
  swivel = moAttachPosition( mainChannelOrigin, mainChannelRear, channelToSwivelJoint ); 
  swivelBase = actHubSwivelPosition( [ 1, 0 ] ); 
  moAttach( mainChannelOrigin, mainChannelRear, channelToSwivelJoint )
    actHubSwivel( );
    
  // Add the show screws
  moAttach( mainChannelOrigin, actAluminumChannel12Position( [0,3,13] ) )
    moSocketHeadCapScrew6_32( l=0.25 * in); 
  moAttach( mainChannelOrigin, actAluminumChannel12Position( [0,3,15] ) )
    moSocketHeadCapScrew6_32( l=0.25 * in); 
  moAttach( mainChannelOrigin, actAluminumChannel12Position( [0,3,21] ) )
    moSocketHeadCapScrew6_32( l=0.25 * in); 
  moAttach( mainChannelOrigin, actAluminumChannel12Position( [0,3,11] ) )
    moSocketHeadCapScrew6_32( l=0.25 * in); 
// Add the show screws
  moAttach( mainChannelOrigin, actAluminumChannel12Position( [14,3,13] ) )
    moSocketHeadCapScrew6_32( l=0.25 * in); 
  moAttach( mainChannelOrigin, actAluminumChannel12Position( [14,3,15] ) )
    moSocketHeadCapScrew6_32( l=0.25 * in); 
  moAttach( mainChannelOrigin, actAluminumChannel12Position( [14,3,21] ) )
    moSocketHeadCapScrew6_32( l=0.25 * in); 
  moAttach( mainChannelOrigin, actAluminumChannel12Position( [14,3,11] ) )
    moSocketHeadCapScrew6_32( l=0.25 * in); 

  // Make and place the second channel
  spacerToChannelJoint = moCombinePositions( moFlipPosition, moRollPosition( 90 ) );
  echo( spacerToChannelJoint );
  driveChannelMid = actAluminumChannel12Position( [ 7, 0, 0 ] );
  driveChannel = moAttachPosition( spacer, spacerBase, spacerToChannelJoint, driveChannelMid );
  moAttach( spacer, spacerBase, spacerToChannelJoint, driveChannelMid )
      actAluminumChannel12(   );
  
  castorJoint = moFlipPosition;
  moAttach( swivel, swivelBase, castorJoint )
    act3WheelCastor();

  driveChannelLeft = actAluminumChannel12Position( [ 14, 2, 25 ] );
  moAttach( driveChannel, driveChannelLeft, moFlipPosition )
    act3WheelDriveMotor( left = true );

  driveChannelRight = actAluminumChannel12Position( [ 0, 2, 6] );
  moAttach( driveChannel, driveChannelRight, moFlipPosition )
    act3WheelDriveMotor( left = false );

}

//act3WheelDriveMotor( left = true );

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

//!actMotorMountClamping37( info = true, $name = true  );


//act3WheelCastor();

module act3WheelCastor()  {
  channelBracketOrigin = moOriginPosition;
  channelBracketLeftSide = actChannelBracketBPosition( [18,0] );
  channelBracketRightSide = actChannelBracketBPosition( [19,0] );
  
  moMoveTo( channelBracketOrigin )
    actChannelBracketB(  );

  // Bearings
  bearingFlangePosition = actBallBearingFlanged0_25Position( 2 );
  bearingOutsidePosition = actBallBearingFlanged0_25Position( 1 );
  
  echo( bearingFlangePosition = bearingFlangePosition );
  echo( bearingOutsidePosition = bearingOutsidePosition );
  
  leftBearingJoint = 0; 
  leftBearingOrigin = moAttachPosition( channelBracketOrigin, channelBracketLeftSide, leftBearingJoint, bearingFlangePosition );
  moAttach( channelBracketOrigin, channelBracketLeftSide, leftBearingJoint, bearingFlangePosition )
    actBallBearingFlanged0_25( );

  rightBearingJoint = 0; //moFlipPosition; 
  rightBearingOrigin = moAttachPosition( channelBracketOrigin, channelBracketRightSide, rightBearingJoint, bearingFlangePosition );
  moAttach( channelBracketOrigin, channelBracketRightSide, rightBearingJoint, bearingFlangePosition )
    actBallBearingFlanged0_25(  );

  collarOutside = actCollarSetScrew0_25Position( 1 );
  leftCollarJoint = moFlipPosition;
  leftCollarOrigin = moAttachPosition( leftBearingOrigin, bearingOutsidePosition, leftCollarJoint );

  moAttach( leftBearingOrigin, bearingOutsidePosition, leftCollarJoint )
    actCollarSetScrew0_25( );
    
  rightCollarJoint = moFlipPosition;
  moAttach( rightBearingOrigin, bearingOutsidePosition, rightCollarJoint )
    actCollarSetScrew0_25();
    
  shaftLength = 2.15*in;
  shaftEnd = moShaftPosition( 1, l=shaftLength );
  shaftOtherEnd = moShaftPosition( 2, l=shaftLength );

  shaftMiddle = moShaftPosition( 0, l=shaftLength );
  shaftOrigin = moAttachPosition( leftCollarOrigin, collarOutside, 0, shaftEnd );
  moAttach( leftCollarOrigin, collarOutside, 0, shaftEnd )
    moShaft( l=shaftLength, info = true );
  
  hubPosition = moAttachPosition( shaftOrigin, shaftMiddle );
  hubMountPosition = actSetScrewHub0_77Spacing0_25Position( 2 );
  moAttach( shaftOrigin, shaftMiddle )
    actSetScrewHub0_77Spacing0_25(  );
    
  wheelJoint = moFlipPosition;
  moAttach( hubPosition, hubMountPosition, wheelJoint, 0 )
    actWheelHeavyDuty4();
}


