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
];

module actBeamBracketA( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( BlackDelrin )
        import("./stl/actobotics_beam_bracket_a.stl");
}

function actBeamBracketAPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actBeamBracketAPosition( 4) )
  actBeamBracketA( 0, info = true, $name = true );
