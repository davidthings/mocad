include <../mo/mo.scad>

PoDualVNH5019_ComponentHeight = 0.03 * in;
PoDualVNH5019_PCBDepth = 0.06 * in;
PoDualVNH5019_Height = 2.02 * in;
PoDualVNH5019_Width = 2.56 * in;
PoDualVNH5019_Depth = PoDualVNH5019_ComponentHeight + PoDualVNH5019_PCBDepth;

PoDualVNH5019_PCBColor = [ 0, 0.4, 0 ];

// None of these are specified on the site.  
PoDualVNH5019_HoleDiameter = 0.15 * in;
PoDualVNH5019_HoleWidth = 0.55 * in;
PoDualVNH5019_HoleHeight = 0.55 * in;

// Rough
PoDualVNH5019_HoleAOffsetX = -PoDualVNH5019_Width/2 + 0.15 * in;
PoDualVNH5019_HoleAOffsetY = PoDualVNH5019_Height/2 - 0.15 * in;
PoDualVNH5019_HoleBOffsetX = -PoDualVNH5019_Width/2 + 0.44 * in;
PoDualVNH5019_HoleBOffsetY = -PoDualVNH5019_Height/2 + 0.15 * in;

PoDualVNH5019_ChipHeight = 0.68 * in;
PoDualVNH5019_ChipWidth = 0.625 * in;
PoDualVNH5019_ChipDepth = 0.08 * in;
PoDualVNH5019_ChipAOffsetX = PoDualVNH5019_Width/2 - PoDualVNH5019_ChipWidth/2 - 0.68 * in;
PoDualVNH5019_ChipAOffsetY = PoDualVNH5019_Height/2 - PoDualVNH5019_ChipHeight/2 - 0.131 * in;
PoDualVNH5019_ChipBOffsetX = PoDualVNH5019_ChipAOffsetX;
PoDualVNH5019_ChipBOffsetY = -PoDualVNH5019_Height/2 + PoDualVNH5019_ChipHeight/2 + 0.219 * in;

PoDualVNH5019_CapRadius = 0.256 / 2 * in;
PoDualVNH5019_CapDepth = 0.24 * in;
PoDualVNH5019_CapAOffsetX = -PoDualVNH5019_Width/2 + 0.93 * in;
PoDualVNH5019_CapAOffsetY = PoDualVNH5019_Height/2 - 0.281 * in;
PoDualVNH5019_CapBOffsetX = -PoDualVNH5019_Width/2 + 0.87 * in;
PoDualVNH5019_CapBOffsetY = PoDualVNH5019_Height/2 - 0.89 * in;
PoDualVNH5019_CapCOffsetX = -PoDualVNH5019_Width/2 + 0.6 * in;
PoDualVNH5019_CapCOffsetY = -PoDualVNH5019_Height/2 + 0.89 * in;

PoDualVNH5019_PCBSignalSpacing = 0.1 * in;
PoDualVNH5019_PCBSignalHoleRadius = 0.015 * in;

PoDualVNH5019_PCBEdgeSignals = 13;
PoDualVNH5019_PCBEdgeSignalsOffsetX = PoDualVNH5019_HoleBOffsetX - 0.4 * in;
PoDualVNH5019_PCBEdgeSignalsOffsetY = PoDualVNH5019_HoleBOffsetY - 0.1 * in;

PoDualVNH5019_PCBPowerSpacing = 0.2 * in;
PoDualVNH5019_PCBPowerHoleRadius = 0.085 / 2 * in;
PoDualVNH5019_PCBPowerLines = 6;
PoDualVNH5019_PCBPowerLinesOffsetX = PoDualVNH5019_Width / 2 - 0.16 * in;
PoDualVNH5019_PCBPowerLinesOffsetY =  PoDualVNH5019_Height / 2 - 0.525 * in;

PoDualVNH5019_PCBPowerAuxSignals = PoDualVNH5019_PCBPowerLines * 2;
PoDualVNH5019_PCBPowerAuxSpacing = PoDualVNH5019_PCBPowerSpacing / 2;
PoDualVNH5019_PCBPowerAuxRadius = PoDualVNH5019_PCBSignalHoleRadius;
PoDualVNH5019_PCBPowerAuxSignalsOffsetX = PoDualVNH5019_PCBPowerLinesOffsetX + 0.07 * in;
PoDualVNH5019_PCBPowerAuxSignalsOffsetY = PoDualVNH5019_PCBPowerLinesOffsetY + 0.05 * in;

// Add Adruino Sheild Footprint sometime

positions = [ 
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, PoDualVNH5019_PCBDepth, 0 ], [ 0, 0, 1 ], 180 ],

  // Mounting Holes
  [ [ PoDualVNH5019_HoleAOffsetX, 0, PoDualVNH5019_HoleAOffsetY ], [0, 0, 1 ], 0 ], 
  [ [ PoDualVNH5019_HoleBOffsetX, 0, PoDualVNH5019_HoleBOffsetY ], [0, 0, 1 ], 0 ], 
  [ [ PoDualVNH5019_HoleAOffsetX, PoDualVNH5019_PCBDepth, PoDualVNH5019_HoleAOffsetY ], [0, 0, 1 ], 180 ], 
  [ [ PoDualVNH5019_HoleBOffsetX, PoDualVNH5019_PCBDepth, PoDualVNH5019_HoleBOffsetY ], [0, 0, 1 ], 180 ], 

  // EdgeSignals
  [ [ PoDualVNH5019_PCBEdgeSignalsOffsetX, 0, PoDualVNH5019_PCBEdgeSignalsOffsetY + ( PoDualVNH5019_PCBEdgeSignals - 1 )* PoDualVNH5019_PCBSignalSpacing  ], [0, 0, 1 ], 0 ], 
  [ [ PoDualVNH5019_PCBEdgeSignalsOffsetX, 0, PoDualVNH5019_PCBEdgeSignalsOffsetY ], [0, 0, 1 ], 0 ], 
  [ [ PoDualVNH5019_PCBEdgeSignalsOffsetX, PoDualVNH5019_PCBDepth, PoDualVNH5019_PCBEdgeSignalsOffsetY  + ( PoDualVNH5019_PCBEdgeSignals - 1 ) * PoDualVNH5019_PCBSignalSpacing ], [0, 0, 1 ], 180 ], 
  [ [ PoDualVNH5019_PCBEdgeSignalsOffsetX, PoDualVNH5019_PCBDepth, PoDualVNH5019_PCBEdgeSignalsOffsetY ], [0, 0, 1 ], 180 ], 

  // PowerLines
  [ [ PoDualVNH5019_PCBPowerLinesOffsetX, 0, PoDualVNH5019_PCBPowerLinesOffsetY + 0 * PoDualVNH5019_PCBPowerSpacing  ], [0, 0, 1 ], 0 ], 
  [ [ PoDualVNH5019_PCBPowerLinesOffsetX, PoDualVNH5019_PCBDepth, PoDualVNH5019_PCBPowerLinesOffsetY  - 0 * PoDualVNH5019_PCBPowerSpacing ], [0, 0, 1 ], 180 ], 
  [ [ PoDualVNH5019_PCBPowerLinesOffsetX, 0, PoDualVNH5019_PCBPowerLinesOffsetY - 1 * PoDualVNH5019_PCBPowerSpacing  ], [0, 0, 1 ], 0 ], 
  [ [ PoDualVNH5019_PCBPowerLinesOffsetX, PoDualVNH5019_PCBDepth, PoDualVNH5019_PCBPowerLinesOffsetY  - 1 * PoDualVNH5019_PCBPowerSpacing ], [0, 0, 1 ], 180 ], 
  [ [ PoDualVNH5019_PCBPowerLinesOffsetX, 0, PoDualVNH5019_PCBPowerLinesOffsetY - 2 * PoDualVNH5019_PCBPowerSpacing  ], [0, 0, 1 ], 0 ], 
  [ [ PoDualVNH5019_PCBPowerLinesOffsetX, PoDualVNH5019_PCBDepth, PoDualVNH5019_PCBPowerLinesOffsetY  - 2 * PoDualVNH5019_PCBPowerSpacing ], [0, 0, 1 ], 180 ], 
  [ [ PoDualVNH5019_PCBPowerLinesOffsetX, 0, PoDualVNH5019_PCBPowerLinesOffsetY - 3 * PoDualVNH5019_PCBPowerSpacing  ], [0, 0, 1 ], 0 ], 
  [ [ PoDualVNH5019_PCBPowerLinesOffsetX, PoDualVNH5019_PCBDepth, PoDualVNH5019_PCBPowerLinesOffsetY  - 3 * PoDualVNH5019_PCBPowerSpacing ], [0, 0, 1 ], 180 ], 
  [ [ PoDualVNH5019_PCBPowerLinesOffsetX, 0, PoDualVNH5019_PCBPowerLinesOffsetY - 4 * PoDualVNH5019_PCBPowerSpacing  ], [0, 0, 1 ], 0 ], 
  [ [ PoDualVNH5019_PCBPowerLinesOffsetX, PoDualVNH5019_PCBDepth, PoDualVNH5019_PCBPowerLinesOffsetY  - 4 * PoDualVNH5019_PCBPowerSpacing ], [0, 0, 1 ], 180 ], 
  [ [ PoDualVNH5019_PCBPowerLinesOffsetX, 0, PoDualVNH5019_PCBPowerLinesOffsetY - 5 * PoDualVNH5019_PCBPowerSpacing  ], [0, 0, 1 ], 0 ], 
  [ [ PoDualVNH5019_PCBPowerLinesOffsetX, PoDualVNH5019_PCBDepth, PoDualVNH5019_PCBPowerLinesOffsetY  - 5 * PoDualVNH5019_PCBPowerSpacing ], [0, 0, 1 ], 180 ], 

  // PowerAuxSignals
  [ [ PoDualVNH5019_PCBPowerAuxSignalsOffsetX, 0, PoDualVNH5019_PCBPowerAuxSignalsOffsetY ], [0, 0, 1 ], 0 ], 
  [ [ PoDualVNH5019_PCBPowerAuxSignalsOffsetX, 0, PoDualVNH5019_PCBPowerAuxSignalsOffsetY - ( PoDualVNH5019_PCBPowerAuxSignals - 1 ) * PoDualVNH5019_PCBPowerAuxSpacing  ], [0, 0, 1 ], 0 ], 
  [ [ PoDualVNH5019_PCBPowerAuxSignalsOffsetX, PoDualVNH5019_PCBDepth, PoDualVNH5019_PCBPowerAuxSignalsOffsetY ], [0, 0, 1 ], 180 ], 
  [ [ PoDualVNH5019_PCBPowerAuxSignalsOffsetX, PoDualVNH5019_PCBDepth, PoDualVNH5019_PCBPowerAuxSignalsOffsetY  - ( PoDualVNH5019_PCBPowerAuxSignals - 1 ) * PoDualVNH5019_PCBPowerAuxSpacing ], [0, 0, 1 ], 180 ], 

];

module poDualVNH5019( p = 0, info = false ) {
  moPresent( positions, p, info ) {
    moPitch() moPose( t = [ 0, 0, -PoDualVNH5019_PCBDepth ] ) {
         union() {
          color( PoDualVNH5019_PCBColor ) {
            linear_extrude( height = PoDualVNH5019_PCBDepth, twist = 0 ) {
              difference() {
                // PCB
                square( [ PoDualVNH5019_Width, PoDualVNH5019_Height ], center = true );
                // HoleA
                translate( [ PoDualVNH5019_HoleAOffsetX, PoDualVNH5019_HoleAOffsetY ] ) {
                  circle( d = PoDualVNH5019_HoleDiameter, center = true );
                }
                // HoleB
                translate( [ PoDualVNH5019_HoleBOffsetX, PoDualVNH5019_HoleBOffsetY ] ) {
                  circle( d = PoDualVNH5019_HoleDiameter, center = true );
                }
                // Signals
                translate( [ PoDualVNH5019_PCBEdgeSignalsOffsetX, PoDualVNH5019_PCBEdgeSignalsOffsetY ] ) {
                  for ( i = [ 0 : PoDualVNH5019_PCBEdgeSignals-1 ] ) {
                    translate( [ 0, i * PoDualVNH5019_PCBSignalSpacing ] )
                      circle( r = PoDualVNH5019_PCBSignalHoleRadius, center = true );        
                  }
                }
                // Power Lines
                translate( [ PoDualVNH5019_PCBPowerLinesOffsetX, PoDualVNH5019_PCBPowerLinesOffsetY ] ) {
                  for ( i = [ 0 : PoDualVNH5019_PCBPowerLines-1 ] ) {
                    translate( [ 0, -i * PoDualVNH5019_PCBPowerSpacing ] )
                      circle( r = PoDualVNH5019_PCBPowerHoleRadius, center = true );        
                  }
                }
                // Power Aux Signals
                translate( [ PoDualVNH5019_PCBPowerAuxSignalsOffsetX, PoDualVNH5019_PCBPowerAuxSignalsOffsetY ] ) {
                  for ( i = [ 0 : PoDualVNH5019_PCBPowerAuxSignals-1 ] ) {
                    translate( [ 0, -i * PoDualVNH5019_PCBPowerAuxSpacing ] )
                      circle( r = PoDualVNH5019_PCBPowerAuxRadius, center = true );        
                  }
                }
              }
            }                     
          }
          // Chips
          translate( [ PoDualVNH5019_ChipAOffsetX, PoDualVNH5019_ChipAOffsetY, PoDualVNH5019_PCBDepth + PoDualVNH5019_ChipDepth / 2 ] ) {
            color( [ 0, 0, 0 ] ) {
              cube( [ PoDualVNH5019_ChipWidth, PoDualVNH5019_ChipHeight, PoDualVNH5019_ChipDepth ], center = true );                
            }
          }
          translate( [ PoDualVNH5019_ChipBOffsetX, PoDualVNH5019_ChipBOffsetY, PoDualVNH5019_PCBDepth + PoDualVNH5019_ChipDepth / 2 ] ) {
            color( [ 0, 0, 0 ] ) {
              cube( [ PoDualVNH5019_ChipWidth, PoDualVNH5019_ChipHeight, PoDualVNH5019_ChipDepth ], center = true );                
            }
          }
          // Caps
          translate( [ PoDualVNH5019_CapAOffsetX, PoDualVNH5019_CapAOffsetY, PoDualVNH5019_PCBDepth + PoDualVNH5019_CapDepth / 2 ] ) {
            color( Aluminum ) {
              cylinder( r = PoDualVNH5019_CapRadius, h = PoDualVNH5019_CapDepth, center = true );                
            }
          }
          // Caps
          translate( [ PoDualVNH5019_CapBOffsetX, PoDualVNH5019_CapBOffsetY, PoDualVNH5019_PCBDepth + PoDualVNH5019_CapDepth / 2 ] ) {
            color( Aluminum ) {
              cylinder( r = PoDualVNH5019_CapRadius, h = PoDualVNH5019_CapDepth, center = true );                
            }
          }
          // Caps
          translate( [ PoDualVNH5019_CapCOffsetX, PoDualVNH5019_CapCOffsetY, PoDualVNH5019_PCBDepth + PoDualVNH5019_CapDepth / 2 ] ) {
            color( Aluminum ) {
              cylinder( r = PoDualVNH5019_CapRadius, h = PoDualVNH5019_CapDepth, center = true );                
            }
          }

      }
    }
  }
}


function poDualVNH5019Position( p = 0 ) = positions[ p ];

moMoveOriginTo( poDualVNH5019Position( 3 ) ) {
  poDualVNH5019( 0, info = true, $name = true );
}

