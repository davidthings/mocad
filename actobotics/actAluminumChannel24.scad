include <../mo/mo.scad>

use <actAluminumChannelHelper.scad>

module actAluminumChannel24( lsp, info = false ) {
  actAluminumChannelHelper( lsp, "stl/actobotics_24_aluminum_channel.stl", 31, info );
}

function actAluminumChannel24Position( sp ) = actAluminumChannelHelperPosition( sp );

moMoveOriginTo( actAluminumChannel24Position( [ 1, 0, 0 ] ) )
  actAluminumChannel24( [ 0, 0, 0 ], info = true );

