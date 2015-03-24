include <../mo/mo.scad>

use <actAluminumChannelHelper.scad>

module actAluminumChannel15( lsp, info = false ) {
  actAluminumChannelHelper( lsp, "stl/actobotics_15_aluminum_channel.stl", 19, info );
}

function actAluminumChannel15Position( sp ) = actAluminumChannelHelperPosition( sp );

moMoveOriginTo( actAluminumChannel15Position( [ 1, 0, 0 ] ) )
  actAluminumChannel15( [ 0, 0, 0 ], info = true );

