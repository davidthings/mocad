include <../mo/mo.scad>
use<../mocad/moPCB.scad>
use <../mocad/moMicroUSB.scad>
use <../mocad/moRJ45Socket.scad>
use <../mocad/moDCCoaxSocket.scad>
use <../mocad/moGridHeatsink.scad>

$internalDetail = true;

Parallella_Desktop_ComponentHeight = 0.03 * in;
Parallella_Desktop_PCBDepth = 0.06 * in;
Parallella_Desktop_Height = 3.4 * in;
Parallella_Desktop_Width = 2.15 * in;
Parallella_Desktop_Depth = Parallella_Desktop_ComponentHeight + Parallella_Desktop_PCBDepth;
Parallella_Desktop_WireSpacing = 0.1 * in;

// None of these are specified on the site.  
Parallella_Desktop_HoleDiameter = 0.125 * in;
Parallella_Desktop_HoleSetin = 0.125 * in;

Parallella_Desktop_PCBColor = [ 0, 0.2, 0 ];

Parallella_Desktop_Zynq_ChipHeight = 0.66 * in;
Parallella_Desktop_Zynq_ChipWidth = 0.66 * in;
Parallella_Desktop_Zynq_ChipDepth = 0.05 * in;
Parallella_Desktop_Zynq_ChipXOffset = 0.08 * in;
Parallella_Desktop_Zynq_ChipYOffset = 0.0 * in;

Parallella_Desktop_Epiphany_ChipHeight = 0.58 * in;
Parallella_Desktop_Epiphany_ChipWidth = 0.58 * in;
Parallella_Desktop_Epiphany_ChipDepth = 0.05 * in;
Parallella_Desktop_Epiphany_ChipXOffset = 0.08 * in;
Parallella_Desktop_Epiphany_ChipYOffset = 0.75 * in;

Parallella_Desktop_PushButtonHeight = 0.1 * in;
Parallella_Desktop_PushButtonWidth = 0.165 * in;
Parallella_Desktop_PushButtonDepth = 0.05 * in;

Parallella_Desktop_PushButtonActuatorHeight = 0.06 * in;
Parallella_Desktop_PushButtonActuatorWidth = 0.08 * in;
Parallella_Desktop_PushButtonActuatorDepth = 0.03 * in;

Parallella_Desktop_PCBSignals = 14;
Parallella_Desktop_PCBSignalsWidth = 0.6 * in;
Parallella_Desktop_PCBSignalSpacing = 0.1 * in;
Parallella_Desktop_PCBSignalHoleDiameter = 0.03 * in;

Parallella_Desktop_PushButtonOffset = Parallella_Desktop_Height/2 - 0.168 * in;

Parallella_Desktop_USBMicroConnector1YOffset = -(Parallella_Desktop_Height)/2 + 0.05;
Parallella_Desktop_USBMicroConnector1XOffset = (0.15 + 0.1)*in;
Parallella_Desktop_USBMicroConnector1Depth = 0;

Parallella_Desktop_USBMicroConnector2YOffset = (Parallella_Desktop_Height)/2 + 0.05;
Parallella_Desktop_USBMicroConnector2XOffset = -(0.15 + 0.1)*in;
Parallella_Desktop_USBMicroConnector2Depth = 0;

Parallella_Desktop_RJ45ConnectorYOffset = -(Parallella_Desktop_Height)/2 + 0.05;
Parallella_Desktop_RJ45ConnectorXOffset = (-0.35 + 0.05)*in;

Parallella_Desktop_DCCoaxSocketYOffset = -(Parallella_Desktop_Height)/2 + 0.05;
Parallella_Desktop_DCCoaxSocketXOffset = (0.6 + 0.1)*in;

Parallella_Desktop_HeatsinkXOffset = 0;
Parallella_Desktop_HeatsinkYOffset = 0.42 * in;
Parallella_Desktop_HeatsinkWidth = 2.1 * in;
Parallella_Desktop_HeatsinkHeight = 2.1 * in;
Parallella_Desktop_HeatsinkDepth = 0.35 * in;
Parallella_Desktop_HeatsinkFinCount = 15;

positions = [ 
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, Parallella_Desktop_PCBDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -Parallella_Desktop_Width/2, Parallella_Desktop_PCBDepth / 2, 0 ], [0, 0, 1 ], -90 ], 
  [ [ +Parallella_Desktop_Width/2, Parallella_Desktop_PCBDepth / 2, 0 ], [0, 0, 1 ], 90 ], 
  [ [ 0, Parallella_Desktop_PCBDepth / 2, Parallella_Desktop_Height/2 ], [1, 0, 0 ], -90 ], 
  [ [ 0, Parallella_Desktop_PCBDepth / 2, -Parallella_Desktop_Height/2 ], [1, 0, 0 ], 90 ], 

  [ [ 0, -Parallella_Desktop_USBMicroConnector1Depth/2, -Parallella_Desktop_Height/2 ], [ 1, 0, 0 ], 90 ],
     
];

module parallellaDesktop( p = 0, info = false ) {
  moPresent( positions, p, info ) {
    difference() {
    moPCB( Parallella_Desktop_Width, Parallella_Desktop_Height, color = Parallella_Desktop_PCBColor, thickness = Parallella_Desktop_PCBDepth, $name = false );
        translate( [ Parallella_Desktop_Width / 2 - Parallella_Desktop_HoleSetin, Parallella_Desktop_PCBDepth * 1.5, Parallella_Desktop_Height/2 - Parallella_Desktop_HoleSetin ] )
          rotate( [ 90, 0, 0 ] )
            cylinder( d = Parallella_Desktop_HoleDiameter, h = Parallella_Desktop_PCBDepth * 2  );
        translate( [ Parallella_Desktop_Width / 2 - Parallella_Desktop_HoleSetin, Parallella_Desktop_PCBDepth * 1.5, -Parallella_Desktop_Height/2 + Parallella_Desktop_HoleSetin ] )
          rotate( [ 90, 0, 0 ] )
            cylinder( d = Parallella_Desktop_HoleDiameter, h = Parallella_Desktop_PCBDepth * 2  );
        translate( [ -Parallella_Desktop_Width / 2 + Parallella_Desktop_HoleSetin, Parallella_Desktop_PCBDepth * 1.5, Parallella_Desktop_Height/2 - Parallella_Desktop_HoleSetin ] )
          rotate( [ 90, 0, 0 ] )
            cylinder( d = Parallella_Desktop_HoleDiameter, h = Parallella_Desktop_PCBDepth * 2  );
        translate( [ -Parallella_Desktop_Width / 2 + Parallella_Desktop_HoleSetin, Parallella_Desktop_PCBDepth * 1.5, -Parallella_Desktop_Height/2 + Parallella_Desktop_HoleSetin ] )
          rotate( [ 90, 0, 0 ] )
            cylinder( d = Parallella_Desktop_HoleDiameter, h = Parallella_Desktop_PCBDepth * 2  );
    }

    moPitch() moPose( t = [ 0, 0, -Parallella_Desktop_PCBDepth ] ) {
         union() {
           if ( $internalDetail ) {
            // Zynq Chip
            translate( [ Parallella_Desktop_Zynq_ChipXOffset, Parallella_Desktop_Zynq_ChipYOffset, Parallella_Desktop_PCBDepth + Parallella_Desktop_Zynq_ChipDepth / 2] ) {
              color( [ 0, 0, 0 ] ) {
                cube( [ Parallella_Desktop_Zynq_ChipWidth, Parallella_Desktop_Zynq_ChipHeight,Parallella_Desktop_Zynq_ChipDepth ], center = true );                
              }
            }
            // Epiphany Chip
            translate( [ Parallella_Desktop_Epiphany_ChipXOffset, Parallella_Desktop_Epiphany_ChipYOffset, Parallella_Desktop_PCBDepth + Parallella_Desktop_Epiphany_ChipDepth / 2] ) {
              color( Aluminum ) {
                cube( [ Parallella_Desktop_Epiphany_ChipWidth, Parallella_Desktop_Epiphany_ChipHeight,Parallella_Desktop_Epiphany_ChipDepth ], center = true );                
              }
            }
          }
          // USB Connector 1
          translate( [ Parallella_Desktop_USBMicroConnector1XOffset, Parallella_Desktop_USBMicroConnector1YOffset, Parallella_Desktop_PCBDepth ] ) {
              moMicroUSB( 1, $name = false, info = false );
          }
          // USB Connector 2
          translate( [ Parallella_Desktop_USBMicroConnector2XOffset, Parallella_Desktop_USBMicroConnector2YOffset, Parallella_Desktop_PCBDepth ] ) {
              rotate( [ 0, 0, 180 ] )
              moMicroUSB( 1, $name = false, info = false );
          }
          // Ethernet Connector
          translate( [ Parallella_Desktop_RJ45ConnectorXOffset, Parallella_Desktop_RJ45ConnectorYOffset, Parallella_Desktop_PCBDepth ] ) {
              moRJ45Socket( 1, $name = false, info = false );
          }
          // DC Connector
          translate( [ Parallella_Desktop_DCCoaxSocketXOffset, Parallella_Desktop_DCCoaxSocketYOffset, Parallella_Desktop_PCBDepth ] ) {
              moDCCoaxSocket( 1, $name = false, info = false );
          }
         // Heatsink
          translate( [ Parallella_Desktop_HeatsinkXOffset, Parallella_Desktop_HeatsinkYOffset, 2 * Parallella_Desktop_PCBDepth * 1.25 ] ) {
           rotate( [ -90, 0, 0 ] )
          moGridHeatsink( Parallella_Desktop_HeatsinkWidth, Parallella_Desktop_HeatsinkHeight, Parallella_Desktop_HeatsinkDepth, $name = false, info = false );
          }
      }
    }
  }
}


function parallellaDesktopPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( parallellaDesktopPosition( 1 ) ) {
  parallellaDesktop( 0, info = true, $name = true );
}

