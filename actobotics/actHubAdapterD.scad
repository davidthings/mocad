include <../mo/mo.scad>

use <actHubHolePattern1_5.scad>
use <actHubHolePattern0_77.scad>

HubHeight  = 0.125 * in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, HubHeight, 0 ], [ 0, 0, 1 ], 180 ]
];

HolePatternHoles = 9;
HolePatternHolesLarge = 9 - 1; // gonna skip the center
TotalHolePatternHoles = HolePatternHoles + HolePatternHolesLarge;

module actHubAdapterD( sp, info = false ) {

  moMoveOriginTo( actHubAdapterDPosition( sp ) ) 
  {
    color( Aluminum )
        import("./stl/actobotics_hub_adapter_d.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : TotalHolePatternHoles - 1 ] ) {
          moMoveTo( actHubAdapterDPosition( [ si, pi ] ) ) {
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

function actHubAdapterDPosition( sipi ) = moCombinePositions( sets[ sipi[ 0 ] ], 
                                                ( sipi[ 1 ] < HolePatternHoles ) ?
                                                      actHubHolePattern0_77Position( sipi[ 1 ] ) :
                                                      actHubHolePattern1_5Position( 1 + sipi[ 1 ] - HolePatternHoles  ) );

moMoveOriginTo( actHubAdapterDPosition( [ 1, 0 ] ) )
  actHubAdapterD( [ 0, 0 ], info = true, $name = true );

