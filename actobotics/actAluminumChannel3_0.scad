include <../mo/mo.scad>

use <actAluminumChannelHelper.scad>

module actAluminumChannel3_0( lsp, info = false ) {
  actAluminumChannelHelper( lsp, "stl/actobotics_3.0_aluminum_channel.stl", 3, info );
}

function actAluminumChannel3_0Position( sp ) = actAluminumChannelHelperPosition( sp );

moMoveOriginTo( actAluminumChannel3_0Position( [ 1, 0, 0 ] ) )
  actAluminumChannel3_0( [ 0, 0, 0 ], info = true );
