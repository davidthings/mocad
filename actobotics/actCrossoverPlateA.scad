include <../mo/mo.scad>

CrossoverDistance_2 = 1.939 * in / 2;
ChannelOutsideHoles  = 1.061*in; // This was not a dimension stated on the quick diagram
ChannelMiddleHoles  = 0.956*in; // This was not a dimension stated on the quick diagram
ChannelInsideHoles  = 0.439*in; // This was not a dimension stated on the quick diagram
BeamMountDistance = 1.50 * in / 2;
BeamHoleDistance = 1.54 * in / 4;
PlateDepth = 0.25*in;
PlateFlangeDepth = 0.1*in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, PlateDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ ChannelOutsideHoles / 2 , 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelOutsideHoles / 2 , PlateDepth, 0], [ 0, 0, 1 ], 180 ],

  [ [ BeamMountDistance , 0, 0], [ 0, 0, 1 ], 0 ],
  [ [ BeamMountDistance , PlateFlangeDepth, 0], [ 0, 0, 1 ], 180 ],

  [ [ CrossoverDistance_2, 0, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ CrossoverDistance_2, PlateFlangeDepth, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 180 ],

  [ [ ChannelOutsideHoles / 2 , 0, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelOutsideHoles / 2 , PlateFlangeDepth, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 180 ],

  [ [ 0 , 0, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ 0 , PlateDepth, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 180 ],

  [ [ -ChannelOutsideHoles / 2 , 0, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelOutsideHoles / 2 , PlateFlangeDepth, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 180 ],

  [ [ -CrossoverDistance_2, 0, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ -CrossoverDistance_2, PlateFlangeDepth, -ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 180 ],

  [ [ -ChannelOutsideHoles / 2 , 0, 0], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelOutsideHoles / 2 , PlateDepth, 0], [ 0, 0, 1 ], 180 ],

  [ [ -BeamMountDistance , 0, 0], [ 0, 0, 1 ], 0 ],
  [ [ -BeamMountDistance , PlateFlangeDepth, 0], [ 0, 0, 1 ], 180 ],

  [ [ -CrossoverDistance_2, 0, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ -CrossoverDistance_2, PlateFlangeDepth, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 180 ],

  [ [ -ChannelOutsideHoles / 2 , 0, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelOutsideHoles / 2 , PlateFlangeDepth, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 180 ],

  [ [ 0 , 0, ChannelOutsideHoles / 2], [ 0, 0, 1 ], 0 ],
  [ [ 0 , PlateDepth, ChannelOutsideHoles / 2], [ 0, 0, 1 ], 180 ],

  [ [ ChannelOutsideHoles / 2 , 0, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelOutsideHoles / 2 , PlateFlangeDepth, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 180 ],

  [ [ CrossoverDistance_2, 0, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ CrossoverDistance_2, PlateFlangeDepth, ChannelOutsideHoles / 2 ], [ 0, 0, 1 ], 180 ],
];

module actCrossoverPlateA( p = 0, info = false ) {
  moPresent( positions, p, info );
    color( Steel )
      import("./stl/actobotics_crossover_plate_a.stl");
}

function actCrossoverPlateAPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actCrossoverPlateAPosition( 1 ) )
  actCrossoverPlateA( 0, info = true );
