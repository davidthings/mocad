include <../mo/mo.scad>

CollarDepth = 0.4375 * in;
CollarOutsideDiameter = 1 * in;
CollarInsideDiameter = 0.505 * in;
CollarSetScrewDiameter = 0.25 * in;
CollarThickness = ( CollarOutsideDiameter - CollarInsideDiameter ) / 2;


positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, CollarDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, CollarDepth/2, CollarOutsideDiameter/2 ], [ 1, 0, 0 ], -90 ],
];

module actCollarSetScrew0_5( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Steel ) {
      moPose( [ 90, 0, 0], [ 0, CollarDepth / 2, 0 ] )
        difference() {
          cylinder( h = CollarDepth, d = CollarOutsideDiameter, center = true, $fn = 32 );
          cylinder( h = CollarDepth + Epsilon, d = CollarInsideDiameter, center = true, $fn = 32 );
          moPose( [ 90, 0, 180 ], [ 0, CollarInsideDiameter / 2 + CollarThickness / 2, 0 ] )
            cylinder( h = CollarThickness + 8 * Epsilon, d = CollarSetScrewDiameter, center = true, $fn = 32 );
      }
    }
}

function actCollarSetScrew0_5Positions( p = 0 ) = positions[ p ];

moMoveTo( actCollarSetScrew0_5Positions( 1 ) )
  actCollarSetScrew0_5( 0, info = true, $name = true );

