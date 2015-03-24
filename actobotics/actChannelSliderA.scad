
include <../mo/mo.scad>

ChannelMountDistance = 2.24 * in / 2;
ChannelHoleDistance = 1.061 * in;
ChannelHoleDistance_2 = 1.061 * in / 2;
ChannelDepth = 0.125 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, ChannelDepth, 0 ], [ 0, 0, 1 ], 180 ], 

  [ [ ChannelMountDistance, 0, 0  ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelMountDistance, ChannelDepth, 0  ], [ 0, 0, 1 ], 180 ],
  [ [ ChannelMountDistance, 0, -ChannelHoleDistance_2  ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelMountDistance, ChannelDepth, -ChannelHoleDistance_2  ], [ 0, 0, 1 ], 180 ],

  [ [ ChannelHoleDistance_2, 0, -ChannelMountDistance  ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelHoleDistance_2, ChannelDepth, -ChannelMountDistance  ], [ 0, 0, 1 ], 180 ],
  [ [ 0 * ChannelHoleDistance_2, 0, -ChannelMountDistance  ], [ 0, 0, 1 ], 0 ],
  [ [ 0 * ChannelHoleDistance_2, ChannelDepth, -ChannelMountDistance  ], [ 0, 0, 1 ], 180 ],
  [ [ -ChannelHoleDistance_2, 0, -ChannelMountDistance  ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelHoleDistance_2, ChannelDepth, -ChannelMountDistance  ], [ 0, 0, 1 ], 180 ],

  [ [ -ChannelMountDistance, 0, -ChannelHoleDistance_2  ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelMountDistance, ChannelDepth, -ChannelHoleDistance_2  ], [ 0, 0, 1 ], 180 ],
  [ [ -ChannelMountDistance, 0, 0  ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelMountDistance, ChannelDepth, 0  ], [ 0, 0, 1 ], 180 ],
  [ [ -ChannelMountDistance, 0, ChannelHoleDistance_2  ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelMountDistance, ChannelDepth, ChannelHoleDistance_2  ], [ 0, 0, 1 ], 180 ],

  [ [ ChannelHoleDistance_2, 0, ChannelMountDistance  ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelHoleDistance_2, ChannelDepth, ChannelMountDistance  ], [ 0, 0, 1 ], 180 ],
  [ [ 0 * ChannelHoleDistance_2, 0, ChannelMountDistance  ], [ 0, 0, 1 ], 0 ],
  [ [ 0 * ChannelHoleDistance_2, ChannelDepth, ChannelMountDistance  ], [ 0, 0, 1 ], 180 ],
  [ [ -ChannelHoleDistance_2, 0, ChannelMountDistance  ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelHoleDistance_2, ChannelDepth, ChannelMountDistance  ], [ 0, 0, 1 ], 180 ],

  [ [ ChannelMountDistance, 0, ChannelHoleDistance_2  ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelMountDistance, ChannelDepth, ChannelHoleDistance_2  ], [ 0, 0, 1 ], 180 ],
];

module actChannelSliderA( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( BlackDelrin )
      import("./stl/actobotics_channel_slider_a.stl");
}

function actChannelSliderAPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actChannelSliderAPosition( 1 ) )
  actChannelSliderA( 0, info = true );
