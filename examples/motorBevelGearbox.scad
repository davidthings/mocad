include <../mo/mo.scad>
use <../actobotics/actMotorMountPlanetaryB.scad>
use <../actobotics/actPlanetaryGearMotorHDPrecision.scad>
use <../actobotics/actHubMountQuad90C.scad>
use <../actobotics/actBevelGear32Pitch16Tooth4.scad>
use <../actobotics/actBevelGear32Pitch32Tooth0_25.scad>
use <../mocad/moShaft.scad>
use <../mocad/moSpacer.scad>
use <../actobotics/actAluminumChannel1_5.scad>
use <../actobotics/actBallBearingFlanged0_25.scad>
use <../actobotics/actCollarSetScrew0_25.scad>

module motorBevelGearbox( p = 0, a = 0, info = false ) {
  moMoveOriginTo( smallMotorBevelGearboxPosition( p, a ) )  {
    $name = false;
    moFlip() {
      moPose( [0, 2 * a ,0 ] )
        actBevelGear32Pitch16Tooth4( );
      moMoveTo( moReorientPosition( actBevelGear32Pitch16Tooth4Position( 2 ), moIdentityPosition ) )
        moYaw() {
          moPose( [0, a + 5, 0 ] ) {
            moShaft( l = 2.5 * in );
            actBevelGear32Pitch32Tooth0_25( 2 );
            moPose( 0, [ 0, 0.575 * in, 0 ] ) 
              moSpacer();
            moPose( 0, [ 0, -0.575 * in, 0 ] ) 
              moSpacer();
            moPose( [ 0, 0, 0 ], [ 0, -0.55 * in, 0 ] ) 
              actCollarSetScrew0_25();
          }
          moPose( [ 0, 0, 0 ], [ 0, 0.653 * in, 0 ] ) 
            actBallBearingFlanged0_25( 2 );
          moPose( [ 0, 0, 180 ], [ 0, -0.653 * in, 0 ] ) 
            actBallBearingFlanged0_25( 2 );
        }
    }
    moFlip()
      actHubMountQuad90C();
    actMotorMountPlanetaryB( 1 );
    moMoveTo( actMotorMountPlanetaryB( 0 ) )
        actPlanetaryGearMotorHDPrecision();
    if ( info == true ) {
      for ( pi = [ 0 : 3 ] )
        moMoveTo( motorBevelGearboxPosition( pi, a ) )
          moPosition( pi );
    }
  }
  if ( info == true )
    moPartOrigin();
  if ( $name )
    moPose( 0, [ 0, -2 * in, 0 ] )
      moPartLabel( parent_module( 2 ) );
}


a = moSuperSmoothAnimationCycle( 0, 0.7, 90 );

motorBevelGearbox( a = a, info = true, $name = true );

actAluminumChannel1_5( [ 6, 0 ] );

function motorBevelGearboxPosition( p, a ) = ( p == 0 ) ? [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ] :
                                                               moCombinePositions( moReorientPosition( moInvertPosition( actBevelGear32Pitch16Tooth4Position( 2 ) ), moYawPosition( ( p == 3 ) ? -90 : 90 ) ),
                                                                                  [ [ 0, ( p > 1 ) ? -1.25 * in : 0, 0 ], [ 0, 1, 0 ], ( p == 3  ) ? a : -a ] );

