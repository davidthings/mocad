include <../mo/mo.scad>

AdaBatteryChargerMicroLiPo_ComponentHeight = 0.03 * in;
AdaBatteryChargerMicroLiPo_PCBDepth = 0.06 * in;
AdaBatteryChargerMicroLiPo_Height = 0.75 * in;
AdaBatteryChargerMicroLiPo_Width = 0.8 * in;
AdaBatteryChargerMicroLiPo_Depth = AdaBatteryChargerMicroLiPo_ComponentHeight + AdaBatteryChargerMicroLiPo_PCBDepth;
AdaBatteryChargerMicroLiPo_WireSpacing = 0.1 * in;

// None of these are specified on the site.  
AdaBatteryChargerMicroLiPo_HoleDiameter = 0.15 * in;
AdaBatteryChargerMicroLiPo_HoleWidth = 0.55 * in;
AdaBatteryChargerMicroLiPo_HoleHeight = 0.55 * in;

AdaBatteryChargerMicroLiPo_PCBColor = [ 0, 0.2, 1 ];

AdaBatteryChargerMicroLiPo_ChipHeight = 0.1 * in;
AdaBatteryChargerMicroLiPo_ChipWidth = 0.15 * in;
AdaBatteryChargerMicroLiPo_ChipDepth = 0.025 * in;

AdaBatteryChargerMicroLiPo_PowerConnectorHeight = 0.2 * in;
AdaBatteryChargerMicroLiPo_PowerConnectorWidth = 0.3 * in;
AdaBatteryChargerMicroLiPo_PowerConnectorDepth = 0.2 * in;
AdaBatteryChargerMicroLiPo_PowerConnectorWall = 0.03 * in;

AdaBatteryChargerMicroLiPo_USBMicroConnectorHeight = 0.2 * in;
AdaBatteryChargerMicroLiPo_USBMicroConnectorWidth = 0.3 * in;
AdaBatteryChargerMicroLiPo_USBMicroConnectorDepth = 0.1 * in;
AdaBatteryChargerMicroLiPo_USBMicroConnectorWall = 0.02 * in;

AdaBatteryChargerMicroLiPo_PCBSignals = 4;
AdaBatteryChargerMicroLiPo_PCBSignalSpacing = 0.1 * in;
AdaBatteryChargerMicroLiPo_PCBSignalHoleRadius = 0.015 * in;

AdaBatteryChargerMicroLiPo_PowerConnectorOffset = AdaBatteryChargerMicroLiPo_HoleHeight/2;
AdaBatteryChargerMicroLiPo_USBMicroConnectorOffset = -AdaBatteryChargerMicroLiPo_HoleHeight/2;

positions = [ 
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, AdaBatteryChargerMicroLiPo_PCBDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, 0, -AdaBatteryChargerMicroLiPo_HoleHeight/2 ], [0, 0, 1 ], 0 ], 
  [ [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, 0, AdaBatteryChargerMicroLiPo_HoleHeight/2 ], [0, 0, 1 ], 0 ], 
  [ [ AdaBatteryChargerMicroLiPo_HoleWidth/2, 0, AdaBatteryChargerMicroLiPo_HoleHeight/2 ], [0, 0, 1 ], 0 ], 
  [ [ AdaBatteryChargerMicroLiPo_HoleWidth/2, 0, -AdaBatteryChargerMicroLiPo_HoleHeight/2 ], [0, 0, 1 ], 0 ], 

  [ [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, AdaBatteryChargerMicroLiPo_PCBDepth, -AdaBatteryChargerMicroLiPo_HoleHeight/2 ], [0, 0, 1 ], 180 ], 
  [ [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, AdaBatteryChargerMicroLiPo_PCBDepth, AdaBatteryChargerMicroLiPo_HoleHeight/2 ], [0, 0, 1 ], 180 ], 
  [ [ AdaBatteryChargerMicroLiPo_HoleWidth/2, AdaBatteryChargerMicroLiPo_PCBDepth, AdaBatteryChargerMicroLiPo_HoleHeight/2 ], [0, 0, 1 ], 180 ], 
  [ [ AdaBatteryChargerMicroLiPo_HoleWidth/2, AdaBatteryChargerMicroLiPo_PCBDepth, -AdaBatteryChargerMicroLiPo_HoleHeight/2 ], [0, 0, 1 ], 180 ], 

  [ [ 0, -AdaBatteryChargerMicroLiPo_PowerConnectorDepth/2, AdaBatteryChargerMicroLiPo_Height/2 ], [ 1, 0, 0 ], -90 ],
  [ [ 0, -AdaBatteryChargerMicroLiPo_USBMicroConnectorDepth/2, -AdaBatteryChargerMicroLiPo_Height/2 ], [ 1, 0, 0 ], 90 ],
  [ [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, 0, -1.5 * AdaBatteryChargerMicroLiPo_PCBSignalSpacing ], [0, 0, 1 ], 0 ], 
  [ [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, 0, -0.5 * AdaBatteryChargerMicroLiPo_PCBSignalSpacing ], [0, 0, 1 ], 0 ], 
  [ [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, 0, 0.5 * AdaBatteryChargerMicroLiPo_PCBSignalSpacing ], [0, 0, 1 ], 0 ], 
  [ [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, 0, 1.5 * AdaBatteryChargerMicroLiPo_PCBSignalSpacing ], [0, 0, 1 ], 0 ], 
  [ [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, AdaBatteryChargerMicroLiPo_PCBDepth, -1.5 * AdaBatteryChargerMicroLiPo_PCBSignalSpacing ], [0, 0, 1 ], 180 ], 
  [ [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, AdaBatteryChargerMicroLiPo_PCBDepth, -0.5 * AdaBatteryChargerMicroLiPo_PCBSignalSpacing ], [0, 0, 1 ], 180 ], 
  [ [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, AdaBatteryChargerMicroLiPo_PCBDepth, 0.5 * AdaBatteryChargerMicroLiPo_PCBSignalSpacing ], [0, 0, 1 ], 180 ], 
  [ [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, AdaBatteryChargerMicroLiPo_PCBDepth, 1.5 * AdaBatteryChargerMicroLiPo_PCBSignalSpacing ], [0, 0, 1 ], 180 ],

  [ [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, 0, 0 ], [0, 0, 1 ], 0 ], 
  [ [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, AdaBatteryChargerMicroLiPo_PCBDepth, 0 ], [0, 0, 1 ], 180 ], 
];

module adaBatteryChargerMicroLiPo( p = 0, info = false ) {
  moPresent( positions, p, info ) {
    moPitch() moPose( t = [ 0, 0, -AdaBatteryChargerMicroLiPo_PCBDepth ] ) {
         union() {
          color( AdaBatteryChargerMicroLiPo_PCBColor ) {
            linear_extrude( height = AdaBatteryChargerMicroLiPo_PCBDepth, twist = 0 ) {
              difference() {
                square( [ AdaBatteryChargerMicroLiPo_Width, AdaBatteryChargerMicroLiPo_Height ], center = true );
                translate( [ AdaBatteryChargerMicroLiPo_HoleWidth/2, AdaBatteryChargerMicroLiPo_HoleHeight/2 ] ) {
                  circle( d = AdaBatteryChargerMicroLiPo_HoleDiameter, center = true );
                }
                translate( [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, AdaBatteryChargerMicroLiPo_HoleHeight/2 ] ) {
                  circle( d = AdaBatteryChargerMicroLiPo_HoleDiameter, center = true );
                }
                translate( [ -AdaBatteryChargerMicroLiPo_HoleWidth/2, -AdaBatteryChargerMicroLiPo_HoleHeight/2 ] ) {
                  circle( d = AdaBatteryChargerMicroLiPo_HoleDiameter, center = true );
                }
                translate( [ AdaBatteryChargerMicroLiPo_HoleWidth/2, -AdaBatteryChargerMicroLiPo_HoleHeight/2 ] ) {
                  circle( d = AdaBatteryChargerMicroLiPo_HoleDiameter, center = true );
                }
                translate( [ -AdaBatteryChargerMicroLiPo_HoleWidth / 2, 0, 0 ] ) {
                  for ( i = [ -AdaBatteryChargerMicroLiPo_PCBSignals/2: AdaBatteryChargerMicroLiPo_PCBSignals/2-1 ] ) {
                    translate( [ 0, i * AdaBatteryChargerMicroLiPo_PCBSignalSpacing + AdaBatteryChargerMicroLiPo_PCBSignalSpacing / 2, 0 ] )
                      circle( r = AdaBatteryChargerMicroLiPo_PCBSignalHoleRadius, center = true );        
              }
            }
              }
            }                     
          }
          // Chip
          translate( [ 0, 0, AdaBatteryChargerMicroLiPo_PCBDepth+AdaBatteryChargerMicroLiPo_ChipDepth / 2 ] ) {
            color( [ 0, 0, 0 ] ) {
              cube( [ AdaBatteryChargerMicroLiPo_ChipWidth, AdaBatteryChargerMicroLiPo_ChipHeight, AdaBatteryChargerMicroLiPo_ChipDepth ], center = true );                
            }
          }
          // Power Connector
          translate( [ 0, AdaBatteryChargerMicroLiPo_PowerConnectorOffset, AdaBatteryChargerMicroLiPo_PCBDepth + AdaBatteryChargerMicroLiPo_PowerConnectorDepth /2] ) {
            color( [ 1, 1, 1 ] ) {
              difference() {
                cube( [ AdaBatteryChargerMicroLiPo_PowerConnectorWidth, AdaBatteryChargerMicroLiPo_PowerConnectorHeight, AdaBatteryChargerMicroLiPo_PowerConnectorDepth ], center = true );
                translate( [ 0, 2 * AdaBatteryChargerMicroLiPo_PowerConnectorWall, 0 ] )
                cube( [ AdaBatteryChargerMicroLiPo_PowerConnectorWidth - 2 * AdaBatteryChargerMicroLiPo_PowerConnectorWall, 
                        AdaBatteryChargerMicroLiPo_PowerConnectorHeight - 2 * AdaBatteryChargerMicroLiPo_PowerConnectorWall, 
                        AdaBatteryChargerMicroLiPo_PowerConnectorDepth - 2 * AdaBatteryChargerMicroLiPo_PowerConnectorWall ], center = true );
                
              }
            }
          }
          // USB Connector
          translate( [ 0, AdaBatteryChargerMicroLiPo_USBMicroConnectorOffset, AdaBatteryChargerMicroLiPo_PCBDepth + AdaBatteryChargerMicroLiPo_USBMicroConnectorDepth /2] ) {
            color( Aluminum ) {
              difference() {
                cube( [ AdaBatteryChargerMicroLiPo_USBMicroConnectorWidth, AdaBatteryChargerMicroLiPo_USBMicroConnectorHeight, AdaBatteryChargerMicroLiPo_USBMicroConnectorDepth ], center = true );
                translate( [ 0, -2 * AdaBatteryChargerMicroLiPo_USBMicroConnectorWall, 0 ] )
                cube( [ AdaBatteryChargerMicroLiPo_USBMicroConnectorWidth - 2 * AdaBatteryChargerMicroLiPo_USBMicroConnectorWall, 
                        AdaBatteryChargerMicroLiPo_USBMicroConnectorHeight - 2 * AdaBatteryChargerMicroLiPo_USBMicroConnectorWall, 
                        AdaBatteryChargerMicroLiPo_USBMicroConnectorDepth - 2 * AdaBatteryChargerMicroLiPo_USBMicroConnectorWall ], center = true );
                
              }
            }
          }

      }
    }
  }
}


function adaBatteryChargerMicroLiPoPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( adaBatteryChargerMicroLiPoPosition( 13 ) ) {
  adaBatteryChargerMicroLiPo( 0, info = true, $name = true );
}

