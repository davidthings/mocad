
include <../mo/mo.scad>

//
// Chapter 1 - Introduction To OpenSCAD
//
// Idea is to make things, then move them to where you want them
//
// Illustrating creating something and modifying it
//
//
// Chapter 2 - Modules
// 
// We can make our objects into modules so we can reuse them.
//
// Things can get mathy very quickly
//
// Especially when it comes to working out co-ordinates.  For example, 
// what the heck would the co-ordinate of the lower corner of the left 
// wall be?  I might be able to figure it out, but it would take a little 
// while, and I'd mess it up a few times.
//

use <../mocad/moLogo.scad>

moGridParts( [0,0,0],[-500,0,0],rotate = 0 ) {
  *translate( [ -1775, -2000, 2000 ] )
    rotate( [ -30, 0, 0 ] )
      scale( [ 20, 20, 20 ] ) {
        translate( [ -8, 0, 0 ] )
          moLogo();
        translate( [ -0, 0, -40] )
          rotate( [ 90, 0, 0  ] )
            color( [ 0.8, 0.8, 0.8 ] ) 
              text( "TUTORIAL", 7.5, f  = "Liberation Sans:style=Bold", halign="center" );
      }
  translate( [ 0, -1000, 600 ] )
    rotate( [ -20, 0, 90 ] )
      scale( [ 20, 20, 20 ] ) {
        translate( [ -8, 0, 0 ] )
          moLogo();
        translate( [ -0, 0, -20] )
          rotate( [ 90, 0, 0  ] )
            color( [ 0.8, 0.8, 0.8 ] ) 
              text( "TUTORIAL", 7.5, f  = "Liberation Sans:style=Bold", halign="center" );
      }

  Chapter1();
  Chapter2();
  Chapter3();
  Chapter4();
  Chapter5();
  Chapter6();
}

module Workspace( n = "" ) {
  translate( [ 0, 370, -50 ] )
    color( LightGray )
      cube( [ 375, 1050, 10 ], center = true ); 
  
  translate( [ 140, -30, -30 ] )
    rotate( [ -65, 0 , 90 ] )
    moLabel( len( n ) > 0 ? n : parent_module(2), tileColor = White );
}

module Step( d, n = "" ) {
  l = 150;
  translate( [ 0, ( d - 1 ) * l, 0 ] ) {
    children();
    translate( [ 80, 0, -40 ] )
      rotate( [ -85, 0 , 90 ] )
        moLabel( str( "Step ", d, " ", n ), lh = 0.5 * in, tileColor = White );
  }
}

$t = 0;

module Shape( ) {
  color( [ 0, 0, 0 ] )
    sphere( r = 4, center = true ); 
}


module Encircle() {
  r = 32;
  for ( i = [ 0 : 20 : 360 ] ) 
  translate( [ r * sin( i ), r * cos( i ), 0 ] )
    children( );
}

module Chapter1() {  
  Workspace();
  
  Step( 1 ) {
    cube( [ 16, 16, 16 ], center = true );  

    translate( [ 0, 64, 0 ] )
      color( [ 1, 0, 0 ] )
        sphere( r = 16, center = true );

    translate( [ 0, -64, 0 ] ) 
      rotate( [ 0, 90, 0 ] ) 
        color( [ 0, 0, 1.0 ] ) 
            cylinder( h = 16, r2 = 8, r1 = 16, center = true ); 
  }

  Step( 2 ) {  
    r = 32;
    for ( i = [ 0 : 20 : 360 ] ) 
      translate( [ r * sin( i ), r * cos( i ), 0 ] )
        Shape();
  }

  Step( 3 ) {     
    Encircle( ){
      Shape(); 
      translate( [ 0, 0, -10 ] )
      color( [ 1, 0.5, 0 ] )
        cube( [3,3,3], center=true );
    }
  }
  
  Step( 4 ) {
    moLogo();
        
  }
  
  Step( 5 ) {
    color( Red )
      import("../mocad/stl/MAKE_Robot_V6.stl");
  }
}


//
// Chapter 2 - Building in steps
//
// Each step seems reasonable, but it's easy to get lost with all the 
// changes in the frame of reference.
//
// The way that rotation and translation are handled separately also 
// creates extra tedious work
//
// By the time we're a few stages in, our end Ball is far from where 
// it started.  It would be quite tedious to calculate where it would be.
//


Red = [ 1, 0, 0 ];
Orange = [ 1, 0.5, 0 ];
Green = [ 0, 1, 0 ];
Blue = [ 0, 0, 1 ];
Charcoal = [ 0.2, 0.2, 0.2 ];

module Ball( d = 10, c = Red ) {
  color( c )
    sphere( d = d, center = true );
}

module Stick( l = 50, d = 5, c = Charcoal  ) {
  color( c )
    cylinder( h = l, d = d, center = true );
}

module Chapter2() {
  Workspace( );
  
  Step( 1 ) {
    Ball();
  }

  Step( 2 ) {
    Stick();
    translate( [ 0, 0, 25 ] ) 
      Ball();
  }

  Step( 3 ) {
    rotate( [ -45, 0, 0 ] ) {
      Ball( c = 0.75 * Red );
      translate( [ 0, 0, 25 ] ) {
        Stick();
        translate( [ 0, 0, 25 ] ) 
          Ball();
      }
    }
  }

  Step( 4 ) {
    Ball( c = 0 * Red );    
    translate( [ 25, 0, 0 ] ) {
      rotate( [ 0, 90, 0 ] )
        Stick();
      translate( [ 25, 0, 0 ] ) {
        rotate( [ 0, 0, -60 ] ) {
          Ball( c = 0.5 * Red );
          translate( [ 0, 0, 25 ] ) {
            Stick();
            translate( [ 0, 0, 25 ] ) {
              rotate( [ -45, 0, 0 ] ) {
                Ball( c = 0.75 * Red );
                translate( [ 0, 0, 25 ] ) {
                  Stick();
                  translate( [ 0, 0, 25 ] ) 
                    Ball();
                }
              }
            }
          }
        }
      }
    }
  }
  
}

//
// Chapter 3 - Building More Complex Objects - Top Down.  Also operating on children
//
// Building complex objects can be done bottom up or top down
//
// [ each step appears behind the previous ]
//

LightGray = [ 0.85, 0.85, 0.85 ];
Gray = [ 0.5, 0.5, 0.5 ];

module leg3_2( loc ) {
  legL = 40;
  legW = 4;
  legL_2 = legL / 2;
  translate( [ loc[ 0 ], loc[ 1 ], loc[ 2 ] - legL_2 ] )
    color( LightGray ) 
      cube( [ legW, legW, legL  ], center = true );
}

module leg3_3( loc ) {
  legL = 40;
  legW = 4;
  legL_2 = legL / 2;
  translate( loc ) {
    color( Gray ) 
      sphere( r=legW, center = true );
      translate( [ 0, 0, -legL_2/2 ] ) {
        color( LightGray ) 
          cube( [ legW, legW, legL/2  ], center = true );
        translate( [ 0, 0, -legL_2/2 ] ) {
          color( Gray ) 
            sphere( r=legW, center = true );
          translate( [ 0, 0, -legL_2/2 ] ) {
            color( LightGray ) 
              cube( [ legW, legW, legL/2  ], center = true );
            translate( [ 0, 0, -legL_2 / 2 ] )
              color( Gray ) 
                sphere( r=legW, center = true );
          }
        }
      }
    }
}

module body3_4( loc = [ 0, 0, 0 ] ) {
  bodyW = 20;
  bodyW_2 = bodyW / 2;
  bodyD = 6;
  bodyH = 20;
  translate( loc ) {
    color( Gray )
    cube( [ bodyW, bodyW, bodyH / 3], center = true );

    translate( [ 0, 0, bodyH / 3] ) {
    color ( LightGray )
    cylinder( h = bodyH / 3, d = bodyW_2, center = true );
    }

    translate( [ 0, 0, 2 * bodyH / 3 ] ) {
      color( Gray )
      cube( [ bodyW, bodyW, bodyH / 3 ], center = true );
    }
  }

}

module Chapter3() {
  Workspace();
  
  Step( 1 ) {
    bodyW = 20;
    bodyD = 6;
    legL = 40;
    legW = 4;

    bodyW_2 = bodyW / 2;
    legL_2 = legL / 2;
    
    color( Gray ) {
      cube( [ bodyW, bodyW, bodyD ], center = true );
      translate( [ bodyW_2, -bodyW_2, -legL_2  ] )
        cube( [ legW, legW, legL ], center = true );
      translate( [ -bodyW_2, -bodyW_2, -legL_2  ] )
        cube( [ legW, legW, legL ], center = true );
      translate( [ -bodyW_2, bodyW_2, -legL_2  ] )
        cube( [ legW, legW, legL ], center = true );
      translate( [ bodyW_2, bodyW_2, -legL_2  ] )
        cube( [ legW, legW, legL ], center = true );
    }
  }
  
  Step( 2 ) {
    bodyW = 20;
    bodyD = 6;
    bodyW_2 = bodyW / 2;
    
    color( Gray )
      cube( [ bodyW, bodyW, bodyD ], center = true );
    leg3_2( [  bodyW_2, -bodyW_2, 0 ] );
    leg3_2( [ -bodyW_2, -bodyW_2, 0 ] );
    leg3_2( [ -bodyW_2,  bodyW_2, 0 ] );
    leg3_2( [  bodyW_2,  bodyW_2, 0 ] );    
  }

  Step( 3 ) {
    bodyW = 20;
    bodyD = 6;
    bodyW_2 = bodyW / 2;
    
    color( Gray )
      cube( [ bodyW, bodyW, bodyD ], center = true );
    leg3_3( [  bodyW_2, -bodyW_2, 0 ] );
    leg3_3( [ -bodyW_2, -bodyW_2, 0 ] );
    leg3_3( [ -bodyW_2,  bodyW_2, 0 ] );
    leg3_3( [  bodyW_2,  bodyW_2, 0 ] );    
  }

  Step( 4 ) {
    bodyW = 20;
    bodyW_2 = bodyW / 2;
    
    body3_4( );
    leg3_3( [  bodyW_2, -bodyW_2, 0 ] );
    leg3_3( [ -bodyW_2, -bodyW_2, 0 ] );
    leg3_3( [ -bodyW_2,  bodyW_2, 0 ] );
    leg3_3( [  bodyW_2,  bodyW_2, 0 ] );        
  }
  
} // Chapter 3

//
// Chapter 4
//
// Bottom-Up design
//
//

legSegmentLength = 20;
legSegmentWidth = 4;

module legSegment4( ) {
  color( Gray ) 
    sphere( d=legSegmentWidth, center = true );
    translate( [ 0, 0, -legSegmentLength/2 ] ) {
      color( LightGray ) 
        cube( [ legSegmentWidth, legSegmentWidth, legSegmentLength - legSegmentWidth ], center = true );
    }
}

module leg4(  ) {
  legSegment4();
  translate( [ 0, 0, -legSegmentLength ] )
    legSegment4();
}

module body4( loc = [ 0, 0, 0 ] ) {
  bodyW = 20;
  bodyW_2 = bodyW / 2;
  bodyD = 6;
  bodyH = 20;
  translate( loc ) {
    color( Gray )
    cube( [ bodyW, bodyW, bodyH / 3], center = true );

    translate( [ 0, 0, bodyH / 3] ) {
    color ( LightGray )
    cylinder( h = bodyH / 3, d = bodyW_2, center = true );
    }

    translate( [ 0, 0, 2 * bodyH / 3 ] ) {
      color( Gray )
      cube( [ bodyW, bodyW, bodyH / 3 ], center = true );
    }
  }

}

module Chapter4() {
  Workspace();
  
  Step( 1 ) {
    color( Gray ) 
      sphere( d=legSegmentWidth, center = true );
      translate( [ 0, 0, -legSegmentLength/2 ] ) {
        color( LightGray ) 
          cube( [ legSegmentWidth, legSegmentWidth, legSegmentLength - legSegmentWidth  ], center = true );
      }
  }
  
  Step( 2 ) {
    legSegment4();
    translate( [ 0, 0, -legSegmentLength ] )
      legSegment4();
  }
  
  Step( 3 ) {
    bodyW = 20;
    bodyW_2 = bodyW / 2;
    bodyD = 6;
    bodyH = 20;
    color( Gray )
    cube( [ bodyW, bodyW, bodyH / 3], center = true );

    translate( [ 0, 0, bodyH / 3] ) {
    color ( LightGray )
    cylinder( h = bodyH / 3, d = bodyW_2, center = true );
    }

    translate( [ 0, 0, 2 * bodyH / 3 ] ) {
      color( Gray )
      cube( [ bodyW, bodyW, bodyH / 3 ], center = true );
    }
  }

  Step( 4 ) {
    bodyW = 20;
    bodyW_2 = bodyW / 2;
    
    body4(  );
    translate( [  bodyW_2, -bodyW_2, 0 ] )
      leg4( );
    translate( [  -bodyW_2, -bodyW_2, 0 ] )
      leg4( );
    translate( [  -bodyW_2, bodyW_2, 0 ] )
      leg4( );
    translate( [  bodyW_2, bodyW_2, 0 ] )
      leg4( );
  }

} // Chapter 4

//
// Chapter 5
//
// Positions
//
//

module Base() {
  translate( [ 0, 0, -45 ] )
    color( Gray )
      cube( [ 100, 100, 2 ], center = true );
}

module Marker5( c = Black, index = 0 ) {
  color( c ) {
    if ( index == 0 )
      translate( [ 0, 0, -10 ] )
      cylinder( h=20, r1 = 0, r2=4, center = true );
    if ( index == 1 ) {
      translate( [ 0, 0, -12.5 ] )
       cylinder( h=5, r1 = 1, r2=2, center = true );
      translate( [ 0, 0, -2.5 ] )
       cylinder( h=5, r1 = 3, r2=4, center = true );
    }
    if ( index == 2 ) {
      translate( [ 0, 0, -17.5 ] )
       cylinder( h=5, r1 = 0, r2=1, center = true );
      translate( [ 0, 0, -7.5 ] )
       cylinder( h=5, r1 = 2, r2=3, center = true );
    }
  }
}

legSegmentLength = 20;
legSegmentWidth = 4;

module legSegment5( ) {
  color( Gray ) 
    sphere( d=legSegmentWidth, center = true );
    translate( [ 0, 0, -legSegmentLength / 2 ] ) {
      color( LightGray ) 
        cube( [ legSegmentWidth, legSegmentWidth, legSegmentLength - legSegmentWidth ], center = true );
    }
}

module leg5( hipRotate = 0, legRotate = 0, kneeRotate = 0, actuatorPitch = 0, actuatorYaw = 0 ) {
  rotate( [ legRotate, 0, hipRotate ] ) {
    legSegment5( );
      translate( [ 0, 0, -legSegmentLength ] ) 
        rotate( [ kneeRotate, 0, 0 ] ) {
          legSegment5( );
            translate( [ 0, 0, -legSegmentLength ] )
              color( Gray )
                rotate( [ actuatorPitch, actuatorYaw, 0 ] )
                  sphere( d=legSegmentWidth, center = true );
          }
        }
}

module body5(  ) {
  bodyW = 20;
  bodyW_2 = bodyW / 2;
  bodyD = 6;
  bodyH = 20;

  color( Gray )
    cube( [ bodyW, bodyW, bodyH / 3], center = true );

  translate( [ 0, 0, bodyH / 3] ) {
    color ( LightGray )
    cylinder( h = bodyH / 3, d = bodyW_2, center = true );
  }

  translate( [ 0, 0, 2 * bodyH / 3 ] ) {
    color( Gray )
    cube( [ bodyW, bodyW, bodyH / 3 ], center = true );
  }
}

module Chapter5() {
  Workspace();
  
  Step( 1 ) {
   
    bodyWidth = 20;
    
    //Base();
    body5();
    translate( [ bodyWidth/2, -bodyWidth/2, 0 ] )
      leg5();
    translate( [ -bodyWidth/2, -bodyWidth/2, 0 ] )
      leg5();
    translate( [ -bodyWidth/2, bodyWidth/2, 0 ] )
      leg5();
    translate( [ bodyWidth/2, bodyWidth/2, 0 ] )
      leg5( -45, 90, 45 );
    
    rotate( [ 90, 0, 0 ] ) {
      translate( [ 75, 0, 0 ] )
        Marker5( Black, 1  );
      translate( [ 73, 0, 0 ] )
        Marker5( Red, 2  );
    }
    
    translate( [ 95, 0, 0 ] )
      rotate( [ 80, 15, 13 ] ) 
        Marker5( Black, 1  );
    translate( [ 95, 0, 0 ] )
      rotate( [ 80, 15, 13 ] )
        Marker5( Orange, 2  );


  }
  
  Step( 2 ) {
    // fixed
    robotRotate = 45;
    hipRotate = -45;
    bodyWidth = 20;
    legLength = 40;
    legWidth = 4;
    actuatorYaw = 0;

    // changable
    legRotate =  90;
    kneeRotate = -45;
    actuatorPitch = 45;
    
    //Base();
    rotate( [ 0, 0, robotRotate ] ) {
      body5();
      translate( [ bodyWidth/2, -bodyWidth/2, 0 ] )
        leg5();
      translate( [ -bodyWidth/2, -bodyWidth/2, 0 ] )
        leg5();
      translate( [ -bodyWidth/2, bodyWidth/2, 0 ] )
        leg5();
      translate( [ bodyWidth/2, bodyWidth/2, 0 ] ) {
        leg5( hipRotate, legRotate, kneeRotate, actuatorPitch, actuatorYaw );
      }
    }

    // How to put something at a specific location?
    // - have to know how the leg is organized
    // - seems inefficient - can this be done more compactly?
    // - while we have the graphics at the right place we still don't know numerically where things are
    rotate( [ 0, 0, robotRotate ] ) 
      translate( [ bodyWidth/2, bodyWidth/2, 0 ] )
        rotate( [ legRotate, 0, hipRotate ] ) 
            translate( [ 0, 0, -legLength/2 ] ) 
              rotate( [ kneeRotate, 0, 0 ] ) 
                  translate( [ 0, 0, -legLength / 2 ] )
                    rotate( [ actuatorPitch, actuatorYaw, 0 ] )   
                      translate( [ 0, 0, - legWidth/2 ] )   
                          Marker5( Black, 1 );
    
    // Maybe just add up all the various translations and rotations?
    // Nope - the rotations and translations need to be intertwined and they influence each other
    translate( [ 0, bodyWidth/2, 0 - legLength/4 - legLength/4 - legLength/4 - legLength/4 - legWidth/2 ] )
      rotate( [ legRotate + kneeRotate + actuatorPitch, actuatorYaw, robotRotate + hipRotate ] )
        Marker5( Red, 2 );

    // Even dramatically simplified cases get unmanageable
    translate( [ 0, 
                 (bodyWidth/2) / sin( robotRotate ) + ( sin( legRotate ) * legLength/2  ) + sin( legRotate + kneeRotate ) * ( legLength/2 + 0 * legWidth/2) + sin( legRotate + kneeRotate + actuatorPitch) * legWidth/2, 
                 0 - ( cos( legRotate ) * legLength/2 ) - cos( legRotate + kneeRotate ) * ( legLength/2 + 1 * 0 * legWidth / 2)  - cos( legRotate + kneeRotate + actuatorPitch ) * legWidth/2 ] )
      rotate( [ legRotate + kneeRotate + actuatorPitch, 0, robotRotate + hipRotate ] )
        Marker5( Orange, 2 );
        
    // Angles get truely baroque - one day I'll be smart enough to show the effect of adding actuator Yaw
  }
  
  Step( 3 ) {  
    // Soution - there is a representation that lets us chain transformations mathematically 
    // We'll call it a position: [ [ x, y, z ], [ ax, ay, az ], a ]
    // It encodes the following relation:  rotate a degrees about the axis defined by [ ax, ay, az ],
    // then shift to [ x, y, z ]
    originPosition = [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ];
        
    moMoveTo( originPosition )
      Marker5( Black ); 

    // Now - define a position that has no change in location, but flips things around the Z axis
    flipPosition = [ [ 0, 0, 0 ], [ 1, 0, 0 ], 180 ];
    moMoveTo( flipPosition )
      Marker5( Gray ); 
   
    // Now - a position that moves and rotates
    tumbleMovePosition1 = [ [ -30, 10, 10 ], [ 0, 1, 0 ], 90 ];

    moMoveTo( tumbleMovePosition1 )
      Marker5( Blue, 1  ); 
    
    // There is nothing magic about moMoveTo - it's just a rotate and a translate
    // The difference being that the rotation is specified as an axis and angle, 
    // rather than 3 angles
    translate( tumbleMovePosition1[ 0 ] )
      rotate( v = tumbleMovePosition1[ 1 ], a = tumbleMovePosition1[ 2 ] )
        Marker5( Green, 2  ); 
      
    // Now - define a position that moves and flips things around the Y axis
    tumbleMovePosition2 = [ [ 30, 10, 10 ], [ 0, 1, 0 ], 90 ];

    moMoveTo( tumbleMovePosition2 )
      moMoveTo( flipPosition )
        Marker5( Black, 1 ); 

    // Now can actually make the calculations, store and manipulate intermediate results
    // and ultimately move the parts where you want.
    netPosition = moMoveToPosition( tumbleMovePosition2, flipPosition );
    moMoveTo( netPosition )
      Marker5( Red, 2 );
      
  }

  Step( 4 ) {  
    robotRotate = 30;
    hipRotate = -25;
    bodyWidth = 20;
    legLength = 40;
    legWidth = 4;
    actuatorYaw = 80;
    legRotate =  90;
    kneeRotate = -45;
    actuatorPitch = 60;
    
    //Base();
    rotate( [ 0, 0, robotRotate ] ) {
      body5();
      translate( [ bodyWidth/2, -bodyWidth/2, 0 ] )
        leg5();
      translate( [ -bodyWidth/2, -bodyWidth/2, 0 ] )
        leg5();
      translate( [ -bodyWidth/2, bodyWidth/2, 0 ] )
        leg5();
      translate( [ bodyWidth/2, bodyWidth/2, 0 ] ) {
        leg5( hipRotate, legRotate, kneeRotate, actuatorPitch, actuatorYaw );
      }
    }

    // How to put something at a specific location?
    // Let's do it using the built in graphics functions
    rotate( [ 0, 0, robotRotate ] ) 
      translate( [ bodyWidth/2, bodyWidth/2, 0 ] )
        rotate( [ legRotate, 0, hipRotate ] ) 
          translate( [ 0, 0, -legLength/2 ] ) 
              rotate( [ kneeRotate, 0, 0 ] ) 
                  translate( [ 0, 0, -legLength / 2  ] )
                    rotate( [ actuatorPitch, actuatorYaw, 0 ] )   
                      translate( [ 0, 0, - legWidth/2 ] )   
                          Marker5( Black, 1 );
    
    // Now let's do it with positions - positions rotate first, then translate
    originPosition = [ [ 0, 0, 0 ], [ 0, 0, 1 ], robotRotate ];
    legPosition = [ [ bodyWidth/2, bodyWidth/2, 0 ], [ 0, 0, 1 ], hipRotate ];
    legRotatePosition = [ [ 0, 0, 0 ], [ 1, 0, 0 ], legRotate ]; 
    legSegment1Position = [ [ 0, 0, -legLength/2 ], [ 1, 0, 0 ], kneeRotate ]; 
    actuatorYawPosition = [ [ 0, 0, -legLength/2 ], [ 0, 1, 0 ], actuatorYaw ]; 
    actuatorPitchPosition = [ [ 0, 0, 0 ], [ 1, 0, 0 ], actuatorPitch ]; 
    actuatorLocationPosition = [ [ 0, 0, -legWidth/2 ], [ 0, 1, 0 ], 0 ]; 
    
    finalActuatorPosition = moMoveToPositions( [
                              originPosition, 
                              legPosition,
                              legRotatePosition,
                              legSegment1Position,
                              actuatorYawPosition,
                              actuatorPitchPosition,
                              actuatorLocationPosition ] );
                                       
    moMoveTo( finalActuatorPosition )
      Marker5( Orange, 2 );
      
    // Still a bit long-winded, but it works with all the parameters, and no fiddly math                         
  }

} // Chapter 5

//
// Chapter 6
//
// Parts, Connections
//
//

module Marker6( color = Red, p ) {
  moPosition( p, color, pl=20 );
}

body6W = 20;
body6W_2 = body6W / 2;
body6D = 6;
body6H = 20;

module body6(  ) { 
  translate( [ 0, body6H/6, 0 ] ) { 
    rotate( [ -90, 0, 0 ] ) {
      color( Gray )
        cube( [ body6W, body6W, body6H / 3], center = true );

      translate( [ 0, 0, body6H / 3] ) {
        color ( LightGray )
        cylinder( h = body6H / 3, d = body6W_2, center = true );
      }

      translate( [ 0, 0, 2 * body6H / 3 ] ) {
        color( Gray )
        cube( [ body6W, body6W, body6H / 3 ], center = true );
      }
    }
  }
}

body6Positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ body6W_2, body6H, -body6W_2 ], [ 0, 0, 1 ], 180 ],
  [ [ -body6W_2, body6H, -body6W_2 ], [ 0, 0, 1 ], 180 ],
  [ [ -body6W_2, body6H, body6W_2 ], [ 0, 0, 1 ], 180 ],
  [ [ body6W_2, body6H, body6W_2 ], [ 0, 0, 1 ], 180 ]
];

function body6Position( p = 0 ) = body6Positions[ p ];

module body6Complete(  p = 0, info = false  ) { 
  moPresent( body6Positions, p, info ) {
    translate( [ 0, body6H/6, 0 ] ) { 
      rotate( [ -90, 0, 0 ] ) {
        color( Gray )
          cube( [ body6W, body6W, body6H / 3], center = true );

        translate( [ 0, 0, body6H / 3] ) {
          color ( LightGray )
          cylinder( h = body6H / 3, d = body6W_2, center = true );
        }

        translate( [ 0, 0, 2 * body6H / 3 ] ) {
          color( Gray )
          cube( [ body6W, body6W, body6H / 3 ], center = true );
        }
      }
    }
  }
}

legSegment6Length = 20;
legSegment6Width = 4;

module legSegment6( ) {
  color( Gray ) 
    sphere( d=legSegment6Width, center = true );
    translate( [ 0, legSegment6Length / 2, 0 ] ) {
      color( LightGray ) 
        cube( [ legSegment6Width, legSegment6Length - legSegment6Width, legSegment6Width ], center = true );
    }
}

legSegment6Positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, legSegment6Length, 0 ], [ 0, 0, 1 ], 180 ]
];

function legSegment6Position( p = 0 ) = legSegment6Positions[ p ];

module legSegment6Complete( p = 0, info = false ) {
  moPresent( legSegment6Positions, p, info ) {
    color( Gray ) 
      sphere( d=legSegment6Width, center = true );
      translate( [ 0, legSegment6Length / 2, 0 ] ) {
        color( LightGray ) 
          cube( [ legSegment6Width, legSegment6Length - legSegment6Width, legSegment6Width ], center = true );
      }
  }
}

module leg6( hipRotate = 0, legRotate = 0, kneeRotate = 0 ) {
  rotate( [ legRotate, hipRotate, 0  ] ) { 
    legSegment6();
    legSegment6Position1 = legSegment6Position( 1 );
    moMoveTo( moMoveToPositions( [legSegment6Position1, moFlipPosition ] ) )  {
      rotate( [ kneeRotate, 0, 0 ] )
        legSegment6();
    }
  }
}

camera6StandHeight = 20;
camera6Width = 10;
camera6Height = 5;
camera6Depth = 15;
camera6LensDepth = 2;
camera6LensDiameter = 4;
camera6StandOffset = 5;
camera6StandDiameter = 2;

camera6Positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, camera6Depth-camera6StandOffset, camera6Height/2 ], [ 1, 0, 0 ], -90 ],
  [ [ 0, camera6Depth-camera6StandOffset, -camera6Height/2-camera6StandHeight ], [ 1, 0, 0 ], 90 ],
];

function camera6Position( p = 0 ) = camera6Positions[ p ];

module camera6( p = 0, info = false ) {
  moPresent( camera6Positions, p, info ) {
    color( LightGray ) {
      translate( [ camera6LensDiameter * 0.75, 0, 0 ] )
        rotate( [ 90, 0, 0 ] ) 
          cylinder( h=camera6LensDepth, d=camera6LensDiameter, center = true );
      translate( [ -camera6LensDiameter * 0.75, 0, 0 ] )
        rotate( [ 90, 0, 0 ] ) 
          cylinder( h=camera6LensDepth, d=camera6LensDiameter, center = true );
    }
    translate( [ 0, camera6Depth/2, 0 ] ) {
      color( Gray )
        cube( [ camera6Width, camera6Depth, camera6Height], center = true );
      translate( [ 0, camera6Depth/2-camera6StandOffset, -camera6Height/2-camera6StandHeight/2 ] ) {
        color( LightGray )
          cylinder( h=camera6StandHeight, d=camera6StandDiameter, center = true );
      }
    }
  }
}


module Chapter6() {
  Workspace();
  
  Step( 1 ) {

    body6();
   
    // Let's define positions for all the body parts we care about - legs and top
    topPosition = [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ];

    moMoveTo( topPosition )
      Marker6( Red, 0 );  
 
    leg1Position = [ [ body6W_2, body6H, -body6W_2 ], [ 0, 0, 1 ], 180 ];
    leg2Position = [ [ -body6W_2, body6H, -body6W_2 ], [ 0, 0, 1 ], 180 ];
    leg3Position = [ [ -body6W_2, body6H, body6W_2 ], [ 0, 0, 1 ], 180 ];
    leg4Position = [ [ body6W_2, body6H, body6W_2 ], [ 0, 0, 1 ], 180 ];

    moMoveTo( leg1Position ) 
      Marker6( Red, 1 );
    moMoveTo( leg2Position ) 
      Marker6( Red, 2 );
    moMoveTo( leg3Position ) 
      Marker6( Red, 3 );
    moMoveTo( leg4Position ) 
      Marker6( Red, 4 );
  

    legTopPosition = [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ];
    legEndPosition = [ [ 0, legSegment6Length, 0 ], [ 0, 0, 1 ], 180 ];

    translate( [ -50, 0, 0, ] ) {
      legSegment6();

      moMoveTo( legTopPosition ) 
        Marker6( Red, 1 );
      moMoveTo( legEndPosition ) 
        Marker6( Red, 2 );
    }
    
    oddPosition = [ [ 50, 5, 5 ], [ 0.707, 0, 0.707 ], -60 ];

    moMoveTo( oddPosition ) {
      body6();
      moMoveTo( leg1Position )  {
        Marker6( Red, 1 );
        legSegment6();
      }

    }
  
    moMoveTo( moMoveToPositions( [ oddPosition, leg4Position, moFlipPosition ] ) ){
      Marker6( Red, 4 );
      legSegment6();
    }
  
  }

  Step( 2 ) {
    // Adding the positions to the part definitions
    flipPosition = [ [ 0, 0, 0 ], [ 0, 0, 1 ], 180 ];
    body6();
    body6Position4 = body6Position( 4 );
    moMoveTo( moMoveToPosition( body6Position4, flipPosition ) )  {
      Marker6( Red, 1 );
      legSegment6();
    }

    // We can add positions to the leg segment definition too, and then chain another leg segment onto the existing one
    legSegment6Position1 = legSegment6Position( 1 );
    moMoveTo( moMoveToPositions( [ body6Position4, flipPosition, legSegment6Position1, flipPosition ] ) )  {
      Marker6( Red, 1 );
      legSegment6();
    }    
  }  
  
  Step( 3 ) {
    // When internally, the part uses moPresent( ), it automatically gets the ability to visualize where 
    // all the part's positions are, and naming
    moGridParts( [ 0, 0, 0 ], [ 60, 0, 0 ], rotate = -1) {
      body6Complete( 0, info = true, $name = true );
      body6Complete( 1, info = true, $name = true );      
      legSegment6Complete( 0, info = true, $name = true );
      camera6( 0, info = true, $name = true );
    }
  }
  
  
  Step( 4 ) {
    // positioning subtleties
    
    moGridParts( [-20,0,0], [ 45, 0, 0 ], rotate = 0 ) {

      camera6( info = true ); 
        
        rotate( [ 180, 0, 0 ] )
          camera6( info = true ); 

        union(){ 
          body6Complete();

          moMoveTo( body6Position( 0 ) )
            color( Red )
              camera6( );
        }

        union(){ 
          body6Complete();

          moMoveTo( body6Position( 0 ) )
            moMoveTo( camera6Position( 2 ) )
              color( Red )
                camera6( );
        }

        union(){ 
          body6Complete();

          moMoveTo( body6Position( 0 ) )
            moMoveTo( moInvertPosition( camera6Position( 2 ) ) )
              color( Red )
                camera6( );
        }     
    
        union(){ 
          body6Complete();

          moMoveTo( body6Position( 0 ) )
            moMoveTo( moFlipPosition )
              moMoveTo( moInvertPosition( camera6Position( 2 ) ) )
                camera6( );
        }
      
      }
    }
      
  Step( 5 ) {
           
    moGridParts( [25,0,0], [ 50, 0, 0 ], rotate = 0 ) {

      robotPosition = [ [ 0, 0, 0 ], [ 1, 0, 0 ], -90 ];  
      
      moMoveTo( robotPosition ) {        
        body6Complete();

        moMoveTo( body6Position( 0 ) )
          moMoveTo( moFlipPosition )
              camera6( 2 );         
      }

      moMoveTo( robotPosition ) {
        body6Complete();
   
        color( LightGray )
          moMoveTo( body6Position( 0 ) )
            moMoveTo( moMoveToPositions( [ moFlipPosition, moLinearPosition( -8 ) ] ) )
              camera6( 2 );            
      }

      moMoveTo( robotPosition ) {
        body6Complete();

        color( LightGray )
          moMoveTo( body6Position( 0 ) )
            moMoveTo( moMoveToPositions( [ moFlipPosition, moLinearPosition( - 16 ), moRollPosition( 45 ) ] ) )
              camera6( 2 ); 
        
      }

    }
  }
  
  Step( 6 ) {
    robotPosition = [ [ 0, 0, 0 ], [1, 0, 0 ], -90 ];
    
    moMoveTo( robotPosition ) {
      body6Complete();

      moMoveTo( body6Position( 0 ) )
        moMoveTo( moMoveToPositions( [ moFlipPosition, moRollPosition( -65 ) ] ) )
          camera6( 2 ); 
      
      moMoveTo( body6Position( 1 ) )
        moMoveTo( moFlipPosition )
          leg6( 0, -90, 90  );

      moMoveTo( body6Position( 2 ) )
        moMoveTo( moFlipPosition )
          leg6( 0, -90, 90  );

      moMoveTo( body6Position( 3 ) )
        moMoveTo( moFlipPosition )
          leg6( 180, -90, 90 );

      moMoveTo( body6Position( 4 ) )
        moMoveTo( moFlipPosition ) {          
          leg6( 200, -100, -70  );
        }
    }
  }
  
} // Chapter 6
