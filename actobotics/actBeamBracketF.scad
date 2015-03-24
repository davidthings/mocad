include <../mo/mo.scad>

BeamHoleDistance = 1.54 * in / 4;
BeamDepth = 0.125 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, -BeamHoleDistance,  ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, -BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, -2 * BeamHoleDistance,  ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, -2 * BeamHoleDistance ], [ 0, 0, 1 ], 180 ],
];

module actBeamBracketF( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( BlackDelrin )
      import("./stl/actobotics_beam_bracket_f.stl");
}

function actBeamBracketFPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actBeamBracketFPosition( 4) )
  actBeamBracketF( 0, info = true );

