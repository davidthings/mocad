include <../mo/mo.scad>

Beam0_77Side = sqrt( 0.5 * 0.77 * in * 0.77 * in );
Beam0_77Side_2 = Beam0_77Side / 2;
BeamDepth = 0.125 * in;

positions = [

  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ Beam0_77Side_2, 0, -Beam0_77Side_2 ], [ 0, 0, 1 ], 0 ],
  [ [ Beam0_77Side_2, BeamDepth, -Beam0_77Side_2 ], [ 0, 0, 1 ], 180 ],

  [ [ -Beam0_77Side_2, 0, -Beam0_77Side_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -Beam0_77Side_2, BeamDepth, -Beam0_77Side_2 ], [ 0, 0, 1 ], 180 ],

  [ [ -Beam0_77Side_2, 0, Beam0_77Side_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -Beam0_77Side_2, BeamDepth, Beam0_77Side_2 ], [ 0, 0, 1 ], 180 ],

  [ [ Beam0_77Side_2, 0, Beam0_77Side_2 ], [ 0, 0, 1 ], 0 ],
  [ [ Beam0_77Side_2, BeamDepth, Beam0_77Side_2 ], [ 0, 0, 1 ], 180 ],
];

module actBeamBracketR( p = 0, info = false ) {
  moPresent( positions, p, info ) 
    color( BlackDelrin )
        import("./stl/actobotics_beam_bracket_r.stl");
}

function actBeamBracketRPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actBeamBracketRPosition( 3 ) )
  actBeamBracketR( 0, info = true );

