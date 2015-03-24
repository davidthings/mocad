include <../mo/mo.scad>

AdapterHexDepth = 0.15 * in;
AdapterHexShoulderDepth = 0.075 * in;
AdapterCollarDepth = 0.7 * in;
AdapterDriveShoulderDepth = 0.025 * in;

AdapterOffsetY = -AdapterHexDepth;

AdapterDepth =  AdapterHexShoulderDepth + AdapterCollarDepth + AdapterDriveShoulderDepth;
AdapterHubDiameter = 0.475 * in;
AdapterSetScrewDistance1 = 0.2 * in;
AdapterSetScrewDistance2 = 0.475 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, AdapterDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, -AdapterHexDepth, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, AdapterHexShoulderDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, AdapterHexShoulderDepth + AdapterCollarDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ AdapterHubDiameter/2, AdapterDepth - AdapterSetScrewDistance1, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ AdapterHubDiameter/2, AdapterDepth - AdapterSetScrewDistance2, 0 ], [ 0, 0, 1 ], 90 ],
];

module actHexShaft12Adapter6( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel )
      translate( [ 0, AdapterOffsetY, 0 ] )
          import("./stl/actobotics_hex_shaft_wheel_adapter_6.stl");
}

function actHexShaft12Adapter6Position( p = 0 ) = positions[ p ];

moMoveOriginTo( actHexShaft12Adapter6Position( 0 ) )
  actHexShaft12Adapter6( 0, info = true, $name = true  );




