include <../mo/mo.scad>

BeamHoleDistance_2 = 1.54 * in / 8;
BeamDepth = 0.125 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ BeamHoleDistance_2, 0, -BeamHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance_2, BeamDepth, -BeamHoleDistance_2 ], [ 0, 0, 1 ], 180 ],

  [ [ -BeamHoleDistance_2, 0, -BeamHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -BeamHoleDistance_2, BeamDepth, -BeamHoleDistance_2 ], [ 0, 0, 1 ], 180 ],

  [ [ -BeamHoleDistance_2, 0, BeamHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -BeamHoleDistance_2, BeamDepth, BeamHoleDistance_2 ], [ 0, 0, 1 ], 180 ],

  [ [ BeamHoleDistance_2, 0, BeamHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance_2, BeamDepth, BeamHoleDistance_2 ], [ 0, 0, 1 ], 180 ],
];

module actBeamBracketI( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( BlackDelrin )
      import("./stl/actobotics_beam_bracket_i.stl");
}

function actBeamBracketIPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actBeamBracketIPosition( 4) )
  actBeamBracketI( 0, info = true );
