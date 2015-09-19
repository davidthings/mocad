include <../mo/mo.scad>

moDCCoaxSocket_Height = 0.41 * in;
moDCCoaxSocket_Width = 0.35 * in;
moDCCoaxSocket_Depth = 0.42 * in;
moDCCoaxSocket_ExternalBarrel = 0.35 * in;
moDCCoaxSocket_InternalBarrel = 0.25 * in;
moDCCoadSocket_CentralPin = 0.05 * in;
moDCCoaxSocket_BarrelHeight = 0.55 * in;
moDCCoaxSocket_BarrelDepth = 0.25 * in;
moDCCoaxSocket_FrontHeight = 0.1 * in;

positions = [ 
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, -moDCCoaxSocket_Height/2, -moDCCoaxSocket_BarrelDepth ], [ 1, 0, 0 ], 0 ]
];

module moDCCoaxSocket( p = 0, info = false, name = false ) {
  moPresent( positions, p, info ) {
    // USB Connector
    rotate( [ 90, 0, 0 ] ) {
     color( Aluminum ) 
        cylinder( d = moDCCoadSocket_CentralPin, h = moDCCoaxSocket_Height - 2 * Epsilon, center = true );
        color( BlackABS ) {
      difference() {
        union() {
          cylinder( d = moDCCoaxSocket_ExternalBarrel, h = moDCCoaxSocket_Height, center = true );
          translate( [ 0, -0.0375*in,  (moDCCoaxSocket_Depth-moDCCoaxSocket_FrontHeight)/2 ] )
            cube( [ moDCCoaxSocket_Width, moDCCoaxSocket_Depth, moDCCoaxSocket_FrontHeight ], center = true );
          translate( [ 0, -moDCCoaxSocket_BarrelDepth/2 - 0.075*in, 0 ] )
            cube( [ moDCCoaxSocket_Width, moDCCoaxSocket_FrontHeight, moDCCoaxSocket_Height ], center = true );
        }
        translate( [ 0, 0, 0.1 * in ] )
          cylinder( d = moDCCoaxSocket_InternalBarrel, h = moDCCoaxSocket_Height, center = true );
      }
    }
  }
  }
}


function moDCCoaxSocketPosition( p = 0 ) = positions[ p ];

moMoveOriginTo(moDCCoaxSocketPosition( 1 ) ) {
  moDCCoaxSocket( 1, info = true, $name = true );
}

