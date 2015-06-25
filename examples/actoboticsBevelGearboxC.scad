use <../mocad/moShaft.scad>
use <../actobotics/actBearingMountFlat0_25.scad>					// act1_4BoreFlatBearingMount()
use <../actobotics/actCollarSetScrew0_25.scad>
use <../actobotics/actAluminumChannel6_0.scad>							// act1_5AluminumChannel()
use <../actobotics/actBevelGear32Pitch24Tooth0_25.scad>				
use <../actobotics/actCrossoverPlateA.scad>
use <../actobotics/actHubMountQuad90C.scad>
use <../actobotics/actMotorMountPlanetaryB.scad>
use <../actobotics/actPlanetaryGearMotorHDPrecision.scad>
use <../actobotics/actChannelCubeExternalPattern.scad> 

use <motorOnMount.scad>

include <../mo/mo.scad>

module actBevelGearboxC( p, outputShaftLength = 2.5 * in, inputShaftLength = 1 * in, info = false ) {
{
  moMoveOriginTo( actChannelCubeExternalPatternPosition( p ) ) {

    actChannelCubeExternalPattern( info = info );

    // output shaft
    moMoveTo( actChannelCubeExternalPatternPosition( [ 1, 0 ] ), 0.75 * in ) {
      if ( outputShaftLength > 0 )
	     moShaft( 0, l = outputShaftLength, d = 0.25 * in );
      moMoveTo( moShaftPosition( 0 ), 0.65 * in )
        moFlip()
          actBevelGear32Pitch24Tooth0_25( );
      moMoveTo( moShaftPosition( 0 ), -0.65 * in )
   	     actCollarSetScrew0_25( 0 );
	  }
	
     // output bearings
	  moMoveTo( actChannelCubeExternalPatternPosition( [ 1, 0 ] ) )
	    moFlip()
         actBearingMountFlat0_25( 0 );
	  moMoveTo( actChannelCubeExternalPatternPosition( [ 3, 0 ] ) )
       moFlip()
	      actBearingMountFlat0_25( 0 );
	
     // input shaft
	 moPose( [ 0,  360*$t, 0 ], [ 0, 0.08 * in, 0 ] ){
      if ( inputShaftLength > 0 )
  	     moShaft( 1, l = 2 * in, d = 0.25 * in );
	   actBevelGear32Pitch24Tooth0_25( 0);
    }
    }

    moFlip() { 
      moFlip() 
        actHubMountQuad90C( 0 );
      motorOnMount( );
    }
  }
}

function actBevelGearboxCPosition( p ) = actChannelCubeExternalPatternPosition( p );


moMoveTo( actBevelGearboxCPosition([ 0, 0 ] ) ) {

  //intersection() 
  {
  actBevelGearboxC( 0, outputShaftLength = 2.5 * in, inputShaftLength = 0 * in, info = false );

  moMoveTo( actBevelGearboxCPosition( [ 5, 0 ] ) )
    actAluminumChannel6_0();
  }
}



