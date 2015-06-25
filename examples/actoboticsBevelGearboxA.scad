
use <../mocad/moShaft.scad>
use <../actobotics/actBearingMountFlat0_25.scad>					// act1_4BoreFlatBearingMount()
use <../actobotics/actCollarSetScrew0_25.scad>
use <../actobotics/actAluminumChannel1_5.scad>							// act1_5AluminumChannel()
use <../actobotics/actBevelGear32Pitch24Tooth0_25.scad>
use <motorOnMount.scad>

include <../mo/mo.scad>

// How to best turn this into a part

// Need build command

module actBevelGearboxA( p, outputShaftLength = 2.5 * in, inputShaftLength = 1 * in, info = false ) {
  moMoveOriginTo( actAluminumChannel1_5Position( p ) ) {
    actAluminumChannel1_5( info = info );

    moMoveTo( actAluminumChannel1_5Position( [ 4, 0 ] ), t = -0.5 * in) {
     	moPose( [ 0,  360*$t, 0], [ 0, 0, 0 ] ){

      if ( outputShaftLength > 0 )
	     moShaft( 1, l = outputShaftLength, d = 0.25 * in );
      translate( [ 0, 0.585 * in, 0 ] )
        actBevelGear32Pitch24Tooth0_25( );
      translate( [ 0, 1.75 * in, 0 ] )
        actCollarSetScrew0_25( 0 );
    }}

   // output bearings
	moMoveTo( actAluminumChannel1_5Position( [ 4, 0 ] ) )
	  moFlip()
       actBearingMountFlat0_25( 0 );
	moMoveTo( actAluminumChannel1_5Position( [ 2, 0 ] ) )
     moFlip()
	    actBearingMountFlat0_25( 0 );

   // input shaft
	moPose( [ 0,  360*$t, 180], [ 0, 0.48 * in, 0 ] ){
     if ( inputShaftLength > 0 )
  	    moShaft( 1, l = 2 * in, d = 0.25 * in );
	  actBevelGear32Pitch24Tooth0_25( 1 );
	}
  }
}

function actBevelGearboxAPosition( p ) = actAluminumChannel1_5Position( p );

moMoveOriginTo( actBevelGearboxAPosition([ 0, 0 ] ) ) {
  actBevelGearboxA( 0, outputShaftLength = 2.5 * in, inputShaftLength = 0 * in );
  #moFlip()
    motorOnMount();
}



