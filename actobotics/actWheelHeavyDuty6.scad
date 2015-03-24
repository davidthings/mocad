include <../mo/mo.scad>

use <actHubHolePattern1_5.scad>
use <actHubHolePattern0_77.scad>

HubHeight  = 0.375 * in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, HubHeight, 0 ], [ 0, 0, 1 ], 180 ]
];

HolePatternHoles = 9;
HolePatternHolesLarge = 9 - 1; // gonna skip the center
TotalHolePatternHoles = HolePatternHoles + HolePatternHolesLarge * 4;

module actWheelHeavyDuty6( sp, info = false ) {

  moMoveOriginTo( actWheelHeavyDuty6Position( sp ) ) 
  {
    color( BlackABS )
        import("./stl/actobotics_6_heavy_duty_wheel.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : TotalHolePatternHoles - 1 ] ) {
          moMoveTo( actWheelHeavyDuty6Position( [ si, pi ] ) ) {
            moPosition2( [ si, pi ] );
          }
        }
      }
    }
  }
  if ( info == true )
    moPartOrigin();  
  if ( $name == true )
    moPartLabel( parent_module(1) );
}

function actWheelHeavyDuty6PositionRing( i ) = ( 1 + 0.667 * floor( ( i ) / ( HolePatternHoles - 1 ) )) * actHubHolePattern1_5Position( 1 + ( i % HolePatternHolesLarge ) );

function actWheelHeavyDuty6Position( sipi ) = moCombinePositions( 
                                                sets[ sipi[ 0 ] ], 
                                                ( sipi[ 1 ] < HolePatternHoles ) ?
                                                      actHubHolePattern0_77Position( sipi[ 1 ] ) :
                                                      actWheelHeavyDuty6PositionRing( sipi[ 1 ] - HolePatternHoles ) );

moMoveOriginTo( actWheelHeavyDuty6Position( [ 1, 0 ] ) )
  actWheelHeavyDuty6( [ 0, 0 ], info = true, $name = true );

