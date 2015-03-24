include <../mo/mo.scad>

use <actAluminumChannelHelper.scad>

module actAluminumChannel18( lsp, info = false ) {
  actAluminumChannelHelper( lsp, "stl/actobotics_18_aluminum_channel.stl", 23, info );
}

function actAluminumChannel18Position( sp ) = actAluminumChannelHelperPosition( sp );

moMoveOriginTo( actAluminumChannel18Position( [ 1, 0, 0 ] ) )
  actAluminumChannel18( [ 0, 0, 0 ], info = true );



