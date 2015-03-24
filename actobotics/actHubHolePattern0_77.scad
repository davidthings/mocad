include <../mo/mo.scad>

// CAD drawing-ette on site ambiguous on mount distance
S45 = 0.707106781;
Hole0_77Distance = 1.54 * in / 4;
Hole0_77DistanceS45 = Hole0_77Distance * S45;
BeamDepth = 0.09 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ Hole0_77Distance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ Hole0_77DistanceS45, 0, -Hole0_77DistanceS45 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, -Hole0_77Distance ], [ 0, 0, 1 ], 0 ],
  [ [ -Hole0_77DistanceS45, 0, -Hole0_77DistanceS45 ], [ 0, 0, 1 ], 0 ],
  [ [ -Hole0_77Distance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -Hole0_77DistanceS45, 0, Hole0_77DistanceS45 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, Hole0_77Distance ], [ 0, 0, 1 ], 0 ],
  [ [ Hole0_77DistanceS45, 0, Hole0_77DistanceS45 ], [ 0, 0, 1 ], 0 ],
];

module actHubHolePattern0_77( p = 0, info = false ) {
  moPresent( positions, p, info );
}

function actHubHolePattern0_77Position( p = 0 ) = positions[ p ];

p = 1;
// Example object
moMoveOriginTo( actHubHolePattern0_77Position( p ) )
  
#import("./stl/actobotics_flat_plate_a.stl");

moMoveOriginTo( actHubHolePattern0_77Position( p ) )
  actHubHolePattern0_77( 0, info = true );
