include <../mo/mo.scad>

ChannelWall = 0.09*in;
ChannelWidth = 1.5*in;
ChannelWidth_2 = ChannelWidth / 2;

Sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelWidth_2, ChannelWidth_2, 0 ], [ 0, 0, 1 ], -90 ],
  [ [ 0, ChannelWidth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ ChannelWidth_2, ChannelWidth_2, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ 0, ChannelWidth_2, ChannelWidth_2 ], [ 1, 0, 0 ], -90 ],
  [ [ 0, ChannelWidth_2, -ChannelWidth_2 ], [ 1, 0, 0 ], 90 ],
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

module actChannelCubeExternalPattern( lsp, info = false ) {
  moMoveOriginTo( actChannelCubeExternalPatternPosition( lsp ) ) {    
    if ( info == true ) {
      for ( si = [ 0 : SetCount - 1 ] ) {
        for ( pi = [ 0 : PositionCount - 1 ] ) { 
          moMoveTo( actChannelCubeExternalPatternPosition( [ si, pi ] ) ) 
            moPosition2( [ si, pi ] );
        }
      }
    }
    if ( info == true )
      moPartOrigin();  
  }
  if ( $name == true )
    moPartLabel( parent_module(1) );
}

function actChannelCubeExternalPatternPosition( sp ) = moCombinePositions( Sets[ sp[ 0 ] ], positions[ sp[ 1 ] ] );

moMoveOriginTo( actChannelCubeExternalPatternPosition( [ 0, 1 ] ) ) {
  #color( Aluminum )
    translate( [ -ChannelWidth/2, 0, -ChannelWidth/2 ] )
      import( "./stl/actobotics_1.5_aluminum_channel.stl" );

  actChannelCubeExternalPattern( info = true, $name = true );
}

