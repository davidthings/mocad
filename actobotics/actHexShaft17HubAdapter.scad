include <../mo/mo.scad>

HubDepth = 0.35*in;
HubFlange = 0.15 * in;
HubPlate = 0.2 * in;
HubHexDepth = HubDepth - HubPlate;
HubHole = 0.77*in;
HubHoleS45_2 = sin( 45 ) * HubHole / 2;
HubScrewDistance = 0.495 * in; // CAD not explicit
HubScrewOffset = 0.187 * in; // CAD not explicit
HubOffsetY = -0.1*in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, HubPlate, 0 ], [ 0, 0, 1 ],  180 ],
  [ [ 0, -HubHexDepth, 0 ], [ 0, 0, 1 ],  0 ],
  
  [ [ HubHoleS45_2, HubFlange, -HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],
  [ [ -HubHoleS45_2, HubFlange, -HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],
  [ [ -HubHoleS45_2, HubFlange, HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],
  [ [ HubHoleS45_2, HubFlange, HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],

  [ [ -HubHoleS45_2, HubPlate, -HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],
  [ [ HubHoleS45_2, HubPlate, -HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],
  [ [ HubHoleS45_2, HubPlate, HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],  
  [ [ -HubHoleS45_2, HubPlate, HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],
  

];

module actHexShaft17HubAdapter( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      moFlip()
        import("./stl/actobotics_17MM_hex_wheel_adapter.stl");
}

function actHexShaft17HubAdapterPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actHexShaft17HubAdapterPosition( 0 ) )
  actHexShaft17HubAdapter( 0, info = true, $name = true );


