include <../mo/mo.scad>

use <actAluminumChannelHelper.scad>

module actAluminumChannel3_75( lsp, info = false ) {
  actAluminumChannelHelper( lsp, "stl/actobotics_3.75_aluminum_channel.stl", 4, info );
}

function actAluminumChannel3_75Position( sp ) = actAluminumChannelHelperPosition( sp );

moMoveOriginTo( actAluminumChannel3_75Position( [ 1, 0, 0 ] ) )
  actAluminumChannel3_75( [ 0, 0, 0 ], info = true );
