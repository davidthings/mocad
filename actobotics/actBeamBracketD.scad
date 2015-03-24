include <../mo/mo.scad>

BeamHoleDistance = 1.54 * in / 4;
BeamDepth = 0.125 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, -BeamHoleDistance,  ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, -BeamHoleDistance ], [ 0, 0, 1 ], 180 ],
];

module actBeamBracketD( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( BlackDelrin )
      import("./stl/actobotics_beam_bracket_d.stl");
}

function actBeamBracketDPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actBeamBracketDPosition( 3) )
  actBeamBracketD( 0, info = true );
