include <../mo/mo.scad>
use<../mocad/moPCB.scad>
use <../mocad/moMicroUSB.scad>
use <../mocad/moRJ45SocketSmall.scad>

$internalDetail = true;

WR703N_ComponentHeight = 0.03 * in;
WR703N_PCBDepth = 0.06 * in;
WR703N_Height = 2.05 * in;
WR703N_Width = 2.05 * in;
WR703N_Depth = WR703N_ComponentHeight + WR703N_PCBDepth;
WR703N_WireSpacing = 0.1 * in;

WR703N_PCBColor = [ 0, 0.2, 0 ];

WR703N_RAM_ChipHeight = 1.0 * in;
WR703N_RAM_ChipWidth = 0.33 * in;
WR703N_RAM_ChipDepth = 0.05 * in;
WR703N_RAM_ChipXOffset = -0.8 * in;
WR703N_RAM_ChipYOffset = 0.45 * in;

WR703N_CPU_ChipHeight = 0.58 * in;
WR703N_CPU_ChipWidth = 0.58 * in;
WR703N_CPU_ChipDepth = 0.05 * in;
WR703N_CPU_ChipXOffset = 0.2 * in;
WR703N_CPU_ChipYOffset = 0.2 * in;

WR703N_PushButtonHeight = 0.1 * in;
WR703N_PushButtonWidth = 0.165 * in;
WR703N_PushButtonDepth = 0.05 * in;

WR703N_PushButtonActuatorHeight = 0.06 * in;
WR703N_PushButtonActuatorWidth = 0.08 * in;
WR703N_PushButtonActuatorDepth = 0.03 * in;

WR703N_PCBSignals = 14;
WR703N_PCBSignalsWidth = 0.6 * in;
WR703N_PCBSignalSpacing = 0.1 * in;
WR703N_PCBSignalHoleDiameter = 0.03 * in;

WR703N_PushButtonOffset = WR703N_Height/2 - 0.168 * in;

WR703N_USBMicroConnectorYOffset = -(WR703N_Height)/2 + 0.05;
WR703N_USBMicroConnectorXOffset = (0.15 + 0.2)*in;
WR703N_USBMicroConnectorDepth = 0;

WR703N_RJ45ConnectorYOffset = -(WR703N_Height)/2 + 0.05;
WR703N_RJ45ConnectorXOffset = (-0.35 + 0.05)*in;

positions = [ 
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, WR703N_PCBDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -WR703N_Width/2, WR703N_PCBDepth / 2, 0 ], [0, 0, 1 ], -90 ], 
  [ [ +WR703N_Width/2, WR703N_PCBDepth / 2, 0 ], [0, 0, 1 ], 90 ], 
  [ [ 0, WR703N_PCBDepth / 2, WR703N_Height/2 ], [1, 0, 0 ], -90 ], 
  [ [ 0, WR703N_PCBDepth / 2, -WR703N_Height/2 ], [1, 0, 0 ], 90 ], 

  [ [ 0, -WR703N_USBMicroConnectorDepth/2, -WR703N_Height/2 ], [ 1, 0, 0 ], 90 ],
     
];

module tpWR703N( p = 0, info = false ) {
  moPresent( positions, p, info ) {
    difference() {
      moPCB( WR703N_Width, WR703N_Height, color = WR703N_PCBColor, thickness = WR703N_PCBDepth, $name = false );
    }

    moPitch() moPose( t = [ 0, 0, -WR703N_PCBDepth ] ) {
         union() {
           if ( $internalDetail ) {
            // RAM Chip
            translate( [ WR703N_RAM_ChipXOffset, WR703N_RAM_ChipYOffset, WR703N_PCBDepth + WR703N_RAM_ChipDepth / 2] ) {
              color( [ 0, 0, 0 ] ) {
                cube( [ WR703N_RAM_ChipWidth, WR703N_RAM_ChipHeight,WR703N_RAM_ChipDepth ], center = true );                
              }
            }
            // CPU Chip
            translate( [ WR703N_CPU_ChipXOffset, WR703N_CPU_ChipYOffset, WR703N_PCBDepth + WR703N_CPU_ChipDepth / 2] ) {
              color( [ 0, 0, 0 ]  ) {
                cube( [ WR703N_CPU_ChipWidth, WR703N_CPU_ChipHeight,WR703N_CPU_ChipDepth ], center = true );                
              }
            }
          }
          // USB Connector 1
          translate( [ WR703N_USBMicroConnectorXOffset, WR703N_USBMicroConnectorYOffset, WR703N_PCBDepth ] ) {
              moMicroUSB( 1, $name = false, info = false );
          }
          // Ethernet Connector
          translate( [ WR703N_RJ45ConnectorXOffset, WR703N_RJ45ConnectorYOffset, WR703N_PCBDepth ] ) {
              moRJ45SocketSmall( 1, $name = false, info = false );
          }
      }
    }
  }
}


function tpWR703NPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( tpWR703NPosition( 1 ) ) {
  tpWR703N( 0, info = true, $name = true );
}

