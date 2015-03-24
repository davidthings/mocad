include <../mo/mo.scad>

use <actHubHolePattern0_77.scad>

HubSpacerHeight  = 1.0 * in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, HubSpacerHeight, 0 ], [ 0, 0, 1 ], 180 ]
];

PatternHoles = 9;

module actHubSpacer_1_0( sp, info = false ) {

  moMoveOriginTo( actHubSpacer_1_0Position( sp ) ) 
  {
    color( Aluminum )
        moPitch( -1 )
          import("./stl/actobotics_hub_spacer_1_00.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : PatternHoles - 1 ] ) {
          moMoveTo( actHubSpacer_1_0Position( [ si, pi ] ) ) {
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

function actHubSpacer_1_0Position( sipi ) = moCombinePositions(  sets[ sipi[ 0 ] ], actHubHolePattern0_77Position( sipi[ 1 ] ) );

moMoveOriginTo( actHubSpacer_1_0Position( [ 0, 2 ] ) )
  actHubSpacer_1_0( [ 0, 0 ], info = true, $name = true );
