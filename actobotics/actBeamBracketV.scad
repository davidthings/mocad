include <../mo/mo.scad>

ChannelHoleDistance = 1.061 * in / 2;
BeamHoleDistance = 1.54 * in / 4;
Beam0_77Side = sqrt( 0.5 * 0.77 * in * 0.77 * in );
Beam0_77Side_2 = Beam0_77Side / 2;
BeamDepth = 0.125 * in;

positions = [

  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ Beam0_77Side_2, 0, -Beam0_77Side_2 ], [ 0, 0, 1 ], 0 ],
  [ [ Beam0_77Side_2, BeamDepth, -Beam0_77Side_2 ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, -ChannelHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, -ChannelHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ -Beam0_77Side_2, 0, -Beam0_77Side_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -Beam0_77Side_2, BeamDepth, -Beam0_77Side_2 ], [ 0, 0, 1 ], 180 ],

  [ [ -BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -Beam0_77Side_2, 0, Beam0_77Side_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -Beam0_77Side_2, BeamDepth, Beam0_77Side_2 ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, ChannelHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, ChannelHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ Beam0_77Side_2, 0, Beam0_77Side_2 ], [ 0, 0, 1 ], 0 ],
  [ [ Beam0_77Side_2, BeamDepth, Beam0_77Side_2 ], [ 0, 0, 1 ], 180 ],
];

module actBeamBracketV( p = 0, info = false ) {
  moPresent( positions, p, info ) 
    color( BlackDelrin )
        import("./stl/actobotics_beam_bracket_v.stl");
}

function actBeamBracketVPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actBeamBracketVPosition( 3 ) )
  actBeamBracketV( 0, info = true );
