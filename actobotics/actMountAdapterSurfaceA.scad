include <../mo/mo.scad>

// The the diagram doesn't say how thick the flanges are, and seems to disagree with the CAD image
AdapterLength = 1.32*in;
AdapterWidth = 0.57*in;
AdapterDepth = 0.25*in;
Adapter2LongHoleDistance = 1.061*in;
Adapter2LongHoleDistance_2 = Adapter2LongHoleDistance/2;
//AdapterShortHoleDistance = 0.311*in;  // This doesn't seem right.  Holes are too low.
AdapterShortHoleDistance = 0.26*in;  // This is guessing
AdpaterOffsetZ = 0.13*in;

AdapterFlangeDepth = 0.1* in; // Unspecified

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -Adapter2LongHoleDistance_2, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ Adapter2LongHoleDistance_2, 0, 0 ], [ 0, 0, 1 ], 0 ],

  [ [ 0, AdapterFlangeDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ -Adapter2LongHoleDistance_2, AdapterFlangeDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ Adapter2LongHoleDistance_2, AdapterFlangeDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ 0, AdapterDepth-AdapterFlangeDepth, -AdapterShortHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ -Adapter2LongHoleDistance_2, AdapterDepth-AdapterFlangeDepth, -AdapterShortHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ Adapter2LongHoleDistance_2, AdapterDepth-AdapterFlangeDepth, -AdapterShortHoleDistance ], [ 0, 0, 1 ], 0 ],

  [ [ 0, AdapterDepth, -AdapterShortHoleDistance ], [ 0, 0, 1 ], 180 ],
  [ [ -Adapter2LongHoleDistance_2, AdapterDepth, -AdapterShortHoleDistance ], [ 0, 0, 1 ], 180 ],
  [ [ Adapter2LongHoleDistance_2, AdapterDepth, -AdapterShortHoleDistance ], [ 0, 0, 1 ], 180 ],

];

module actMountAdapterSurfaceA( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Aluminum )
     translate( [ 0, 0, -AdpaterOffsetZ ] )
        import("./stl/actobotics_surface_mount_adapter_a.stl");
}

function actMountAdapterSurfaceAPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actMountAdapterSurfaceAPosition( 0 ) )
  actMountAdapterSurfaceA( 0, info = true, $name=true );
