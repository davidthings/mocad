include <../mo/mo.scad>

moMicroUSB_Height = 0.2 * in;
moMicroUSB_Width = 0.3 * in;
moMicroUSB_Depth = 0.1 * in;
moMicroUSB_Wall = 0.02 * in;

positions = [ 
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, -moMicroUSB_Height/2, -moMicroUSB_Depth/2 ], [ 1, 0, 0 ], 0 ]
];

module moMicroUSB( p = 0, info = false, name = false ) {
  moPresent( positions, p, info ) {
    // USB Connector
      color( Aluminum ) {
        difference() {
          cube( [ moMicroUSB_Width, moMicroUSB_Height, moMicroUSB_Depth ], center = true );
          translate( [ 0, -2 * moMicroUSB_Wall, 0 ] )
          cube( [ moMicroUSB_Width - 2 * moMicroUSB_Wall, 
                  moMicroUSB_Height - 2 * moMicroUSB_Wall, 
                  moMicroUSB_Depth - 2 * moMicroUSB_Wall ], center = true );
        
        }
      }
    
  }
}


function moMicroUSBPosition( p = 0 ) = positions[ p ];

moMoveOriginTo(moMicroUSBPosition( 1 ) ) {
  moMicroUSB( 1, info = true, $name = true );
}

