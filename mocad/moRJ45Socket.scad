include <../mo/mo.scad>

moRJ45Socket_Height = 0.95 * in;
moRJ45Socket_Width = 0.68 * in;
moRJ45Socket_Depth = 0.45 * in;
moRJ45Socket_SideWall = 0.1 * in;
moRJ45Socket_BottomWall = 0.05 * in;
moRJ45Socket_TopWall = 0.08 * in;
moRJ45Socket_BackWall = 0.35 * in;
moRJ45Socket_TabHeight = 0.6 * in;
moRJ45Socket_TabDepth = 0.05* in;
moRJ45Socket_TabWidth = 0.2 * in;
moRJ45Socket_LEDHeight = 0.025 * in;
moRJ45Socket_LEDDepth = 0.15 * in;
moRJ45Socket_LEDWidth = 0.08 * in;

positions = [ 
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, -moRJ45Socket_Height/2, -moRJ45Socket_Depth/2 ], [ 1, 0, 0 ], 0 ]
];

module moRJ45Socket( p = 0, info = false ) {
  moPresent( positions, p, info ) {
    // USB Connector
     color( Black ) {
        translate( [ moRJ45Socket_Width/2-moRJ45Socket_LEDWidth/2-2*Epsilon, -moRJ45Socket_Height/2, moRJ45Socket_Depth/2-moRJ45Socket_LEDDepth/2-2*Epsilon ] ) 
          cube( [ moRJ45Socket_LEDWidth, moRJ45Socket_LEDHeight, moRJ45Socket_LEDDepth ], center = true );
        translate( [ -moRJ45Socket_Width/2+moRJ45Socket_LEDWidth/2+2*Epsilon, -moRJ45Socket_Height/2, moRJ45Socket_Depth/2-moRJ45Socket_LEDDepth/2-2*Epsilon ] ) 
          cube( [ moRJ45Socket_LEDWidth, moRJ45Socket_LEDHeight, moRJ45Socket_LEDDepth ], center = true );
       }
     color( Aluminum ) {
      difference() {
        cube( [ moRJ45Socket_Width, moRJ45Socket_Height, moRJ45Socket_Depth ], center = true );
        translate( [ 0, -moRJ45Socket_BackWall, -moRJ45Socket_BottomWall/2 ] ) {
          translate( [ 0, -0.05*in, moRJ45Socket_Depth / 2 - moRJ45Socket_TopWall/2 - Epsilon ] )
              cube( [ moRJ45Socket_TabWidth, 
                      moRJ45Socket_TabHeight, 
                      moRJ45Socket_TabDepth ], center = true );
          cube( [ moRJ45Socket_Width - 2 * moRJ45Socket_SideWall, 
                  moRJ45Socket_Height, 
                  moRJ45Socket_Depth - moRJ45Socket_TopWall - moRJ45Socket_BottomWall ], center = true );
        }
        }
      }
    
  }
}


function moRJ45SocketPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( moRJ45SocketPosition( 0 ) ) {
  moRJ45Socket( 0, info = true, $name = true );
}

