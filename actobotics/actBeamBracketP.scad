include <../mo/mo.scad>

BeamHoleDistance = 1.54 * in / 4;
BeamDepth = 0.125 * in;
ChannelHoleDistance = 1.061 * in / 2;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -ChannelHoleDistance, 0, 2 * BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelHoleDistance, BeamDepth, 2 * BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, 2 * BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, 2 * BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ ChannelHoleDistance, 0, 2 * BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ ChannelHoleDistance, BeamDepth, 2 * BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

];

module actBeamBracketP( p = 0, info = false ) {
  moPresent( positions, p, info ) 
    color( BlackDelrin )
        import("./stl/actobotics_beam_bracket_p.stl");
}

function actBeamBracketPPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actBeamBracketPPosition( 3 ) )
  actBeamBracketP( 0, info = true );


