include <../mo/mo.scad>

use <actHubHolePattern1_5.scad>

HubHeight  = 0.25 * in;
HubFlangeHeight  = 0.1 * in;
HubFlangeOffset  = HubHeight - HubFlangeHeight;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, HubHeight, 0 ], [ 0, 0, 1 ], 180 ]
];

FlangeSetSub = [ [ 0, HubFlangeOffset, 0 ], [ 0, 0, 1 ], 0 ];

PatternHoles = 9;

module actHubAdapterC( sp, info = false ) {

  moMoveOriginTo( actHubAdapterCPosition( sp ) ) 
  {
    color( Aluminum )
        import("./stl/actobotics_hub_adapter_c.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : PatternHoles - 1 ] ) {
          moMoveTo( actHubAdapterCPosition( [ si, pi ] ) ) {
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

function actHubAdapterCPosition( sipi ) = moCombinePositions( ( sipi[ 0 ] == 0 && ( sipi[ 1 ] != 0 && sipi[ 1 ] % 2 == 1 ) ) ? FlangeSetSub : 
                                                                                                                 sets[ sipi[ 0 ] ], 
                                                        actHubHolePattern1_5Position( sipi[ 1 ] ) );

moMoveOriginTo( actHubAdapterCPosition( [ 1, 0 ] ) )
  actHubAdapterC( [ 0, 0 ], info = true, $name = true );
