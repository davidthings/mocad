include <../mo/mo.scad>

use <actHubHolePattern0_77.scad>

HubHeight  = 0.375 * in;

// CAD origin is off in space
HubSwivelOffsetX = 1.903 * in;
HubSwivelOffsetY = 0.7852 * in;
HubSwivelOffsetZ = -1.34 * in;
// Swivels are randomly swivelled
HubSwivelOffsetRoll = -10;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, HubHeight, 0 ], [ 0, 0, 1 ], 180 ]
];

PatternHoles = 9;

module actHubSwivel( sp, info = false ) {

  moMoveOriginTo( actHubSwivelPosition( sp ) ) 
  {
    color( Aluminum )
      rotate( [ 0, HubSwivelOffsetRoll, 0 ] )
        translate( [ HubSwivelOffsetX, HubSwivelOffsetY, HubSwivelOffsetZ ] )
          import("./stl/actobotics_swivel_hub.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : PatternHoles - 1 ] ) {
          moMoveTo( actHubSwivelPosition( [ si, pi ] ) ) {
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

function actHubSwivelPosition( sipi ) = moCombinePositions(  sets[ sipi[ 0 ] ], actHubHolePattern0_77Position( sipi[ 1 ] ) );

moMoveOriginTo( actHubSwivelPosition( [ 0, 2 ] ) )
  actHubSwivel( [ 0, 0 ], info = true, $name = true );
