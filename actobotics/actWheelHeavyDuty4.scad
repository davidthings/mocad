include <../mo/mo.scad>

use <actHubHolePattern1_5.scad>
use <actHubHolePattern0_77.scad>

HubHeight  = 0.25 * in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, HubHeight, 0 ], [ 0, 0, 1 ], 180 ]
];

HolePatternHoles = 9;
HolePatternHolesLarge = 9 - 1; // gonna skip the center
TotalHolePatternHoles = HolePatternHoles + HolePatternHolesLarge * 4;

module actWheelHeavyDuty4( sp, info = false ) {

  moMoveOriginTo( actWheelHeavyDuty4Position( sp ) ) 
  {
    color( BlackABS )
        import("./stl/actobotics_4_heavy_duty_wheel.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : TotalHolePatternHoles - 1 ] ) {
          moMoveTo( actWheelHeavyDuty4Position( [ si, pi ] ) ) {
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

function actWheelHeavyDuty4PositionRing( i ) = ( 1 + 0.333 * floor( ( i ) / ( HolePatternHoles - 1 ) )) * actHubHolePattern1_5Position( 1 + ( i % HolePatternHolesLarge ) );

function actWheelHeavyDuty4Position( sipi ) = moCombinePositions( 
                                                sets[ sipi[ 0 ] ], 
                                                ( sipi[ 1 ] < HolePatternHoles ) ?
                                                      actHubHolePattern0_77Position( sipi[ 1 ] ) :
                                                      actWheelHeavyDuty4PositionRing( sipi[ 1 ] - HolePatternHoles ) );

moMoveOriginTo( actWheelHeavyDuty4Position( [ 1, 0 ] ) )
  actWheelHeavyDuty4( [ 0, 0 ], info = true, $name = true );

