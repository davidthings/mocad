include <../mo/mo.scad>

AdaLCD2_8CapTouch_Width = 2.46 * in;
AdaLCD2_8CapTouch_SaddleWidth = 2 * in;
AdaLCD2_8CapTouch_Height = 3.2 * in;
AdaLCD2_8CapTouch_HoleHeight = 3 * in;
AdaLCD2_8CapTouch_HoleWidth = 2.25 * in;
AdaLCD2_8CapTouch_HolePadDiameter = 0.2 * in;
AdaLCD2_8CapTouch_HoleRadiusDiameter = 0.06 * in;
AdaLCD2_8CapTouch_PCBDepth = 0.06 * in;
AdaLCD2_8CapTouch_PCBColor = [ 0.2, 0.5, 1 ];
AdaLCD2_8CapTouch_PCBSignals = 20;
AdaLCD2_8CapTouch_PCBSignalSpacing = 0.1 * in;
AdaLCD2_8CapTouch_PCBSignalHoleRadius = 0.015 * in;
AdaLCD2_8CapTouch_LCDHeight = 2.74 * in;
AdaLCD2_8CapTouch_LCDWidth = 2 * in;
AdaLCD2_8CapTouch_LCDDepth = 0.13 * in;

AdaLCD2_8CapTouch_LCDGlassHeight = 2.74 * in;
AdaLCD2_8CapTouch_LCDGlassWidth = 2 * in;
AdaLCD2_8CapTouch_LCDGlassDepth = 0.06 * in;

AdaLCD2_8CapTouch_LCDVisibleHeight = 2.34 * in;
AdaLCD2_8CapTouch_LCDVisibleWidth = 1.78 * in;
AdaLCD2_8CapTouch_LCDVisibleDepth = 0.01 * in;

AdaLCD2_8CapTouch_LCDVisibleOffsetWidthwise = 0.12 * in - ( AdaLCD2_8CapTouch_LCDGlassWidth - AdaLCD2_8CapTouch_LCDVisibleWidth ) / 2;
AdaLCD2_8CapTouch_LCDVisibleOffsetHeightwise = 0.34 * in - ( AdaLCD2_8CapTouch_LCDGlassHeight - AdaLCD2_8CapTouch_LCDVisibleHeight ) / 2;

AdaLCD2_8CapTouch_Depth = AdaLCD2_8CapTouch_LCDDepth + AdaLCD2_8CapTouch_LCDGlassDepth + AdaLCD2_8CapTouch_PCBDepth;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, AdaLCD2_8CapTouch_Depth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ AdaLCD2_8CapTouch_LCDHeight / 2, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, -AdaLCD2_8CapTouch_LCDWidth / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ -AdaLCD2_8CapTouch_LCDHeight / 2, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, AdaLCD2_8CapTouch_LCDWidth / 2 ], [ 0, 0, 1 ], 0 ],

  [ [ AdaLCD2_8CapTouch_Height / 2, AdaLCD2_8CapTouch_Depth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ -AdaLCD2_8CapTouch_Height / 2, AdaLCD2_8CapTouch_Depth, 0 ], [ 0, 0, 1 ], 180 ],


  [ [ AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_Depth - AdaLCD2_8CapTouch_PCBDepth,  0 ], [ 0, 0, 1 ], 0 ],
  [ [ -AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_Depth - AdaLCD2_8CapTouch_PCBDepth,  0 ], [ 0, 0, 1 ], 0 ],
  [ [ AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_Depth,  0 ], [ 0, 0, 1 ], 180 ],
  [ [ -AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_Depth,  0 ], [ 0, 0, 1 ], 180 ],


  [ [ AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_Depth - AdaLCD2_8CapTouch_PCBDepth,  AdaLCD2_8CapTouch_HoleWidth / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ -AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_Depth - AdaLCD2_8CapTouch_PCBDepth,  AdaLCD2_8CapTouch_HoleWidth / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ -AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_Depth - AdaLCD2_8CapTouch_PCBDepth,  -AdaLCD2_8CapTouch_HoleWidth / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_Depth - AdaLCD2_8CapTouch_PCBDepth,  -AdaLCD2_8CapTouch_HoleWidth / 2 ], [ 0, 0, 1 ], 0 ],
  [ [ AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_Depth,  AdaLCD2_8CapTouch_HoleWidth / 2 ], [ 0, 0, 1 ], 180 ],
  [ [ -AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_Depth,  AdaLCD2_8CapTouch_HoleWidth / 2 ], [ 0, 0, 1 ], 180 ],
  [ [ -AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_Depth,  -AdaLCD2_8CapTouch_HoleWidth / 2 ], [ 0, 0, 1 ], 180 ],
  [ [ AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_Depth,  -AdaLCD2_8CapTouch_HoleWidth / 2 ], [ 0, 0, 1 ], 180 ],

  //[ [ -AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_Depth,  -9.5 * AdaLCD2_8CapTouch_PCBSignalSpacing ], [ 0, 0, 1 ], 180 ],
  //[ [ AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_Depth,   -9.5 * AdaLCD2_8CapTouch_PCBSignalSpacing ], [ 0, 0, 1 ], 180 ],

];

module adaLCD2_8CapTouch( p = 0, info = false ) {
  moPresent( positions, p, info ) {
    moPitch( 1 ) moPose( t = [ 0, 0, -AdaLCD2_8CapTouch_Depth ] ) {
    // Main PCB
      color( AdaLCD2_8CapTouch_PCBColor ) {
        linear_extrude( height = AdaLCD2_8CapTouch_PCBDepth, twist = 0 ) {
          difference() {
            union() {
              square( [ AdaLCD2_8CapTouch_Height, AdaLCD2_8CapTouch_SaddleWidth ], center = true );

              translate( [ AdaLCD2_8CapTouch_HoleHeight / 2, 0 ] )
                square( [ AdaLCD2_8CapTouch_HolePadDiameter, AdaLCD2_8CapTouch_HoleWidth ], center = true );
              translate( [ -AdaLCD2_8CapTouch_HoleHeight / 2, 0 ] )
                square( [ AdaLCD2_8CapTouch_HolePadDiameter, AdaLCD2_8CapTouch_HoleWidth ], center = true );

              translate( [ AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_HoleWidth / 2, 0 ] )
                circle( d = AdaLCD2_8CapTouch_HolePadDiameter, center = true );
              translate( [ -AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_HoleWidth / 2, 0 ] )
                circle( d = AdaLCD2_8CapTouch_HolePadDiameter, center = true );
              translate( [ -AdaLCD2_8CapTouch_HoleHeight / 2, -AdaLCD2_8CapTouch_HoleWidth / 2, 0 ] )
                circle( d = AdaLCD2_8CapTouch_HolePadDiameter, center = true );
              translate( [ AdaLCD2_8CapTouch_HoleHeight / 2, -AdaLCD2_8CapTouch_HoleWidth / 2, 0 ] )
                circle( d = AdaLCD2_8CapTouch_HolePadDiameter, center = true );
            };

            // Big holes
            translate( [ AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_HoleWidth / 2, 0 ] )
              circle( r = AdaLCD2_8CapTouch_HoleRadiusDiameter, center = true );
            translate( [ -AdaLCD2_8CapTouch_HoleHeight / 2, AdaLCD2_8CapTouch_HoleWidth / 2, 0 ] )
              circle( r = AdaLCD2_8CapTouch_HoleRadiusDiameter, center = true );
            translate( [ -AdaLCD2_8CapTouch_HoleHeight / 2, -AdaLCD2_8CapTouch_HoleWidth / 2, 0 ] )
              circle( r = AdaLCD2_8CapTouch_HoleRadiusDiameter, center = true );
            translate( [ AdaLCD2_8CapTouch_HoleHeight / 2, -AdaLCD2_8CapTouch_HoleWidth / 2, 0 ] )
              circle( r = AdaLCD2_8CapTouch_HoleRadiusDiameter, center = true );

            translate( [ AdaLCD2_8CapTouch_HoleHeight / 2, 0, 0 ] ) {
              for ( i = [ -AdaLCD2_8CapTouch_PCBSignals/2: AdaLCD2_8CapTouch_PCBSignals/2-1 ] ) {
                translate( [ 0, i * AdaLCD2_8CapTouch_PCBSignalSpacing + AdaLCD2_8CapTouch_PCBSignalSpacing / 2, 0 ] )
                  circle( r = AdaLCD2_8CapTouch_PCBSignalHoleRadius, center = true );
              }
            }
            translate( [ -AdaLCD2_8CapTouch_HoleHeight / 2, 0, 0 ] ) {
              for ( i = [ -AdaLCD2_8CapTouch_PCBSignals/2 : AdaLCD2_8CapTouch_PCBSignals/2 - 1 ] ) {
                translate( [ 0, i * AdaLCD2_8CapTouch_PCBSignalSpacing + AdaLCD2_8CapTouch_PCBSignalSpacing / 2, 0 ] )
                  circle( r = AdaLCD2_8CapTouch_PCBSignalHoleRadius, center = true );
              }
            }
          }
        }
      }

      // LCD Housing
      translate( [ 0, 0, ( AdaLCD2_8CapTouch_PCBDepth )  ] ) {
        color(Aluminum)
          linear_extrude( height = AdaLCD2_8CapTouch_LCDDepth, twist = 0 ) {
            square( [ AdaLCD2_8CapTouch_LCDHeight, AdaLCD2_8CapTouch_LCDWidth ], center = true );
          }
      }
      // LCD Glass
      translate( [ 0, 0, ( AdaLCD2_8CapTouch_LCDDepth + AdaLCD2_8CapTouch_PCBDepth)  ] ) {
        color([0.0, 0, 0])
          linear_extrude( height = AdaLCD2_8CapTouch_LCDGlassDepth, twist = 0 ) {
            square( [ AdaLCD2_8CapTouch_LCDGlassHeight, AdaLCD2_8CapTouch_LCDGlassWidth ], center = true );
          }
      }
      // LCD Visible
      translate( [ AdaLCD2_8CapTouch_LCDVisibleOffsetHeightwise, AdaLCD2_8CapTouch_LCDVisibleOffsetWidthwise,
                 ( AdaLCD2_8CapTouch_LCDDepth +  AdaLCD2_8CapTouch_LCDGlassDepth + AdaLCD2_8CapTouch_PCBDepth )  ] ) {
        color( [0.2, 0.2, 0.2 ])
          linear_extrude( height = AdaLCD2_8CapTouch_LCDVisibleDepth, twist = 0 ) {
            square( [ AdaLCD2_8CapTouch_LCDVisibleHeight, AdaLCD2_8CapTouch_LCDVisibleWidth ], center = true );
          }
      }
    }
  }
}


function adaLCD2_8CapTouchPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( adaLCD2_8CapTouchPosition( 1 ) ) {
  adaLCD2_8CapTouch( 0, info = true, $name = true );
}
