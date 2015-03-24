include <../mo/mo.scad>

s45 = 0.707106781;

BeamHoleDistance = 1.54 * in / 4;
BeamHoleDistanceS45 = BeamHoleDistance * s45;
BeamHoleDistance_2 = BeamHoleDistance / 2;
BeamDepth = 0.125 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ 2 * BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 2 * BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ 3 * BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 3 * BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ 4 * BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 4 * BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ 2 * BeamHoleDistance + BeamHoleDistanceS45, 0, -2 * BeamHoleDistance + BeamHoleDistanceS45 ], [ 0, 0, 1 ], 0 ],
  [ [ 2 * BeamHoleDistance + BeamHoleDistanceS45, BeamDepth, -2 * BeamHoleDistance + BeamHoleDistanceS45 ], [ 0, 0, 1 ], 180 ],

  [ [ 2 * BeamHoleDistance, 0, -2 * BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 2 * BeamHoleDistance, BeamDepth, -2 * BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ 2 * BeamHoleDistance - BeamHoleDistanceS45, 0, -2 * BeamHoleDistance - BeamHoleDistanceS45 ], [ 0, 0, 1 ], 0 ],
  [ [ 2 * BeamHoleDistance - BeamHoleDistanceS45, BeamDepth, -2 * BeamHoleDistance - BeamHoleDistanceS45 ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, -4 * BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, -4 * BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, -3 * BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, -3 * BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, -2 * BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, -2 * BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, -1 * BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, -1 * BeamHoleDistance ], [ 0, 0, 1 ], 180 ],
];

module actBeamBracketN( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( BlackDelrin )
      translate( [ -BeamHoleDistance_2, 0,BeamHoleDistance_2]) 
        import("./stl/actobotics_beam_bracket_n.stl");
}

function actBeamBracketNPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actBeamBracketNPosition( 3 ) )
  actBeamBracketN( 0, info = true );
