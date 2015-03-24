include <../mo/mo.scad>

use <actAluminumChannelHelper.scad>

module actAluminumChannel6_0( lsp, info = false ) {
  actAluminumChannelHelper( lsp, "stl/actobotics_6.0_aluminum_channel.stl", 7, info );
}

function actAluminumChannel6_0Position( sp ) = actAluminumChannelHelperPosition( sp );

moMoveOriginTo( actAluminumChannel6_0Position( [ 1, 0, 0 ] ) )
  actAluminumChannel6_0( [ 0, 0, 0 ], info = true );

