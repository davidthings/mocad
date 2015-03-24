include <../mo/mo.scad>

use <actAluminumChannelHelper.scad>

module actAluminumChannel9_0( lsp, info = false ) {
  actAluminumChannelHelper( lsp, "stl/actobotics_9.0_aluminum_channel.stl", 11, info );
}

function actAluminumChannel9_0Position( sp ) = actAluminumChannelHelperPosition( sp );

moMoveOriginTo( actAluminumChannel9_0Position( [ 1, 0, 0 ] ) )
  actAluminumChannel9_0( [ 0, 0, 0 ], info = true );

