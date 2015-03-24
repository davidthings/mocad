include <../mo/mo.scad>

use <actHubHolePattern0_77.scad>

HubHeight  = 0.25 * in;
HubFlangeHeight  = 0.102 * in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, HubHeight, 0 ], [ 0, 0, 1 ], 180 ]
];

FlangeSetSub = [ [ 0, HubFlangeHeight, 0 ], [ 0, 0, 1 ], 180 ];


PatternHoles = 9;

module actHubAdapterA( sp, info = false ) {

  moMoveOriginTo( actHubAdapterAPosition( sp ) ) 
  {
    color( Aluminum )
        import("./stl/actobotics_hub_adapter_a.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : PatternHoles - 1 ] ) {
          moMoveTo( actHubAdapterAPosition( [ si, pi ] ) ) {
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

function actHubAdapterAPosition( sipi ) = moCombinePositions( ( sipi[ 0 ] == 1 && ( sipi[ 1 ] != 0 && sipi[ 1 ] % 2 == 0 ) ) ? FlangeSetSub : 
                                                                                                                         sets[ sipi[ 0 ] ], 
                                                        actHubHolePattern0_77Position( sipi[ 1 ] ) );

moMoveOriginTo( actHubAdapterAPosition( [ 0, 2 ] ) )
  actHubAdapterA( [ 0, 0 ], info = true, $name = true );
