include <../mo/mo.scad>

BeamHoleDistance = 1.54 * in / 4;
BeamDepth = 0.125 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -2 * BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -2 * BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ 2 * BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 2 * BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

];

module actBeamBracketG( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( BlackDelrin )
      import("./stl/actobotics_beam_bracket_g.stl");
}

function actBeamBracketGPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actBeamBracketGPosition( 4) )
  actBeamBracketG( 0, info = true );
