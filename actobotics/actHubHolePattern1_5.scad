include <../mo/mo.scad>

s45 = sin( 45 );
Hole1_5Distance = 1.50 * in / 2;
Hole1_5Distances45 = Hole1_5Distance * s45;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ Hole1_5Distance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ Hole1_5Distances45, 0, -Hole1_5Distances45 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, -Hole1_5Distance ], [ 0, 0, 1 ], 0 ],
  [ [ -Hole1_5Distances45, 0, -Hole1_5Distances45 ], [ 0, 0, 1 ], 0 ],
  [ [ -Hole1_5Distance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -Hole1_5Distances45, 0, Hole1_5Distances45 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, Hole1_5Distance ], [ 0, 0, 1 ], 0 ],
  [ [ Hole1_5Distances45, 0, Hole1_5Distances45 ], [ 0, 0, 1 ], 0 ],
];

module actHubHolePattern1_5( p = 0, info = false ) {
  moPresent( positions, p, info );
}

function actHubHolePattern1_5Position( p = 0 ) = positions[ p ];

dp = 2;
// Example Object
moMoveOriginTo( actHubHolePattern1_5Position( dp ) )

  #moPose( [ 0, 0, 180 ], [ 0, 0.25*in, 0 ] )
    import("./stl/actobotics_hub_adapter_c.stl");

moMoveOriginTo( actHubHolePattern1_5Position( dp ) )
  actHubHolePattern1_5( 0, info = true, $name = true );



