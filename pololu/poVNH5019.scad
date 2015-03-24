include <../mo/mo.scad>

PoVNH5019_ComponentHeight = 0.03 * in;
PoVNH5019_PCBDepth = 0.06 * in;
PoVNH5019_Height = 1.1 * in;
PoVNH5019_Width = 1.5 * in;
PoVNH5019_Depth = PoVNH5019_ComponentHeight + PoVNH5019_PCBDepth;

PoVNH5019_PCBColor = [ 0, 0.4, 0 ];

// None of these are specified on the site.  
PoVNH5019_HoleDiameter = 0.086 * in;
PoVNH5019_HoleWidth = 0.55 * in;
PoVNH5019_HoleHeight = 0.55 * in;

// Rough
PoVNH5019_HoleAOffsetX = -PoVNH5019_Width/2 + 0.2 * in;
PoVNH5019_HoleAOffsetY = PoVNH5019_Height/2 - 0.09 * in;
PoVNH5019_HoleBOffsetX = PoVNH5019_HoleAOffsetX + 1.2 * in;
PoVNH5019_HoleBOffsetY = PoVNH5019_HoleAOffsetY - 0.9 * in;

PoVNH5019_ChipHeight = 0.68 * in;
PoVNH5019_ChipWidth = 0.625 * in;
PoVNH5019_ChipDepth = 0.08 * in;
PoVNH5019_ChipAOffsetX = -PoVNH5019_Width/2 + PoVNH5019_ChipWidth/2 + 0.40 * in;
PoVNH5019_ChipAOffsetY = PoVNH5019_Height/2 - PoVNH5019_ChipHeight/2 - 0.04 * in;

PoVNH5019_CapRadius = 0.256 / 2 * in;
PoVNH5019_CapDepth = 0.24 * in;
PoVNH5019_CapAOffsetX = -PoVNH5019_Width/2 + 0.53 * in;
PoVNH5019_CapAOffsetY = -PoVNH5019_Height/2 + 0.19 * in;

PoVNH5019_PCBSignalSpacing = 0.1 * in;
PoVNH5019_PCBSignalHoleRadius = 0.015 * in;

PoVNH5019_PCBEdgeSignals = 10;
PoVNH5019_PCBEdgeSignalsOffsetX = PoVNH5019_HoleAOffsetX - 0.142 * in;
PoVNH5019_PCBEdgeSignalsOffsetY = PoVNH5019_HoleAOffsetY;

PoVNH5019_PCBPowerSpacing = 0.2 * in;
PoVNH5019_PCBPowerHoleRadius = 0.085 / 2 * in;
PoVNH5019_PCBPowerLines = 4;
PoVNH5019_PCBPowerLinesOffsetX = PoVNH5019_HoleBOffsetX - 0.05 * in;
PoVNH5019_PCBPowerLinesOffsetY =  PoVNH5019_HoleAOffsetY - 0.05 * in;

PoVNH5019_PCBPowerAuxSignals = PoVNH5019_PCBPowerLines * 2;
PoVNH5019_PCBPowerAuxSpacing = PoVNH5019_PCBPowerSpacing / 2;
PoVNH5019_PCBPowerAuxRadius = PoVNH5019_PCBSignalHoleRadius;
PoVNH5019_PCBPowerAuxSignalsOffsetX = PoVNH5019_PCBPowerLinesOffsetX + 0.07 * in;
PoVNH5019_PCBPowerAuxSignalsOffsetY = PoVNH5019_PCBPowerLinesOffsetY + 0.05 * in;

// Add Adruino Sheild Footprint sometime

positions = [ 
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, PoVNH5019_PCBDepth, 0 ], [ 0, 0, 1 ], 180 ],

  // Mounting Holes
  [ [ PoVNH5019_HoleAOffsetX, 0, PoVNH5019_HoleAOffsetY ], [0, 0, 1 ], 0 ], 
  [ [ PoVNH5019_HoleBOffsetX, 0, PoVNH5019_HoleBOffsetY ], [0, 0, 1 ], 0 ], 
  [ [ PoVNH5019_HoleAOffsetX, PoVNH5019_PCBDepth, PoVNH5019_HoleAOffsetY ], [0, 0, 1 ], 180 ], 
  [ [ PoVNH5019_HoleBOffsetX, PoVNH5019_PCBDepth, PoVNH5019_HoleBOffsetY ], [0, 0, 1 ], 180 ], 

  // EdgeSignals
  [ [ PoVNH5019_PCBEdgeSignalsOffsetX, 0, PoVNH5019_PCBEdgeSignalsOffsetY - ( PoVNH5019_PCBEdgeSignals - 1 ) * PoVNH5019_PCBSignalSpacing  ], [0, 0, 1 ], 0 ], 
  [ [ PoVNH5019_PCBEdgeSignalsOffsetX, 0, PoVNH5019_PCBEdgeSignalsOffsetY ], [0, 0, 1 ], 0 ], 
  [ [ PoVNH5019_PCBEdgeSignalsOffsetX, PoVNH5019_PCBDepth, PoVNH5019_PCBEdgeSignalsOffsetY  - ( PoVNH5019_PCBEdgeSignals - 1 )* PoVNH5019_PCBSignalSpacing ], [0, 0, 1 ], 180 ], 
  [ [ PoVNH5019_PCBEdgeSignalsOffsetX, PoVNH5019_PCBDepth, PoVNH5019_PCBEdgeSignalsOffsetY ], [0, 0, 1 ], 180 ], 

  // PowerLines
  [ [ PoVNH5019_PCBPowerLinesOffsetX, 0, PoVNH5019_PCBPowerLinesOffsetY + 0 * PoVNH5019_PCBPowerSpacing  ], [0, 0, 1 ], 0 ], 
  [ [ PoVNH5019_PCBPowerLinesOffsetX, PoVNH5019_PCBDepth, PoVNH5019_PCBPowerLinesOffsetY  - 0 * PoVNH5019_PCBPowerSpacing ], [0, 0, 1 ], 180 ], 
  [ [ PoVNH5019_PCBPowerLinesOffsetX, 0, PoVNH5019_PCBPowerLinesOffsetY - 1 * PoVNH5019_PCBPowerSpacing  ], [0, 0, 1 ], 0 ], 
  [ [ PoVNH5019_PCBPowerLinesOffsetX, PoVNH5019_PCBDepth, PoVNH5019_PCBPowerLinesOffsetY  - 1 * PoVNH5019_PCBPowerSpacing ], [0, 0, 1 ], 180 ], 
  [ [ PoVNH5019_PCBPowerLinesOffsetX, 0, PoVNH5019_PCBPowerLinesOffsetY - 2 * PoVNH5019_PCBPowerSpacing  ], [0, 0, 1 ], 0 ], 
  [ [ PoVNH5019_PCBPowerLinesOffsetX, PoVNH5019_PCBDepth, PoVNH5019_PCBPowerLinesOffsetY  - 2 * PoVNH5019_PCBPowerSpacing ], [0, 0, 1 ], 180 ], 
  [ [ PoVNH5019_PCBPowerLinesOffsetX, 0, PoVNH5019_PCBPowerLinesOffsetY - 3 * PoVNH5019_PCBPowerSpacing  ], [0, 0, 1 ], 0 ], 
  [ [ PoVNH5019_PCBPowerLinesOffsetX, PoVNH5019_PCBDepth, PoVNH5019_PCBPowerLinesOffsetY  - 3 * PoVNH5019_PCBPowerSpacing ], [0, 0, 1 ], 180 ], 

  // PowerAuxSignals
  [ [ PoVNH5019_PCBPowerAuxSignalsOffsetX, 0, PoVNH5019_PCBPowerAuxSignalsOffsetY ], [0, 0, 1 ], 0 ], 
  [ [ PoVNH5019_PCBPowerAuxSignalsOffsetX, 0, PoVNH5019_PCBPowerAuxSignalsOffsetY - ( PoVNH5019_PCBPowerAuxSignals - 1 ) * PoVNH5019_PCBPowerAuxSpacing  ], [0, 0, 1 ], 0 ], 
  [ [ PoVNH5019_PCBPowerAuxSignalsOffsetX, PoVNH5019_PCBDepth, PoVNH5019_PCBPowerAuxSignalsOffsetY ], [0, 0, 1 ], 180 ], 
  [ [ PoVNH5019_PCBPowerAuxSignalsOffsetX, PoVNH5019_PCBDepth, PoVNH5019_PCBPowerAuxSignalsOffsetY  - ( PoVNH5019_PCBPowerAuxSignals - 1 ) * PoVNH5019_PCBPowerAuxSpacing ], [0, 0, 1 ], 180 ], 

];

module poVNH5019( p = 0, info = false ) {
  moPresent( positions, p, info ) {
    moPitch() moPose( t = [ 0, 0, -PoVNH5019_PCBDepth ] ) {
         union() {
          color( PoVNH5019_PCBColor ) {
            linear_extrude( height = PoVNH5019_PCBDepth, twist = 0 ) {
              difference() {
                // PCB
                square( [ PoVNH5019_Width, PoVNH5019_Height ], center = true );
                // HoleA
                translate( [ PoVNH5019_HoleAOffsetX, PoVNH5019_HoleAOffsetY ] ) {
                  circle( d = PoVNH5019_HoleDiameter, center = true );
                }
                // HoleB
                translate( [ PoVNH5019_HoleBOffsetX, PoVNH5019_HoleBOffsetY ] ) {
                  circle( d = PoVNH5019_HoleDiameter, center = true );
                }
                // Signals
                translate( [ PoVNH5019_PCBEdgeSignalsOffsetX, PoVNH5019_PCBEdgeSignalsOffsetY ] ) {
                  for ( i = [ 0 : PoVNH5019_PCBEdgeSignals-1 ] ) {
                    translate( [ 0, -i * PoVNH5019_PCBSignalSpacing ] )
                      circle( r = PoVNH5019_PCBSignalHoleRadius, center = true );        
                  }
                }
                // Power Lines
                translate( [ PoVNH5019_PCBPowerLinesOffsetX, PoVNH5019_PCBPowerLinesOffsetY ] ) {
                  for ( i = [ 0 : PoVNH5019_PCBPowerLines-1 ] ) {
                    translate( [ 0, -i * PoVNH5019_PCBPowerSpacing ] )
                      circle( r = PoVNH5019_PCBPowerHoleRadius, center = true );        
                  }
                }
                // Power Aux Signals
                translate( [ PoVNH5019_PCBPowerAuxSignalsOffsetX, PoVNH5019_PCBPowerAuxSignalsOffsetY ] ) {
                  for ( i = [ 0 : PoVNH5019_PCBPowerAuxSignals-1 ] ) {
                    translate( [ 0, -i * PoVNH5019_PCBPowerAuxSpacing ] )
                      circle( r = PoVNH5019_PCBPowerAuxRadius, center = true );        
                  }
                }
              }
            }                     
          }
          // Chip
          translate( [ PoVNH5019_ChipAOffsetX, PoVNH5019_ChipAOffsetY, PoVNH5019_PCBDepth + PoVNH5019_ChipDepth / 2 ] ) {
            color( [ 0, 0, 0 ] ) {
              cube( [ PoVNH5019_ChipWidth, PoVNH5019_ChipHeight, PoVNH5019_ChipDepth ], center = true );                
            }
          }
          // Cap
          translate( [ PoVNH5019_CapAOffsetX, PoVNH5019_CapAOffsetY, PoVNH5019_PCBDepth + PoVNH5019_CapDepth / 2 ] ) {
            color( Aluminum ) {
              cylinder( r = PoVNH5019_CapRadius, h = PoVNH5019_CapDepth, center = true );                
            }
          }

      }
    }
  }
}


function poVNH5019Position( p = 0 ) = positions[ p ];

moMoveOriginTo( poVNH5019Position( 3 ) ) {
  poVNH5019( 0, info = true, $name = true );
}

