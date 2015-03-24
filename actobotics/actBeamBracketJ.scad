include <../mo/mo.scad>

BeamHoleDistance = 1.54 * in / 4;
BeamHoleDistance_2 = BeamHoleDistance / 2;
BeamDepth = 0.125 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, BeamHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, BeamHoleDistance_2 ], [ 0, 0, 1 ], 180 ],

  [ [ BeamHoleDistance, 0, BeamHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance, BeamDepth, BeamHoleDistance_2 ], [ 0, 0, 1 ], 180 ],

  [ [ 2 * BeamHoleDistance, 0, BeamHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ 2 * BeamHoleDistance, BeamDepth, BeamHoleDistance_2 ], [ 0, 0, 1 ], 180 ],

  [ [ 2 * BeamHoleDistance, 0, -BeamHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ 2 * BeamHoleDistance, BeamDepth, -BeamHoleDistance_2 ], [ 0, 0, 1 ], 180 ],

  [ [ 1 * BeamHoleDistance, 0, -BeamHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ 1 * BeamHoleDistance, BeamDepth, -BeamHoleDistance_2 ], [ 0, 0, 1 ], 180 ],

  [ [ 0 * BeamHoleDistance, 0, -BeamHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ 0 * BeamHoleDistance, BeamDepth, -BeamHoleDistance_2 ], [ 0, 0, 1 ], 180 ],

  [ [ -1 * BeamHoleDistance, 0, -BeamHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -1 * BeamHoleDistance, BeamDepth, -BeamHoleDistance_2 ], [ 0, 0, 1 ], 180 ],

  [ [ -2 * BeamHoleDistance, 0, -BeamHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -2 * BeamHoleDistance, BeamDepth, -BeamHoleDistance_2 ], [ 0, 0, 1 ], 180 ],

  [ [ -2 * BeamHoleDistance, 0, BeamHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -2 * BeamHoleDistance, BeamDepth, BeamHoleDistance_2 ], [ 0, 0, 1 ], 180 ],

  [ [ -1 * BeamHoleDistance, 0, BeamHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -1 * BeamHoleDistance, BeamDepth, BeamHoleDistance_2 ], [ 0, 0, 1 ], 180 ],
];

module actBeamBracketJ( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( BlackDelrin )
      import("./stl/actobotics_beam_bracket_j.stl");
}

function actBeamBracketJPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actBeamBracketJPosition( 2 ) )
  actBeamBracketJ( 0, info = true );
