include <../mo/mo.scad>

HubDepth = 0.25*in;

// We need a new hole pattern for this part - when we have it, should copy HubAdapterA!
positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, HubDepth, 0 ], [ 0, 0, 1 ], 180 ],
];

module actHubAdapterB( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      import("./stl/actobotics_hub_adapter_b.stl");
}

function actHubAdapterBPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actHubAdapterBPosition( 1 ) )
  actHubAdapterB( 0, info = true );


