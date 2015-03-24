include <../mo/mo.scad>

CollarDepth = 0.2813 * in;
CollarOutsideDiameter = 0.5 * in;
CollarInsideDiameter = 0.255 * in;
CollarThickness = ( CollarOutsideDiameter - CollarInsideDiameter ) / 2;
CollarSetScrewDiameter = 0.125 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, CollarDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, CollarDepth/2, CollarOutsideDiameter/2 ], [ 1, 0, 0 ], -90 ],
];

module actCollarSetScrew0_25( p = 0, info = false ) {
  moPresent( positions, p, info )
    moPose( [ 90, 0, 0 ], [ 0, CollarDepth / 2, 0 ] ) {
      difference() {
        color( Steel ) 
          cylinder( h = CollarDepth, d = CollarOutsideDiameter, center = true );
        color( Steel ) 
          cylinder( h = CollarDepth + Epsilon, d = CollarInsideDiameter, center = true );
        moPose( [ 90, 0, 0 ], [ 0, CollarInsideDiameter / 2 + CollarThickness / 2 , 0 ] )
          color( Steel ) 
            cylinder( h = CollarThickness + 4 * Epsilon, d = CollarSetScrewDiameter, center = true );
      }
  }
    
}

function actCollarSetScrew0_25Position( p = 0 ) = positions[ p ];

moMoveOriginTo( actCollarSetScrew0_25Position( 0 ) )
  actCollarSetScrew0_25( 0, info = true, $name = true );


