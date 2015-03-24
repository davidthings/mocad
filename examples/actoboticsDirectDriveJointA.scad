use <../mocad/moShaft.scad>
use <../actobotics/actCollarSetScrew0_25.scad>
use <../actobotics/actAluminumChannel6_0.scad>							
use <../actobotics/actAluminumChannel1_5.scad>							
use <../actobotics/actChannelCubeIntExtPattern.scad> 
use <../actobotics/actShaftCouplerSetScrew0_25To6mm.scad>
use <../actobotics/actThrustBearing0_25.scad>
use <../actobotics/actBearingMountFlat0_5.scad>
use <../actobotics/actClampingHub0_77Spacing0_25.scad>

use <motorOnMount.scad>

include <../mo/mo.scad>

$t = 0;

module actDirectDriveJointA( p, outputShaftLength = 2.5 * in, inputShaftLength = 1 * in, info = false ) {

  moMoveOriginTo( actChannelCubeIntExtPatternPosition( p ) ) {

    actChannelCubeIntExtPattern( info = info );

    rotate( [ 0, 45 * sin( $t * 360 ), 0 ] ) {
    // output shaft
    if ( outputShaftLength > 0 )
      moPose( t = [ 0, 0.8 * in, 0 ] )
	     shaft( 1, l = outputShaftLength, d = 0.25 * in, info = false );

      moPose( t = [ 0, 0.27 * in, 0 ] ) {
         actShaftCouplerSetScrew0_25To6mm();
         moMoveTo( actShaftCouplerSetScrew0_25To6mmPosition( 1 ) )
           moFlip()
             actThrustBearing0_25( info = false );    
       }
	  
   moMoveTo( actChannelCubeIntExtPatternPosition( [ 2, 0 ] ) )
     moFlip() {
       actThrustBearing0_25( info = false );    
       moMoveTo( actThrustBearing0_25Position( 1 ) )
         moFlip() {
           moMoveOriginTo( actClampingHub0_77Spacing0_25Position( 1 ) ) {
             actClampingHub0_77Spacing0_25( 0, info = false );
               moMoveTo( actClampingHub0_77Spacing0_25Position( 2 ) ) 
                 moFlip() {
                   moRoll() {
                   actAluminumChannel1_5( info = false );
                     moMoveTo( actAluminumChannel1_5Position( [ 2, 0 ] ) )
                       children();
                   }
                 }
           }
         }
     }

   }

   moMoveTo( actChannelCubeIntExtPatternPosition( [ 8, 0 ] ) ){
     moFlip() {
       actBearingMountFlat0_5( info = false );
     }
   }

     // input shaft
    if ( inputShaftLength > 0 )
      moPose( t = [ 0, -0.25 * in, 0 ] )
  	    shaft( 1, l = 1 * in, d = 0.25 * in );

    moFlip()
      #motorOnMount( );
  }
}

function actDirectDriveJointAPosition( p ) = actChannelCubeIntExtPatternPosition( p );


//difference() 
{

moMoveTo( actDirectDriveJointAPosition([ 5, 0 ] ) ) {

  //intersection() 
  {
  actDirectDriveJointA( [ 0, 0 ], outputShaftLength = 1.25 * in, inputShaftLength = 0 * in, info = false )
    #actDirectDriveJointA( [ 0, 0 ], outputShaftLength = 1.25 * in, inputShaftLength = 0 * in, info = false );

  #moMoveTo( actDirectDriveJointAPosition( [ 0, 0 ] ) )

    #actAluminumChannel6_0( [ 0, 1, 0 ], info = false);
    #moMoveTo( actAluminumChannel6_0Position( [ 0, 2, 0 ] ) )
      actAluminumChannel6_0( [ 10, 8, 0 ], info = false);
  }
}



  // for difference demo
  //translate( [ 0, 6 * in, 0 ] )
  //cube( [ 10 * in,10 * in, 10 * in ], center = true );

}

