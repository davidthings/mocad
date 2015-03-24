use <../mocad/moShaft.scad>
use <../actobotics/actBearingMountFlat0_25.scad>					// act1_4BoreFlatBearingMount()
use <../actobotics/actCollarSetScrew0_25.scad>
use <../actobotics/actAluminumChannel1_5.scad>							// act1_5AluminumChannel()
use <../actobotics/actBevelGear32Pitch24Tooth0_25.scad>				
use <../actobotics/actCrossoverPlateA.scad>
use <../actobotics/actHubMountQuad90C.scad>
use <../actobotics/actMotorMountPlanetaryB.scad>
use <../actobotics/actPlanetaryGearMotorHDPrecision.scad>

use <motorOnMount.scad>

include <../mo/mo.scad>

/*
Best practices for building parts
- write parts as modules (just like regular coding)
- use the shape selector to select parts
- when creating an assembly, decide on the anchor part, reference frame
- place that part and set its info on
- when adding new parts, first show them alone (using ! trick)
*/

module actBevelGearboxB( p, outputShaftLength = 2.5 * in, inputShaftLength = 1 * in, info = false ) {
  { 
    actAluminumChannel1_5( info = info );
	
    moMoveTo( actAluminumChannel1_5Position( [ 4, 0 ] ), t = -1 * in )
    // output shaft
	  moPose( [ 0, 360*$t, 0 ], [ 0, 0.5 * in, 0 ] ) {
       if ( outputShaftLength > 0 )
	      moShaft( 1, l = outputShaftLength, d = 0.25 * in );
	    moPose( t = [ 0, 0.58* in, 0 ] )
	      actBevelGear32Pitch24Tooth0_25( );
	    moPose( t = [ 0, 1.65*in, 0 ] )
	      actCollarSetScrew0_25( 0 );
	  }
	
   // output bearings
	moMoveTo( actAluminumChannel1_5Position( [ 4, 0 ] ) )
	  moFlip()
       actBearingMountFlat0_25( 0 );
	moMoveTo( actAluminumChannel1_5Position( [ 2, 0 ] ) )
     moFlip()
	    actBearingMountFlat0_25( 0 );
	
   // input shaft
	moPose( [ 0,  360*$t, 180 ], [ 0, -0.53 * in, 0 ] ){
     if ( inputShaftLength > 0 )
  	    moShaft( 1, l = 2 * in, d = 0.25 * in );
	  moMoveTo( moShaftPosition( 1, l = 2 * in ) )
      actBevelGear32Pitch24Tooth0_25( 1);
	}
  }

 moFlip() {
    actCrossoverPlateA( 0, info = false );
   moMoveTo( actCrossoverPlateAPosition(0) ) {
      moFlip()     
        actHubMountQuad90C( 0 );
      moMoveTo( actCrossoverPlateAPosition( 1 ) )
        moFlip()
          #motorOnMount( );
     }
  }

}

function actBevelGearboxBPosition( p ) = actAluminumChannel1_5Position( p );

moMoveTo( actBevelGearboxBPosition([ 0, 0, 0 ] ) )
  actBevelGearboxB( 0, outputShaftLength = 2.5 * in, inputShaftLength = 2 * in, info = false );


