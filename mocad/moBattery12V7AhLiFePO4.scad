include <../mo/mo.scad>

MoBattery12V7AhLiFePO4_BodyHeight = 3.0 * in;
MoBattery12V7AhLiFePO4_Width = 4.21 * in;
MoBattery12V7AhLiFePO4_Depth= 2.2 * in;

MoBattery12V7AhLiFePO4_TopHeight = 4.2 * in;
MoBattery12V7AhLiFePO4_TopWidth =  3.0 * in;
MoBattery12V7AhLiFePO4_TopHeight =  0.35 * in;
MoBattery12V7AhLiFePO4_TopDepth =  1.5 * in;

MoBattery12V7AhLiFePO4_TopSepWidth =  MoBattery12V7AhLiFePO4_Width;
MoBattery12V7AhLiFePO4_TopSepHeight =  MoBattery12V7AhLiFePO4_TopHeight;
MoBattery12V7AhLiFePO4_TopSepDepth =  0.5 * in;

MoBattery12V7AhLiFePO4_TerminalWidth =  0.45 * in;
MoBattery12V7AhLiFePO4_TerminalHeight =  MoBattery12V7AhLiFePO4_TopHeight;
MoBattery12V7AhLiFePO4_TerminalDepth =  0.45 * in;
MoBattery12V7AhLiFePO4_TerminalXOffset =  MoBattery12V7AhLiFePO4_Width / 2 - 0.275 * in;
MoBattery12V7AhLiFePO4_TerminalYOffset =  0.55 * in;


MoBattery12V7AhLiFePO4_Depth = 2.2 * in;

MoBattery12V7AhLiFePO4_Height = MoBattery12V7AhLiFePO4_BodyHeight + MoBattery12V7AhLiFePO4_TopHeight;

MoBattery12V7AhLiFePO4_BodyColor = [ 0.5, 0.5, 0.5 ];
MoBattery12V7AhLiFePO4_TopColor = [ 0.5, 0.5, 0.5 ];
MoBattery12V7AhLiFePO4_TerminalColor = Aluminum;

positions = [ 
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, MoBattery12V7AhLiFePO4_Depth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ MoBattery12V7AhLiFePO4_Width/2, MoBattery12V7AhLiFePO4_Depth/2, 0 ], [ 0, 0, 1 ], 90 ],  
  [ [ -MoBattery12V7AhLiFePO4_Width/2, MoBattery12V7AhLiFePO4_Depth/2, 0 ], [ 0, 0, 1 ], -90 ],  
  [ [ 0, MoBattery12V7AhLiFePO4_Depth/2, -MoBattery12V7AhLiFePO4_BodyHeight/2 ], [ 1, 0, 0 ], 90 ],  
  [ [ 0, MoBattery12V7AhLiFePO4_Depth/2, MoBattery12V7AhLiFePO4_BodyHeight/2 + MoBattery12V7AhLiFePO4_TopHeight], [ 1, 0, 0 ], -90 ],  

  [ [ MoBattery12V7AhLiFePO4_TerminalXOffset, MoBattery12V7AhLiFePO4_Depth/2 + MoBattery12V7AhLiFePO4_TerminalYOffset, MoBattery12V7AhLiFePO4_BodyHeight/2 + MoBattery12V7AhLiFePO4_TopHeight], [ 1, 0, 0 ], -90 ],  
  [ [ MoBattery12V7AhLiFePO4_TerminalXOffset, MoBattery12V7AhLiFePO4_Depth/2 - MoBattery12V7AhLiFePO4_TerminalYOffset, MoBattery12V7AhLiFePO4_BodyHeight/2 + MoBattery12V7AhLiFePO4_TopHeight], [ 1, 0, 0 ], -90 ],  
  [ [ -MoBattery12V7AhLiFePO4_TerminalXOffset, MoBattery12V7AhLiFePO4_Depth/2 + MoBattery12V7AhLiFePO4_TerminalYOffset, MoBattery12V7AhLiFePO4_BodyHeight/2 + MoBattery12V7AhLiFePO4_TopHeight], [ 1, 0, 0 ], -90 ],  
  [ [ -MoBattery12V7AhLiFePO4_TerminalXOffset, MoBattery12V7AhLiFePO4_Depth/2 - MoBattery12V7AhLiFePO4_TerminalYOffset, MoBattery12V7AhLiFePO4_BodyHeight/2 + MoBattery12V7AhLiFePO4_TopHeight], [ 1, 0, 0 ], -90 ],  
  
//  [ [ -MoBattery12V7AhLiFePO4_WireSpacing / 2, MoBattery12V7AhLiFePO4_Depth/2, MoBattery12V7AhLiFePO4_BodyHeight/2 + MoBattery12V7AhLiFePO4_TopHeight], [ 1, 0, 0 ], -90 ],  
//  [ [ MoBattery12V7AhLiFePO4_WireSpacing / 2, MoBattery12V7AhLiFePO4_Depth/2, MoBattery12V7AhLiFePO4_BodyHeight/2 + MoBattery12V7AhLiFePO4_TopHeight], [ 1, 0, 0 ], -90 ],  
];

module moBattery12V7AhLiFePO4( p = 0, info = false ) {
    moPresent( positions, p, info ) {
        translate( [ 0, MoBattery12V7AhLiFePO4_Depth/2, 0 ] ) {
          union() {
            color( MoBattery12V7AhLiFePO4_BodyColor ) {
              cube( [ MoBattery12V7AhLiFePO4_Width, MoBattery12V7AhLiFePO4_Depth,  MoBattery12V7AhLiFePO4_BodyHeight ], center = true );
            }
            translate( [ 0, 0, MoBattery12V7AhLiFePO4_Height/2] ) {
              color( MoBattery12V7AhLiFePO4_TopColor ) {
                union() {
                  cube( [ MoBattery12V7AhLiFePO4_TopWidth, MoBattery12V7AhLiFePO4_TopDepth,  MoBattery12V7AhLiFePO4_TopHeight ], center = true );
                  cube( [ MoBattery12V7AhLiFePO4_TopSepWidth, MoBattery12V7AhLiFePO4_TopSepDepth,  MoBattery12V7AhLiFePO4_TopSepHeight ], center = true );
                }
              }          
            }
            translate( [ MoBattery12V7AhLiFePO4_TerminalXOffset, MoBattery12V7AhLiFePO4_TerminalYOffset, MoBattery12V7AhLiFePO4_Height/2 ] ) {
              color( MoBattery12V7AhLiFePO4_TerminalColor ) {
                  cube( [ MoBattery12V7AhLiFePO4_TerminalWidth, MoBattery12V7AhLiFePO4_TerminalDepth,  MoBattery12V7AhLiFePO4_TerminalHeight ], center = true );
              }          
            }
            translate( [ MoBattery12V7AhLiFePO4_TerminalXOffset, -MoBattery12V7AhLiFePO4_TerminalYOffset, MoBattery12V7AhLiFePO4_Height/2 ] ) {
              color( MoBattery12V7AhLiFePO4_TerminalColor ) {
                  cube( [ MoBattery12V7AhLiFePO4_TerminalWidth, MoBattery12V7AhLiFePO4_TerminalDepth,  MoBattery12V7AhLiFePO4_TerminalHeight ], center = true );
              }          
            }
            translate( [ -MoBattery12V7AhLiFePO4_TerminalXOffset, MoBattery12V7AhLiFePO4_TerminalYOffset, MoBattery12V7AhLiFePO4_Height/2 ] ) {
              color( MoBattery12V7AhLiFePO4_TerminalColor ) {
                  cube( [ MoBattery12V7AhLiFePO4_TerminalWidth, MoBattery12V7AhLiFePO4_TerminalDepth,  MoBattery12V7AhLiFePO4_TerminalHeight ], center = true );
              }          
            }
            translate( [ -MoBattery12V7AhLiFePO4_TerminalXOffset, -MoBattery12V7AhLiFePO4_TerminalYOffset, MoBattery12V7AhLiFePO4_Height/2 ] ) {
              color( MoBattery12V7AhLiFePO4_TerminalColor ) {
                  cube( [ MoBattery12V7AhLiFePO4_TerminalWidth, MoBattery12V7AhLiFePO4_TerminalDepth,  MoBattery12V7AhLiFePO4_TerminalHeight ], center = true );
              }          
            }
          }
        }
    }
}


function moBattery12V7AhLiFePO4Position( p = 0 ) = positions[ p ];

moMoveOriginTo( moBattery12V7AhLiFePO4Position( 1 ) ) {
  moBattery12V7AhLiFePO4( 0, info = true, $name = true );
}

