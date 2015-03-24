include <../mo/mo.scad>

use <actAluminumChannelHelper.scad>

module actAluminumChannel4_5( lsp, info = false ) {
  actAluminumChannelHelper( lsp, "stl/actobotics_4.5_aluminum_channel.stl", 5, info );
}

function actAluminumChannel4_5Position( sp ) = actAluminumChannelHelperPosition( sp );

moMoveOriginTo( actAluminumChannel4_5Position( [ 1, 0, 0 ] ) )
  actAluminumChannel4_5( [ 0, 0, 0 ], info = true );

