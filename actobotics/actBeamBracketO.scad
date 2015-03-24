include <../mo/mo.scad>

BeamHoleDistance = 1.54 * in / 4;
BeamHoleDistance_2 = BeamHoleDistance / 2;
BeamDepth = 0.125 * in;
ChannelHoleDistance = 1.061 * in / 2;
MountDistance = 0.407 * in;
BeamOffsetZ = 0.15 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ ChannelHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ 3 * BeamHoleDistance_2, 0, -MountDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 3 * BeamHoleDistance_2, BeamDepth, -MountDistance ], [ 0, 0, 1 ], 180 ],

  [ [ 1 * BeamHoleDistance_2, 0, -MountDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 1 * BeamHoleDistance_2, BeamDepth, -MountDistance ], [ 0, 0, 1 ], 180 ],

  [ [ -1 * BeamHoleDistance_2, 0, -MountDistance ], [ 0, 0, 1 ], 0 ],
  [ [ -1 * BeamHoleDistance_2, BeamDepth, -MountDistance ], [ 0, 0, 1 ], 180 ],

  [ [ -3 * BeamHoleDistance_2, 0, -MountDistance ], [ 0, 0, 1 ], 0 ],
  [ [ -3 * BeamHoleDistance_2, BeamDepth, -MountDistance ], [ 0, 0, 1 ], 180 ],

  [ [ -ChannelHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],
];

module actBeamBracketO( p = 0, info = false ) {
  moPresent( positions, p, info ) 
    color( BlackDelrin )
      translate( [ 0, 0, BeamOffsetZ]) 
        import("./stl/actobotics_beam_bracket_o.stl");
}

function actBeamBracketOPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actBeamBracketOPosition( 2 ) )
  actBeamBracketO( 0, info = true );


