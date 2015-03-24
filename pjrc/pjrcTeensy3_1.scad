include <../mo/mo.scad>
use<../mocad/moPCB.scad>

PJRCTeensy3_1_ComponentHeight = 0.03 * in;
PJRCTeensy3_1_PCBDepth = 0.06 * in;
PJRCTeensy3_1_Height = 1.4 * in;
PJRCTeensy3_1_Width = 0.7 * in;
PJRCTeensy3_1_Depth = PJRCTeensy3_1_ComponentHeight + PJRCTeensy3_1_PCBDepth;
PJRCTeensy3_1_WireSpacing = 0.1 * in;

// None of these are specified on the site.  
PJRCTeensy3_1_HoleDiameter = 0.15 * in;
PJRCTeensy3_1_HoleWidth = 0.55 * in;
PJRCTeensy3_1_HoleHeight = 0.55 * in;

PJRCTeensy3_1_PCBColor = [ 0, 0.2, 0 ];

PJRCTeensy3_1_ChipHeight = 0.385 * in;
PJRCTeensy3_1_ChipWidth = 0.385 * in;
PJRCTeensy3_1_ChipDepth = 0.05 * in;
PRRCTeensy3_1_ChipOffset = 0.13 * in;

PJRCTeensy3_1_PushButtonHeight = 0.1 * in;
PJRCTeensy3_1_PushButtonWidth = 0.165 * in;
PJRCTeensy3_1_PushButtonDepth = 0.05 * in;

PJRCTeensy3_1_PushButtonActuatorHeight = 0.06 * in;
PJRCTeensy3_1_PushButtonActuatorWidth = 0.08 * in;
PJRCTeensy3_1_PushButtonActuatorDepth = 0.03 * in;

PJRCTeensy3_1_USBMicroConnectorHeight = 0.2 * in;
PJRCTeensy3_1_USBMicroConnectorWidth = 0.3 * in;
PJRCTeensy3_1_USBMicroConnectorDepth = 0.1 * in;
PJRCTeensy3_1_USBMicroConnectorWall = 0.02 * in;

PJRCTeensy3_1_PCBSignals = 14;
PJRCTeensy3_1_PCBSignalsWidth = 0.6 * in;
PJRCTeensy3_1_PCBSignalSpacing = 0.1 * in;
PJRCTeensy3_1_PCBSignalHoleDiameter = 0.03 * in;

PJRCTeensy3_1_PushButtonOffset = PJRCTeensy3_1_Height/2 - 0.168 * in;
PJRCTeensy3_1_USBMicroConnectorOffset = -(PJRCTeensy3_1_Height)/2 + 0.1;

positions = [ 
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, PJRCTeensy3_1_PCBDepth, 0 ], [ 0, 0, 1 ], 180 ],


  [ [ -PJRCTeensy3_1_Width/2, PJRCTeensy3_1_PCBDepth / 2, 0 ], [0, 0, 1 ], -90 ], 
  [ [ +PJRCTeensy3_1_Width/2, PJRCTeensy3_1_PCBDepth / 2, 0 ], [0, 0, 1 ], 90 ], 
  [ [ 0, PJRCTeensy3_1_PCBDepth / 2, PJRCTeensy3_1_Height/2 ], [1, 0, 0 ], -90 ], 
  [ [ 0, PJRCTeensy3_1_PCBDepth / 2, -PJRCTeensy3_1_Height/2 ], [1, 0, 0 ], 90 ], 

  [ [ 0, -PJRCTeensy3_1_USBMicroConnectorDepth/2, -PJRCTeensy3_1_Height/2 ], [ 1, 0, 0 ], 90 ],
  
  [ [ -PJRCTeensy3_1_PCBSignalsWidth/2, 0, 0 ], [0, 0, 1 ], 0 ], 
  [ [  PJRCTeensy3_1_PCBSignalsWidth/2, 0,  ], [0, 0, 1 ], 0 ], 
  
  [ [ -PJRCTeensy3_1_PCBSignalsWidth/2, PJRCTeensy3_1_PCBDepth, 0 ], [0, 0, 1 ], 180 ], 
  [ [  PJRCTeensy3_1_PCBSignalsWidth/2, PJRCTeensy3_1_PCBDepth, 0 ], [0, 0, 1 ], 180 ], 
];

module pjrcTeensy3_1( p = 0, info = false ) {
  moPresent( positions, p, info ) {
    moPCB( PJRCTeensy3_1_Width, PJRCTeensy3_1_Height, color = PJRCTeensy3_1_PCBColor, thickness = PJRCTeensy3_1_PCBDepth, $name = false ) {
      if ( $internalDetail ) {
        translate( [ -PJRCTeensy3_1_PCBSignalsWidth / 2, 0, 0 ] )
          moYaw()
            moPCBHoles( PJRCTeensy3_1_PCBSignals, 0.1*in, PJRCTeensy3_1_PCBSignalHoleDiameter ); 
        translate( [ PJRCTeensy3_1_PCBSignalsWidth / 2, 0, 0 ] )
          moYaw()
            moPCBHoles( PJRCTeensy3_1_PCBSignals, 0.1*in, PJRCTeensy3_1_PCBSignalHoleDiameter ); 
      }
   }

    moPitch() moPose( t = [ 0, 0, -PJRCTeensy3_1_PCBDepth ] ) {
         union() {
           if ( $internalDetail ) {
            // Chip
            translate( [ 0, PRRCTeensy3_1_ChipOffset, PJRCTeensy3_1_PCBDepth + PJRCTeensy3_1_ChipDepth / 2] ) {
              color( [ 0, 0, 0 ] ) {
                cube( [ PJRCTeensy3_1_ChipWidth, PJRCTeensy3_1_ChipHeight, PJRCTeensy3_1_ChipDepth ], center = true );                
              }
            }
            // Push Button
            translate( [ 0, PJRCTeensy3_1_PushButtonOffset, PJRCTeensy3_1_PCBDepth + PJRCTeensy3_1_PushButtonDepth /2] ) {
                union() {
                  color( Aluminum ) cube( [ PJRCTeensy3_1_PushButtonWidth, PJRCTeensy3_1_PushButtonHeight, PJRCTeensy3_1_PushButtonDepth ], center = true );
                  translate( [ 0, 0, PJRCTeensy3_1_PushButtonDepth / 2 ] )
                    color( [ 0, 0, 0 ] ) cube( [ PJRCTeensy3_1_PushButtonActuatorWidth, PJRCTeensy3_1_PushButtonActuatorHeight, PJRCTeensy3_1_PushButtonActuatorDepth ], center = true );                
              }
            }
          }
          // USB Connector
          translate( [ 0, PJRCTeensy3_1_USBMicroConnectorOffset, PJRCTeensy3_1_PCBDepth + PJRCTeensy3_1_USBMicroConnectorDepth /2] ) {
            color( Aluminum ) {
              difference() {
                cube( [ PJRCTeensy3_1_USBMicroConnectorWidth, PJRCTeensy3_1_USBMicroConnectorHeight, PJRCTeensy3_1_USBMicroConnectorDepth ], center = true );
                translate( [ 0, -2 * PJRCTeensy3_1_USBMicroConnectorWall, 0 ] )
                cube( [ PJRCTeensy3_1_USBMicroConnectorWidth - 2 * PJRCTeensy3_1_USBMicroConnectorWall, 
                        PJRCTeensy3_1_USBMicroConnectorHeight - 2 * PJRCTeensy3_1_USBMicroConnectorWall, 
                        PJRCTeensy3_1_USBMicroConnectorDepth - 2 * PJRCTeensy3_1_USBMicroConnectorWall ], center = true );
                
              }
            }
          }

      }
    }
  }
}


function pjrcTeensy3_1Position( p = 0 ) = positions[ p ];

moMoveOriginTo( pjrcTeensy3_1Position( 1 ) ) {
  pjrcTeensy3_1( 0, info = true, $name = true );
}

