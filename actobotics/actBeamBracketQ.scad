include <../mo/mo.scad>

BeamHoleDistance = 1.54 * in / 4;
BeamDepth = 0.125 * in;
ChannelHoleDistance = 1.061 * in / 2;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ ChannelHoleDistance, 0, 0 * BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelHoleDistance, BeamDepth, 0 * BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, -BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, -BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ -ChannelHoleDistance, 0, 0 * BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelHoleDistance, BeamDepth, 0 * BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, BeamHoleDistance ], [ 0, 0, 1 ], 180 ],
];

module actBeamBracketQ( p = 0, info = false ) {
  moPresent( positions, p, info ) 
    color( BlackDelrin )
        import("./stl/actobotics_beam_bracket_q.stl");
}

function actBeamBracketQPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actBeamBracketQPosition( 3 ) )
  actBeamBracketQ( 0, info = true );
