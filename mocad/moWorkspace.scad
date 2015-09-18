
include <../mo/mo.scad>

use <../mocad/moLogo.scad>

WorkspaceSize = 30 * in;
WorkspaceSpacing = 1 * in;
WorkspaceThickness = 0.25 * in;

Example();

module Workspace( steps = 4, size = WorkspaceSize, spacing = WorkspaceSpacing, name = "", height = 0.5 * in ) {
  length = steps * ( size + spacing ) + spacing;
  logoDimensions = moLogoDimensions();
  translate( [ 0, (length - size )/2, -size / 2 ] ) {
    translate( [ -size / 2 - spacing - logoDimensions[ 2 ], 0,  5 * ( logoDimensions[1] + WorkspaceThickness )  ] )
      scale( [ height / ( 0.5 * in ),  height / ( 0.5 * in ),  height / ( 0.5 * in ) ] )
        rotate( [ -90, 0, 90  ] ) {
          moLogo();
            translate( [ 0, logoDimensions[ 1 ], 0.05 * in  ] )
              color( White )
                scale( [ 1.4, 0.5, 1.4 ] )
                  cube( logoDimensions, center = true );
        }

    color( LightGray )
      cube( [ size + 2 * spacing, length, WorkspaceThickness ], center = true );
    translate( [ size/2 + spacing * 2, 0, 0 ] )
      rotate( [ -65, 0 , 90 ] )
        moLabel( len( name ) > 0 ? name : parent_module(2), tileColor = White, lh = height );
  }
}

module Step( d, size = WorkspaceSize, spacing = WorkspaceSpacing, name = "", height = -1, labelHeight = 1 * in ) {
  height = ( height == -1 ) ? size/2 : height;
  translate( [ 0, ( d - 1 ) * ( size + spacing ) + spacing, 0 ] ) {
    translate( [ 0, 0, -size/2 + height/2 ] )
      children();
    translate( [ size/2, 0, -(size - 2 * spacing) / 2  ] )
      rotate( [ -85, 0 , 90 ] )
        moLabel( str( "Step ", d, " ", name ), lh = labelHeight, tileColor = White );
  }
}


module Marker( color = Red, p  = "Name" ) {
  moPosition( p, color, pl=20 );
}

module SplitMarker( c = Black, index = 0 ) {
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

module Example( ) {
  size = 200;
  Workspace( 2, size = 200  );
  Step( 1, size = 200, height = 20 ) {
    Marker();
  }
  Step( 2, size = 200, height = 50 ) {
    moGridParts() {
      SplitMarker( Black, 0 );
      SplitMarker( Red, 1 );
      SplitMarker( Orange, 2 );
      union(){
        SplitMarker( Red, 1 );
        SplitMarker( Orange, 2 );
      }
    }
  }
}

/*

bodyW = 20;
bodyW_2 = bodyW / 2;
bodyD = 6;
bodyH = 4;

bodyPositions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ bodyW_2, bodyH, -bodyW_2 ], [ 0, 0, 1 ], 180 ],
  [ [ -bodyW_2, bodyH, -bodyW_2 ], [ 0, 0, 1 ], 180 ],
  [ [ -bodyW_2, bodyH, bodyW_2 ], [ 0, 0, 1 ], 180 ],
  [ [ bodyW_2, bodyH, bodyW_2 ], [ 0, 0, 1 ], 180 ]
];

function bodyPosition( p = 0 ) = bodyPositions[ p ];

module bodyComplete(  p = 0, info = false  ) {
  moPresent( bodyPositions, p, info ) {
    translate( [ 0, bodyH/2, 0 ] ) {
      rotate( [ -90, 0, 0 ] ) {
        color( Gray )
          cube( [ bodyW, bodyW, bodyH ], center = true );
      }
    }
  }
}

actuatorSegmentWidth = 1.5;
actuatorSegmentLength = 8;

module actuatorSegment( ) {
  color( Gray )
    sphere( d=actuatorSegmentWidth, center = true );
    translate( [ 0, actuatorSegmentLength / 2, 0 ] ) {
      color( Gray )
        cube( [ actuatorSegmentWidth, actuatorSegmentLength - actuatorSegmentWidth, actuatorSegmentWidth ], center = true );
    }
}

actuatorSegmentPositions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, actuatorSegmentLength, 0 ], [ 0, 0, 1 ], 180 ]
];

function actuatorSegmentPosition( p = 0 ) = actuatorSegmentPositions[ p ];


legSegmentLength = 20;
legSegmentWidth = 2;

module legSegment( ) {
  color( Gray )
    sphere( d=legSegmentWidth, center = true );
    translate( [ 0, legSegmentLength / 2, 0 ] ) {
      color( LightGray )
        cube( [ legSegmentWidth, legSegmentLength - legSegmentWidth, legSegmentWidth ], center = true );
    }
}

legSegmentPositions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, legSegmentLength, 0 ], [ 0, 0, 1 ], 180 ]
];

function legSegmentPosition( p = 0 ) = legSegmentPositions[ p ];

module legSegmentComplete( p = 0, info = false ) {
  moPresent( legSegmentPositions, p, info ) {
    color( Gray )
      sphere( d=legSegmentWidth, center = true );
      translate( [ 0, legSegmentLength / 2, 0 ] ) {
        color( LightGray )
          cube( [ legSegmentWidth, legSegmentLength - legSegmentWidth, legSegmentWidth ], center = true );
      }
  }
}

module leg( hipRotate = 0, legRotate = 0, kneeRotate = 0, actuatorRotate = 0 ) {
  rotate( [ legRotate, hipRotate, 0  ] ) {
    legSegment();
    legSegmentPosition1 = legSegmentPosition( 1 );
    moMoveTo( moMoveToPositions( [legSegmentPosition1, moFlipPosition ] ) )  {
      rotate( [ kneeRotate, 0, 0 ] ) {
        legSegment();
        moMoveTo( legSegmentPosition1)  {
        moFlip()
          rotate( [ actuatorRotate, 0, 0 ] ) {
            actuatorSegment();
          }
        }
      }
    }
  }
}


module Walker() {
  Workspace();

  Step( 1 ) {
    robotPosition = [ [ 0, 0, -10 ], [1, 0, 0 ], -90 ];

    hipA = moSuperSmoothAnimationCycle( 0, 0.85, 50 );
    hipB = moSuperSmoothAnimationCycle( 0, 0.85, 50 );

    legA = moSuperSmoothAnimationCycle( 0.25, 0.5, 10 );

    moMoveTo( robotPosition ) {
      bodyComplete();

      moMoveTo( bodyPosition( 1 ) )
        moMoveTo( moFlipPosition )
          leg( -25-hipA, -135 -legA, 90, -90  );

      moMoveTo( bodyPosition( 2 ) )
        moMoveTo( moFlipPosition )
          leg( 25-hipB, -90, 90  );

      moMoveTo( bodyPosition( 3 ) )
        moMoveTo( moFlipPosition )
          leg( 120 + hipA, -90, 90 );

      moMoveTo( bodyPosition( 4 ) )
        moMoveTo( moFlipPosition ) {
          leg( 220 - hipB, -90, 90  );
        }
    }
  }


  Step( 2 ) {
    robotPosition = [ [ 0, 0, 0 ], [1, 0, 0 ], -90 ];

    hipA = moSuperSmoothAnimationCycle( 0, 0.85, 10 );
    hipB = moSuperSmoothAnimationCycle( 0, 0.85, 10 );

    legA = moSuperSmoothAnimationCycle( 0.25, 0.5, 10 );

    moPitch(  )
    moMoveTo( robotPosition ) {
      bodyComplete();

      moMoveTo( bodyPosition( 1 ) )
        moMoveTo( moFlipPosition )
          leg( hipA, -90 -legA, 90  );

      moMoveTo( bodyPosition( 2 ) )
        moMoveTo( moFlipPosition )
          leg( -hipB, -90, 90  );

      moMoveTo( bodyPosition( 3 ) )
        moMoveTo( moFlipPosition )
          leg( 10, -90 + hipA, -90 +hipA );

      moMoveTo( bodyPosition( 4 ) )
        moMoveTo( moFlipPosition ) {
          leg( -10, -90, -90  );
        }
    }
  }

  Step( 3 ) {
    robotPosition = [ [ 0, 20, 0 ], [1, 0, 0 ], -90 ];

    hipA = moSuperSmoothAnimationCycle( 0, 0.85, 30 );
    hipB = moSuperSmoothAnimationCycle( 0, 0.85, 10 );

    legA = moSuperSmoothAnimationCycle( 0.25, 0.5, 10 );

    moPitch(  )
    moMoveTo( robotPosition ) {
      bodyComplete();

      moMoveTo( bodyPosition( 1 ) )
        moMoveTo( moFlipPosition )
          leg( hipA, -135 -legA, 35, -90  );

      moMoveTo( bodyPosition( 2 ) )
        moMoveTo( moFlipPosition )
          leg( -hipB, -90-hipB, 0, -90  );

      moMoveTo( bodyPosition( 3 ) )
        moMoveTo( moFlipPosition )
          leg( 10, -90 + hipA, -90 +hipA );

      moMoveTo( bodyPosition( 4 ) )
        moMoveTo( moFlipPosition ) {
          leg( -10, -90 - hipA, -90 - hipA  );
        }
    }
  }

  Step( 4 ) {
    robotPosition = [ [ 0, 0, 0 ], [1, 0, 0 ], -90 ];

    hipA = moSuperSmoothAnimationCycle( 0, 0.85, 10 );
    hipB = moSuperSmoothAnimationCycle( 0, 0.85, 10 );

    legA = moSuperSmoothAnimationCycle( 0.25, 0.5, 10 );

    moMoveTo( robotPosition ) {
      bodyComplete();

      moMoveTo( bodyPosition( 1 ) )
        moMoveTo( moFlipPosition )
          leg( hipA, 0 -legA, -90  );

      moMoveTo( bodyPosition( 2 ) )
        moMoveTo( moFlipPosition )
          leg( -hipB, 0 + hipA/2, -90  );

      moMoveTo( bodyPosition( 3 ) )
        moMoveTo( moFlipPosition )
          leg( 180 + hipA, 0, -90 );

      moMoveTo( bodyPosition( 4 ) )
        moMoveTo( moFlipPosition ) {
          leg( 180 - hipB, -15, -90  );
        }
    }
  }

  Step( 5 ) {
    robotPosition = [ [ 0, 0, -20 ], [1, 0, 0 ], -90 ];

    hipA = moSuperSmoothAnimationCycle( 0, 0.85, 10 );
    hipB = moSuperSmoothAnimationCycle( 0, 0.85, 10 );

    legA = moSuperSmoothAnimationCycle( 0.25, 0.5, 10 );

    moMoveTo( robotPosition ) {
      bodyComplete();

      moMoveTo( bodyPosition( 1 ) )
        moMoveTo( moFlipPosition )
          leg( hipA, -135 -legA, 90, -45  );

      moMoveTo( bodyPosition( 2 ) )
        moMoveTo( moFlipPosition )
          leg( -hipB, -135, 90, -45  );

      moMoveTo( bodyPosition( 3 ) )
        moMoveTo( moFlipPosition )
          leg( 180 + hipA, -135, 90, -45 );

      moMoveTo( bodyPosition( 4 ) )
        moMoveTo( moFlipPosition ) {
          leg( 180 - hipB, -135, 90, -45  );
        }
    }
  }

  Step( 6 ) {
    robotPosition = [ [ 0, 0, 20 ], [1, 0, 0 ], -90 ];

    stepA = moSuperSmoothAnimationCycle( 0, 0.25, 20 );
    stepB = moSuperSmoothAnimationCycle( 0.25, 0.5, 20 );
    stepC = moSuperSmoothAnimationCycle( 0.5, 0.75, 20 );
    stepD = moSuperSmoothAnimationCycle( 0.75, 1, 20 );

    moMoveTo( robotPosition ) {
      bodyComplete();

      moMoveTo( bodyPosition( 1 ) )
        moMoveTo( moFlipPosition )
          leg( 0, stepA, -stepA/2, 4*stepA  );

      moMoveTo( bodyPosition( 2 ) )
        moMoveTo( moFlipPosition )
          leg( 0, -stepB, stepB/2, 4*stepB  );

      moMoveTo( bodyPosition( 3 ) )
        moMoveTo( moFlipPosition )
          leg( 180, stepC, -stepC/2, 4*stepC );

      moMoveTo( bodyPosition( 4 ) )
        moMoveTo( moFlipPosition ) {
          leg( 180, -stepD, stepD/2, -4*stepD  );
        }
    }
  }


} // Chapter

*/
