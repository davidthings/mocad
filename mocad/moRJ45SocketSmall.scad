include <../mo/mo.scad>

moRJ45SocketSmall_Height = 0.65 * in;
moRJ45SocketSmall_Width = 0.58 * in;
moRJ45SocketSmall_Depth = 0.45 * in;
moRJ45SocketSmall_SideWall = 0.05 * in;
moRJ45SocketSmall_BottomWall = 0.05 * in;
moRJ45SocketSmall_TopWall = 0.08 * in;
moRJ45SocketSmall_BackWall = 0.35 * in;
moRJ45SocketSmall_TabHeight = 0.6 * in;
moRJ45SocketSmall_TabDepth = 0.05* in;
moRJ45SocketSmall_TabWidth = 0.2 * in;

positions = [ 
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, -moRJ45SocketSmall_Height/2, -moRJ45SocketSmall_Depth/2 ], [ 1, 0, 0 ], 0 ]
];

module moRJ45SocketSmall( p = 0, info = false ) {
  moPresent( positions, p, info ) {
     color( Aluminum ) {
      difference() {
        cube( [ moRJ45SocketSmall_Width, moRJ45SocketSmall_Height, moRJ45SocketSmall_Depth ], center = true );
        translate( [ 0, -moRJ45SocketSmall_BackWall, -moRJ45SocketSmall_BottomWall/2 ] ) {
          translate( [ 0, -0.05*in, moRJ45SocketSmall_Depth / 2 - moRJ45SocketSmall_TopWall / 2 - Epsilon ] )
              cube( [ moRJ45SocketSmall_TabWidth, 
                      moRJ45SocketSmall_TabHeight, 
                      moRJ45SocketSmall_TabDepth ], center = true );
          cube( [ moRJ45SocketSmall_Width - 2 * moRJ45SocketSmall_SideWall, 
                  moRJ45SocketSmall_Height, 
                  moRJ45SocketSmall_Depth - moRJ45SocketSmall_TopWall - moRJ45SocketSmall_BottomWall ], center = true );
        }
        }
      }
    
  }
}


function moRJ45SocketSmallPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( moRJ45SocketSmallPosition( 0 ) ) {
  moRJ45SocketSmall( 0, info = true, $name = true );
}

