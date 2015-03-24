include <../mo/mo.scad>

s45 = 0.707106781;

BeamHoleDistance = 1.54 * in / 4;
BeamHoleDistance_s45 = BeamHoleDistance * s45;
BeamDepth = 0.125 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -BeamHoleDistance_s45, 0, -BeamHoleDistance_s45 ], [ 0, 0, 1 ], 0 ],
  [ [ -BeamHoleDistance_s45, BeamDepth, -BeamHoleDistance_s45 ], [ 0, 0, 1 ], 180 ],

  [ [ 2 * BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 2 * BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -2 * BeamHoleDistance_s45, 0, -2 * BeamHoleDistance_s45 ], [ 0, 0, 1 ], 0 ],
  [ [ -2 * BeamHoleDistance_s45, BeamDepth, -2 * BeamHoleDistance_s45 ], [ 0, 0, 1 ], 180 ],
];

module actBeamBracketB( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( BlackDelrin )
      import("./stl/actobotics_beam_bracket_b.stl");
}

function actBeamBracketBPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actBeamBracketBPosition( 4) )
  actBeamBracketB( 0, info = true );

