include <../mo/mo.scad>

SparkWombat_PCBDepth = 0.06 * in;
SparkWombat_Height = 3.94 * in;
SparkWombat_Width = 3.15 * in;

// None of these are specified on the site.  
SparkWombat_HoleDiameter = 0.15 * in;
SparkWombat_HoleWidth = 2.9 * in;
SparkWombat_HoleHeight = 3.7 * in;

SparkWombat_PCBColor = [ 1, 0.2, 0.2 ];

SparkWombat_PCBSignalsV = 34;
SparkWombat_PCBSignalsH = 26;
SparkWombat_PCBSignalSpacing = 0.1 * in;
SparkWombat_PCBSignalHoleRadius = 0.015 * in;

positions = [ 
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, SparkWombat_PCBDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -SparkWombat_HoleWidth/2, 0, -SparkWombat_HoleHeight/2 ], [0, 0, 1 ], 0 ], 
  [ [ -SparkWombat_HoleWidth/2, 0, SparkWombat_HoleHeight/2 ], [0, 0, 1 ], 0 ], 
  [ [ SparkWombat_HoleWidth/2, 0, SparkWombat_HoleHeight/2 ], [0, 0, 1 ], 0 ], 
  [ [ SparkWombat_HoleWidth/2, 0, -SparkWombat_HoleHeight/2 ], [0, 0, 1 ], 0 ], 

  [ [ -SparkWombat_HoleWidth/2, SparkWombat_PCBDepth, -SparkWombat_HoleHeight/2 ], [0, 0, 1 ], 180 ], 
  [ [ -SparkWombat_HoleWidth/2, SparkWombat_PCBDepth, SparkWombat_HoleHeight/2 ], [0, 0, 1 ], 180 ], 
  [ [ SparkWombat_HoleWidth/2, SparkWombat_PCBDepth, SparkWombat_HoleHeight/2 ], [0, 0, 1 ], 180 ], 
  [ [ SparkWombat_HoleWidth/2, SparkWombat_PCBDepth, -SparkWombat_HoleHeight/2 ], [0, 0, 1 ], 180 ], 

  [ [ -SparkWombat_Width/2, SparkWombat_PCBDepth / 2, 0 ], [0, 0, 1 ], -90 ], 
  [ [ SparkWombat_Width/2, SparkWombat_PCBDepth / 2, 0 ], [0, 0, 1 ], 90 ], 
  [ [ 0, SparkWombat_PCBDepth / 2, SparkWombat_Height/2 ], [1, 0, 0 ], -90 ], 
  [ [ 0, SparkWombat_PCBDepth / 2, -SparkWombat_Height/2 ], [1, 0, 0 ], 90 ], 

];

module sparkWombat( p = 0, info = false ) {
  moPresent( positions, p, info ) {
    moPitch() moPose( t = [ 0, 0, -SparkWombat_PCBDepth ] ) {
         union() {
          color( SparkWombat_PCBColor ) {
            linear_extrude( height = SparkWombat_PCBDepth, twist = 0 ) {
              difference() {
                square( [ SparkWombat_Width, SparkWombat_Height ], center = true );
                
                if ( $internalDetail ) {
                  translate( [ SparkWombat_HoleWidth/2, SparkWombat_HoleHeight/2 ] ) {
                    circle( d = SparkWombat_HoleDiameter, center = true );
                  }
                  translate( [ -SparkWombat_HoleWidth/2, SparkWombat_HoleHeight/2 ] ) {
                    circle( d = SparkWombat_HoleDiameter, center = true );
                  }
                  translate( [ -SparkWombat_HoleWidth/2, -SparkWombat_HoleHeight/2 ] ) {
                    circle( d = SparkWombat_HoleDiameter, center = true );
                  }
                  translate( [ SparkWombat_HoleWidth/2, -SparkWombat_HoleHeight/2 ] ) {
                    circle( d = SparkWombat_HoleDiameter, center = true );
                  }               
                  translate( [ -SparkWombat_HoleWidth / 2, 0, 0 ] ) {
                    for ( i = [ -SparkWombat_PCBSignalsV/2: SparkWombat_PCBSignalsV/2-1 ] ) {
                      translate( [ 0, i * SparkWombat_PCBSignalSpacing + SparkWombat_PCBSignalSpacing / 2, 0 ] )
                        circle( r = SparkWombat_PCBSignalHoleRadius, center = true );        
                    }
                  }
                  translate( [ -SparkWombat_HoleWidth / 2 + SparkWombat_PCBSignalSpacing, 0, 0 ] ) {
                    for ( i = [ -SparkWombat_PCBSignalsV/2: SparkWombat_PCBSignalsV/2-1 ] ) {
                      translate( [ 0, i * SparkWombat_PCBSignalSpacing + SparkWombat_PCBSignalSpacing / 2, 0 ] )
                        circle( r = SparkWombat_PCBSignalHoleRadius, center = true );        
                    }
                  }
                  translate( [ SparkWombat_HoleWidth / 2, 0, 0 ] ) {
                    for ( i = [ -SparkWombat_PCBSignalsV/2: SparkWombat_PCBSignalsV/2-1 ] ) {
                      translate( [ 0, i * SparkWombat_PCBSignalSpacing + SparkWombat_PCBSignalSpacing / 2, 0 ] )
                        circle( r = SparkWombat_PCBSignalHoleRadius, center = true );        
                    }
                  }
                  translate( [ SparkWombat_HoleWidth / 2 - SparkWombat_PCBSignalSpacing , 0, 0 ] ) {
                    for ( i = [ -SparkWombat_PCBSignalsV/2: SparkWombat_PCBSignalsV/2-1 ] ) {
                      translate( [ 0, i * SparkWombat_PCBSignalSpacing + SparkWombat_PCBSignalSpacing / 2, 0 ] )
                        circle( r = SparkWombat_PCBSignalHoleRadius, center = true );        
                    }
                  }
                  translate( [ 0, SparkWombat_HoleHeight / 2, 0 ] ) {
                    for ( i = [ -SparkWombat_PCBSignalsH/2: SparkWombat_PCBSignalsH/2-1 ] ) {
                      translate( [ i * SparkWombat_PCBSignalSpacing + SparkWombat_PCBSignalSpacing / 2, 0, 0  ] )
                        circle( r = SparkWombat_PCBSignalHoleRadius, center = true );        
                    }
                  }
                  translate( [ 0, SparkWombat_HoleHeight / 2 - SparkWombat_PCBSignalSpacing, 0 ] ) {
                    for ( i = [ -SparkWombat_PCBSignalsH/2: SparkWombat_PCBSignalsH/2-1 ] ) {
                      translate( [ i * SparkWombat_PCBSignalSpacing + SparkWombat_PCBSignalSpacing / 2, 0, 0  ] )
                        circle( r = SparkWombat_PCBSignalHoleRadius, center = true );        
                    }
                  }
                  translate( [ 0, -SparkWombat_HoleHeight / 2, 0 ] ) {
                    for ( i = [ -SparkWombat_PCBSignalsH/2: SparkWombat_PCBSignalsH/2-1 ] ) {
                      translate( [ i * SparkWombat_PCBSignalSpacing + SparkWombat_PCBSignalSpacing / 2, 0, 0  ] )
                        circle( r = SparkWombat_PCBSignalHoleRadius, center = true );        
                    }
                  }
                  translate( [ 0, -SparkWombat_HoleHeight / 2 + SparkWombat_PCBSignalSpacing, 0 ] ) {
                    for ( i = [ -SparkWombat_PCBSignalsH/2: SparkWombat_PCBSignalsH/2-1 ] ) {
                      translate( [ i * SparkWombat_PCBSignalSpacing + SparkWombat_PCBSignalSpacing / 2, 0, 0  ] )
                        circle( r = SparkWombat_PCBSignalHoleRadius, center = true );        
                    }
                  }
                }
              }
            }                     
          }

      }
    }
  }
}


function sparkWombatPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( sparkWombatPosition( 2 ) ) {
  sparkWombat( 0, info = true, $name = true, $internalDetail = true );
}

