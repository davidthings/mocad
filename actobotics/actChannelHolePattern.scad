include <../mo/mo.scad>

ChannelWall  = 0.09*in;
ChannelOutsideHoles  = 1.061*in; // This was not a dimension stated on the quick diagram
ChannelMiddleHoles  = 0.956*in; // This was not a dimension stated on the quick diagram
ChannelInsideHoles  = 0.439*in; // This was not a dimension stated on the quick diagram

s45 = 0.707106781;

BeamMountDistance = 1.50 * in / 2;
BeamHoleDistance = 1.54 * in / 4;
BeamHoleDistance_s45 = BeamHoleDistance * s45;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, -ChannelInsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [  ChannelOutsideHoles / 2, 0, 0  ], [ 0, 0, 1 ], 0 ],
  [ [  ChannelOutsideHoles / 2, 0, -ChannelInsideHoles /2 ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelOutsideHoles / 2 , 0, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],

  [ [ BeamHoleDistance_s45, 0, -ChannelMiddleHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, -ChannelOutsideHoles / 2  ], [ 0, 0, 1 ], 0 ],
  [ [ -BeamHoleDistance_s45, 0, -ChannelMiddleHoles / 2 ], [ 0, 0, 1 ], 0 ],

  [ [ -ChannelOutsideHoles / 2 , 0, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],

  [ [  -ChannelOutsideHoles / 2, 0, -ChannelInsideHoles /2 ], [ 0, 0, 1 ], 0 ],

  [ [ -ChannelOutsideHoles / 2, 0, 0 ], [ 0, 0, 1 ], 0 ],

  [ [ BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance_s45, 0, -BeamHoleDistance_s45 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, -BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ -BeamHoleDistance_s45, 0, -BeamHoleDistance_s45 ], [ 0, 0, 1 ], 0 ],
  [ [ -BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],

  [ [  -ChannelOutsideHoles / 2, 0, ChannelInsideHoles /2 ], [ 0, 0, 1 ], 0 ],
  [ [  ChannelOutsideHoles / 2, 0, ChannelInsideHoles /2 ], [ 0, 0, 1 ], 0 ],


  [ [ -BeamHoleDistance_s45, 0, BeamHoleDistance_s45 ], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance_s45, 0, BeamHoleDistance_s45 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, ChannelInsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelOutsideHoles / 2 , 0, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance_s45, 0, ChannelMiddleHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ -BeamHoleDistance_s45, 0, ChannelMiddleHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelOutsideHoles / 2 , 0, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],

];

module actChannelHolePattern( p = 0, info = false ) {
  moPresent( positions, p, info );
}

function actChannelHolePatternPosition( p = 0 ) = positions[ p ];

dp = 6;
moMoveOriginTo( actChannelHolePatternPosition( dp ) )
  color( Steel )
    import("./stl/actobotics_flat_single_channel_bracket.stl");

actChannelHolePattern( dp, info = true );
