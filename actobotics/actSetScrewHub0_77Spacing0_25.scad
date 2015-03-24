include <../mo/mo.scad>

HubDepth = 0.375*in;
HubBodyDepth = 0.275*in;
HubFlange = HubDepth - HubBodyDepth;
HubHole = 0.770*in;
HubHoleS45_2 = sin( 45 ) * HubHole / 2;
HubOffsetY = -0.1*in;
HubHeight = 0.4*in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, HubDepth, 0 ], [ 0, 0, 1 ],  180 ],
  [ [ 0, HubFlange, 0 ], [ 0, 0, 1 ],  0 ],

  [ [ HubHoleS45_2, HubFlange, -HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],
  [ [ -HubHoleS45_2, HubFlange, -HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],
  [ [ -HubHoleS45_2, HubFlange, HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],
  [ [ HubHoleS45_2, HubFlange, HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],

  [ [ -HubHoleS45_2, HubDepth, -HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],
  [ [ HubHoleS45_2, HubDepth, -HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],
  [ [ HubHoleS45_2, HubDepth, HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],  
  [ [ -HubHoleS45_2, HubDepth, HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],
  
[ [ 0, HubDepth-HubBodyDepth/2, HubHeight ], [ 1, 0, 0 ], -90 ]
];

module actSetScrewHub0_77Spacing0_25( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      import("./stl/actobotics_0.77_set_screw_hub_1_4.stl");
}

function actSetScrewHub0_77Spacing0_25Position( p = 0 ) = positions[ p ];

moMoveOriginTo( actSetScrewHub0_77Spacing0_25Position( 2 ) )
  actSetScrewHub0_77Spacing0_25( 0, info = true, $name = true );


