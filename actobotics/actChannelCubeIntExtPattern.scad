include <../mo/mo.scad>

ChannelWall = 0.09*in;
ChannelExternalWidth = 1.5*in;
ChannelExternalWidth_2 = ChannelExternalWidth / 2;
ChannelInternalWidth = 1.5*in - 2 * ChannelWall;
ChannelInternalWidth_2 = ChannelInternalWidth / 2;
ChannelOutsideHoles  = 1.061 * in; 

Sets = [

  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelExternalWidth_2, ChannelExternalWidth_2, 0 ], [ 0, 0, 1 ], -90 ],
  [ [ 0, ChannelExternalWidth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ ChannelExternalWidth_2, ChannelExternalWidth_2, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ 0, ChannelExternalWidth_2, ChannelExternalWidth_2 ], [ 1, 0, 0 ], -90 ],
  [ [ 0, ChannelExternalWidth_2, -ChannelExternalWidth_2 ], [ 1, 0, 0 ], 90 ],

  [ [ 0, ChannelWall, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ -ChannelInternalWidth_2, ChannelInternalWidth_2 + ChannelWall, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ 0, ChannelInternalWidth + ChannelWall, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelInternalWidth_2, ChannelInternalWidth_2 + ChannelWall, 0 ], [ 0, 0, 1 ], -90 ],
  [ [ 0, ChannelInternalWidth_2 + ChannelWall, ChannelInternalWidth_2 ], [ 1, 0, 0 ], 90 ],
  [ [ 0, ChannelInternalWidth_2 + ChannelWall, -ChannelInternalWidth_2 ], [ 1, 0, 0 ], -90 ],];

positions = [
// 0
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [  ChannelOutsideHoles / 2, 0, 0  ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelOutsideHoles / 2, 0, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, -ChannelOutsideHoles / 2  ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelOutsideHoles / 2, 0, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelOutsideHoles / 2, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelOutsideHoles / 2, 0, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelOutsideHoles / 2, 0, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
];

SetCount = len( Sets );
PositionCount = len( positions );

module actChannelCubeIntExtPattern( lsp, info = false ) {
  moMoveOriginTo( actChannelCubeIntExtPatternPosition( lsp ) ) 
  {
    if ( info == true ) {
      for ( si = [ 0 : SetCount - 1 ] ) {
        for ( pi = [ 0 : PositionCount - 1 ] ) { 
          moMoveTo( actChannelCubeIntExtPatternPosition( [ si, pi ] ) ) 
            moPosition2( [ si, pi ] );
        }
      }
    }
  }
  if ( info == true )
    moPartOrigin();  
  if ( $name == true )
    moPartLabel( parent_module(1) );
}

function actChannelCubeIntExtPatternPosition( sp ) = moCombinePositions( Sets[ sp[ 0 ] ], positions[ sp[ 1 ] ] );


moMoveOriginTo( actChannelCubeIntExtPatternPosition( [ 0, 0 ] ) ) {

  #translate( [ -ChannelExternalWidth/2, 0, -ChannelExternalWidth/2 ] )
    import( "./stl/actobotics_1.5_aluminum_channel.stl" );

  actChannelCubeIntExtPattern( [ 0, 0 ], info = true, $name = true );
}


