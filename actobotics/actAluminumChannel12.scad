include <../mo/mo.scad>

use <actAluminumChannelHelper.scad>

module actAluminumChannel12( lsp, info = false ) {
  actAluminumChannelHelper( lsp, "stl/actobotics_12_aluminum_channel.stl", 15, info );
}

function actAluminumChannel12Position( sp ) = actAluminumChannelHelperPosition( sp );

moMoveOriginTo( actAluminumChannel12Position( [ 1, 0, 0 ] ) )
  actAluminumChannel12( [ 0, 0, 0 ], info = true );

