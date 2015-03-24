include <../mo/mo.scad>

HubDepth = 0.275*in;
HubScrewDistance = 0.495 * in; // CAD not explicit
HubScrewOffset = 0.187 * in; // CAD not explicit
HubOffsetY = -0.1*in;
HubHole = 0.77*in;
S45 = sin( 45 );
HubHoleS45_2 = S45 * HubHole / 2;

positions = [
  [ [ 0, 0, 0 ],         [ 0, 0, 1 ], 0 ],
  [ [ 0, HubDepth, 0 ], [ 0, 0, 1 ],  180 ],
  
  [ [ HubHoleS45_2, 0, -HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],
  [ [ -HubHoleS45_2, 0, -HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],
  [ [ -HubHoleS45_2, 0, HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],
  [ [ HubHoleS45_2, 0, HubHoleS45_2 ], [ 0, 0, 1 ],  0 ],

  [ [ HubHoleS45_2, HubDepth, -HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],
  [ [ -HubHoleS45_2, HubDepth, -HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],
  [ [ -HubHoleS45_2, HubDepth, HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],
  [ [ HubHoleS45_2, HubDepth, HubHoleS45_2 ], [ 0, 0, 1 ],  180 ],  
  [ [ HubScrewOffset, HubDepth/2, -HubScrewDistance ], [ 0, 0, 1 ], 90 ]
];

module actClampingHub0_77Spacing0_5( p = 0, info = false ) {
  moPresent( positions, p, info )
    translate( [0,HubOffsetY,0])
      color( Steel )
        import("./stl/actobotics_0.77_clamping_hub_1_2.stl");
}

function actClampingHub0_77Spacing0_5Position( p ) = positions[ p ];

moMoveOriginTo( actClampingHub0_77Spacing0_5Position( 1 ) )
  actClampingHub0_77Spacing0_5( 0, info = true, $name = true );
