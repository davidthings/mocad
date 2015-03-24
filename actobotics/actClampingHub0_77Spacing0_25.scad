include <../mo/mo.scad>

HubDepth = 0.375*in;
HubBodyDepth = 0.275*in;
HubFlange = HubDepth - HubBodyDepth;
HubHole = 0.770*in;
HubHoleS45_2 = sin( 45 ) * HubHole / 2;
HubScrewDistance = 0.495 * in; // CAD not explicit
HubScrewOffset = 0.187 * in; // CAD not explicit
HubOffsetY = -0.1*in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, HubDepth, 0 ], [ 0, 0, 1 ],  180 ],
  [ [ 0, HubFlange, 0 ], [ 0, 0, 1 ],  0 ],

  [ [ HubHoleS45_2, HubFlange, -HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],
  [ [ -HubHoleS45_2, HubFlange, -HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],
  [ [ -HubHoleS45_2, HubFlange, HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],
  [ [ HubHoleS45_2, HubFlange, HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],

  [ [ HubHoleS45_2, HubDepth, -HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],
  [ [ -HubHoleS45_2, HubDepth, -HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],
  [ [ -HubHoleS45_2, HubDepth, HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],
  [ [ HubHoleS45_2, HubDepth, HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],  

  [ [ HubScrewOffset, HubDepth-HubBodyDepth/2, -HubScrewDistance ], [ 0, 0, 1 ], 90 ]
];

module actClampingHub0_77Spacing0_25( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      import("./stl/actobotics_0.77_clamping_hub_1_4.stl");
}

function actClampingHub0_77Spacing0_25Position( p = 0 ) = positions[ p ];

moMoveOriginTo( actClampingHub0_77Spacing0_25Position( 2 ) )
  actClampingHub0_77Spacing0_25( 0, info = true, $name = true );


