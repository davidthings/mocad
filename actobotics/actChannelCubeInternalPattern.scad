include <../mo/mo.scad>

ChannelWall = 0.09*in;
ChannelInternalWidth = 1.5*in - 2 * ChannelWall;
ChannelInternalWidth_2 = ChannelInternalWidth / 2;

Sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelInternalWidth_2, ChannelInternalWidth_2, 0 ], [ 0, 0, 1 ], -90 ],
  [ [ 0, ChannelInternalWidth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ ChannelInternalWidth_2, ChannelInternalWidth_2, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ 0, ChannelInternalWidth_2, ChannelInternalWidth_2 ], [ 1, 0, 0 ], -90 ],
  [ [ 0, ChannelInternalWidth_2, -ChannelInternalWidth_2 ], [ 1, 0, 0 ], 90 ],
];

ChannelWall  = 0.09*in;
ChannelOutsideHoles  = 1.061 * in; // This was not a dimension stated on the quick diagram

s45 = 0.707106781;

BeamMountDistance = 1.50 * in / 2;
BeamHoleDistance = 1.54 * in / 4;
BeamHoleDistance_s45 = BeamHoleDistance * s45;

positions = [
// 0
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [  ChannelOutsideHoles / 2, 0, 0  ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelOutsideHoles / 2 , 0, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, -ChannelOutsideHoles / 2  ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelOutsideHoles / 2 , 0, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelOutsideHoles / 2 , 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelOutsideHoles / 2 , 0, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelOutsideHoles / 2 , 0, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
];

SetCount = len( Sets );
PositionCount = len( positions );

module actChannelCubeInternalPattern( lsp, info = false ) {
  moMoveOriginTo( actChannelCubeInternalPatternPosition( lsp ) ) 
  {
    if ( info == true ) {
      for ( si = [ 0 : SetCount - 1 ] ) {
        for ( pi = [ 0 : PositionCount - 1 ] ) { 
          moMoveTo( actChannelCubeInternalPatternPosition( [ si, pi ] ) ) 
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

function actChannelCubeInternalPatternPosition( sp ) = moCombinePositions( Sets[ sp[ 0 ] ], positions[ sp[ 1 ] ] );

moMoveOriginTo( actChannelCubeInternalPatternPosition( [ 1, 0 ] ) ) {
      #translate( [ -ChannelInternalWidth/2-ChannelWall, -ChannelWall, -ChannelInternalWidth/2-ChannelWall ] )
          import( "./stl/actobotics_1.5_aluminum_channel.stl" );

  actChannelCubeInternalPattern( [ 2, 0 ], info = true, $name = true );
}

