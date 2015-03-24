
//
// Constants
//

// text active
// turn this off if performance is an issue on your machine
moText = true;

// Keeping the polygonization reasonable
$fa = 12;
$fs = 0.1;

// Lets us use real dimensions
mm = 1;
in = 25.4;

// Boost to attempt to avoid plan interference
Epsilon = 0.1;

// Material colors
Steel = [0.65, 0.67, 0.72];
Stainless = [0.45, 0.43, 0.5];
Aluminum = [0.77, 0.77, 0.8];
BlackDelrin = [0.2, 0.2, 0.2];
Brass = [0.88, 0.78, 0.5];
Transparent = [1, 1, 1, 0.2];
BlackABS = [0.2, 0.2, 0.2];
Nylon = [1, 1, 1];
Yellow = [ 1, 1, 0 ];
Copper = [ 0.75, 0.5, 0.2 ];
Black = [0, 0, 0];
White = [1, 1, 1];
Red = [ 1, 0 ,0 ];
Blue = [ 0, 0 ,1 ];
Green = [ 0, 1 ,0 ];

//
//  Public Interface
//

//
// Position-Based Placement Helpers
//

// Moves the chilren to a place specified, and permits some joint-like orientation along the way
module moMoveTo( p=[[0,0,0],[0,0,1],0], t = 0, r = 0 ) {
  translate( p[ 0 ] )
    rotate( a=p[ 2 ], v=p[ 1 ] )
      translate( [ 0, t, 0 ] )
        rotate( [ 0, r, 0 ]  )
          children();
}

// Moves the children in the reverse of the direction to the specified part - for example, if
// a part is constructed at its origin, this command can move it so one of its positions are at the origin
// calling qmove in this way would move the whole object to it's own specified position - possibly leaving
// nothing at the origin
module moMoveOriginTo( posBase ) {
  rotate( a=posBase[ 2 ], v=-posBase[ 1 ] )
    translate( -posBase[ 0 ] )
      children();
}

// These plain versions are internal
module moMoveToPlain( p=0 ) {
  if ( p != 0 ) {
    translate( p[ 0 ] )
      rotate( a=p[ 2 ], v=p[ 1 ] )
        children();
  } else {
    children();
  }
}

module moUnmoveToPlain( p= 0 ) {
  if ( p != 0 ) {
    rotate( a=p[ 2 ], v=-p[ 1 ] )
      translate( -p[ 0 ] )
        children();
  } else {
    children();
  }
}

module moAttach( base = 0, basePos = 0, joint = 0, partPos = 0, partOld = 0, partOldPosition = 0 ) {
  moMoveToPlain( base )
    moMoveToPlain( basePos )
      moMoveToPlain( joint )
        moUnmoveToPlain( partPos )
            moMoveToPlain( partOldPosition )
              moUnmoveToPlain( partOld )
                children();
}

// Align operators
module moAlign( basePosition, position ) {
}

partLabelHeight = 0.2 * in;
partLabelDepth = partLabelHeight/10;
partLabelColor = [ 0.25, 0.25, 0.25 ];
partLabelTileColor = [ 1, 1, 1 ];
partLabelOffsetY = -0.5 * in;
partLabelOffsetZ = -0.75 * in;
partLabelTilt = -45;

// Draws a standard part label a little below the object's zero reference
module moPartLabel( t ) {
  translate( [ 0, partLabelOffsetY, partLabelOffsetZ ] )
    rotate( [ partLabelTilt, 0, 0 ] )
    moLabel( t, partLabelHeight, partLabelDepth, partLabelColor, partLabelTileColor );
}

module moPresent( qpositions, p, info ) {
  // position per request
  moMoveOriginTo( qpositions[ p ] ) {
    children();
    if ( info == true )
      moPositions( qpositions );
  }
  // add orientation mark, if requested
  if ( info == true )
    moPartOrigin();
  if ( $name == true ) {
    moPartLabel( parent_module(2) );
  }
}

module moPositions( qpositions ) {
  l = len( qpositions );
  for ( p = [0:l-1] ) {
    moMoveTo( qpositions[ p ] )
      moPosition( p );
  }
}

module moPosition( index = -1, c = [ 1, 0, 0 ], pl=positionHeight ) {
  s = str( index );
  union(){
     color( c ) {
      translate( [ 0, pl/4, 0 ] ) {
          cube( [positionHeight*len(s),pl/2,positionHeight], center=true );
      }
    }
    color( [0,0,0]) {
      translate( [ 0, -pl/4, 0 ] ) {
          cube( [positionHeight*len(s),pl/2,positionHeight], center=true );
      }
    }
    if ( index != -1 ) {
      // positionLabelDesignerBlock( index );
      positionLabelBitmap( index, pl=pl );
    }
  }
}

module moPosition2( p, c = [ 0, 0, 1 ] ) {
  s0 = str( p[ 0 ] );
  translate( [ -1 * ( len( s0 ) + 0.25 ) * 0.5 * positionHeight, 0, 0 ] )
    moPosition( s0, c );
  s1 = str( p[ 1 ] );
  translate( [ ( len( s1 ) + 0.25 ) * 0.5 * positionHeight, 0, 0 ] )
    moPosition( s1, c );
}

module moPosition3( p ) {
  translate( [ 0, 0, positionHeight * 1.25 ] )
    moPosition( p[ 0 ], c = [ 0, 1, 0 ] );
  moPosition2( [ p[ 1 ], p[ 2 ] ], c = [ 0, 1, 0 ] );
}

positionIndicatorSize = 0.3;
positionIndicatorLength = 2 * in;

module moPartOrigin( ) {
  color( [1,1,1]) {
    translate( [ 0, -positionIndicatorLength/4-positionHeight, 0 ] )
      cube( [positionIndicatorSize/2,positionIndicatorLength/2,positionIndicatorSize], center=true );
    cube( [positionIndicatorLength / 2,positionIndicatorSize,positionIndicatorSize], center=true );
    cube( [positionIndicatorSize,positionIndicatorSize, positionIndicatorLength / 2], center=true );
  }
}

StaggerAngle = -35;
module moGridParts( origin = [ 0, 0, 0 ], deltas = [ 50, 0, 0 ], rotate = 1 ) {
  for (i = [0 : $children-1])
      translate( origin - ( $children * deltas / 2 ) + deltas * i )
        rotate( [ 0, 0, rotate * ( 360 * $t + StaggerAngle ) ] )
          children(i);
}

module moDuplicatedParts( origin, deltas, count = 1, rotate = 0 ) {
  for (i = [0 : count-1])
      translate( origin - ( $children * deltas / 2 ) + deltas * i )
        rotate( [ 0, 0, rotate * ( 360 * $t + StaggerAngle ) ] )
          children(0);
}


// Tricky Quaternion Code - and where I got some of the math from
// http://stackoverflow.com/questions/5782658/extracting-yaw-from-a-quaternion
// http://math.stackexchange.com/questions/1116552/rotating-a-point-in-space-about-another-via-quaternion?rq=1
// Also added a fix for the singularity around angle 0 (vector is anything, when angle is zero, not div/0!)
// (http://www.euclideanspace.com/maths/geometry/rotations/conversions/quaternionToAngle/)
// Also fixed NAN error from acos( ) when a > 1 or <  -1 by an infinitesimal

use <maths.scad>

// ----------------------------------------------------------------------------------------
// NEW API
function moMoveToPosition( base = 0, position = 0 ) = moCombinePositions( base, position );

function moMoveToPositions( positions, index = 0 ) = ( index == len( positions ) - 1 ) ? positions[ index ] :
                                                                                         moCombinePositions( positions[ index ], moMoveToPositions( positions, index + 1 ) );

// untested
function moMoveOriginToPosition( base = 0, position = 0 ) = moCombinePositions( base,
                                                                                   [[0,0,0],-partPosition[1],partPosition[2] ], [-partPosition[0],[0,0,1],0] );

// ha!  Part's prior position is ignored, because attach removes it!
function moAttachPosition( base = 0, basePosition = 0, joint = 0, partPosition = 0 ) =
  moMoveToPosition( base, moMoveToPosition( basePosition, moMoveToPosition( joint,
                                  ( partPosition == 0 ) ? 0 : moMoveToPosition(
                                                                 [[0,0,0],-partPosition[1],partPosition[2] ],
                                                                 [-partPosition[0],[0,0,1],0]
                                                              ) ) ) );

moOriginPosition = [ [ 0, 0, 0 ], [ 1, 0, 0 ], 0 ];
moIdentityPosition = [ [ 0, 0, 0 ], [ 1, 0, 0 ], 0 ];
moFlipPosition = [ [ 0, 0, 0 ], [ 0, 0, 1 ], 180 ];

function moYawPosition( a = 90 ) = [ [ 0, 0, 0 ], [ 0, 0, 1 ], a ];
function moRollPosition( a = 90 ) = [ [ 0, 0, 0 ], [ 0, 1, 0 ], a ];
function moPitchPosition( a = 90 ) = [ [ 0, 0, 0 ], [ 1, 0, 0 ], a ];
function moLinearPosition( x = 1 * in ) = [ [ 0, x, 0 ], [ 1, 0, 0 ], 0 ];
function moTranslationPosition( x, y, z ) = [ [ x, y, z ], [0, 0, 1], 0 ];

function moIsIdentityPosition( p = 0 ) = ( ( p == 0 ) ? true :
                                                         ( p[0][0]==0&&p[0][1]==0&&p[0][2]==0&&p[2]==0) );

function moInvertPosition( position = 0 ) = moCombinePositions( [[0,0,0],-position[1],position[2] ], [-position[0],[0,0,1],0] );

// ----------------------------------------------------------------------------------------

function moCombinePositions( base = 0, position = 0 ) = ( ( moIsIdentityPosition( base ) ) ? position :
                                                              ( ( moIsIdentityPosition( position )  ) ?
                                                                     base :
                                                                     moCombinePositions_inner0( base, position ) ) );


function moCombinePositions_inner0( base, part ) = moCombinePositions_inner1( base, part, quat( base[ 1 ], base[ 2 ] ) );
function moCombinePositions_inner3( base, part, baseQuat, baseMat, theta ) = [
  vec3_from_point3( vec4_add( point3_from_vec3( base[ 0 ] ),
                    vec4_mult_mat4( point3_from_vec3( part[ 0 ] ),
                    quat_to_mat4( quat_conj( baseQuat ) ) ) ) ),
  (( theta ) % 360 == 0 ) ? [ 0, 0, 1 ] :
                    ( ( ( theta  ) % 180 == 0 ) ? [ -baseMat[ 0 ], -baseMat[ 1 ], -baseMat[ 2 ] ] :
                                            [ baseMat[ 0 ] / sin( theta / 2 ), baseMat[ 1 ] / sin( theta / 2 ), baseMat[ 2 ] / sin( theta / 2 ) ] ),
  theta
];
function moCombinePositions_cosClean( a ) = ( a > 1 ) ? 1 : ( ( a < -1 ) ? -1 : a );
function moCombinePositions_inner2( base, part, baseQuat, baseMat ) = moCombinePositions_inner3( base, part, baseQuat, baseMat, 2 * acos( moCombinePositions_cosClean( baseMat[3] ) ) );
function moCombinePositions_inner1( base, part, baseQuat ) = moCombinePositions_inner2( base, part, baseQuat, quat_mult( baseQuat, quat( part[ 1 ], part[ 2 ] ) ) );


//
// General Placement Helpers
//

// Quick Rotations

module moPitch( direction = 1 ) {
  rotate([ direction*90, 0, 0 ])
    children();
}

module moYaw( direction = 1 ) {
  rotate([ 0, 0, direction*90 ])
    children();
}

module moFlip(  ) {
  rotate([ 0, 0, 180 ])
    children();
}

module moRoll( direction = 1 ) {
  rotate([ 0, direction*90, 0 ])
    children();
}

// Quick rotate and translate
module moPose( r = [ 0, 0, 0], t = [ 0, 0, 0 ] ) {
  translate( t )
    rotate( r )
      children();
}


//
//
// Local functions - not designed to be used by external code
//
//


positionHeight = 0.05 * in;
positionLabelDepth = positionHeight / 20;

p3Color = [ 0, 0.75, 0 ];


module positionLabelBitmap( index, clr = [ 1, 1, 1 ], pl = positionHeight ) {
  s = str( index );
  slen = len( s );

  translate( [ 0, -pl/2, 0  ] )
    moLabel( s, positionHeight, positionLabelDepth, textColor = clr );
}


// Draw a centered label at the origin
// tileColor is the color of the tile the label is drawn on
// lh is the height of the label text and tile
// ld is the depth of the text
//

// Creates a centered label with specified size (height and depth) and color and with optional background tile
module moLabel( text = "", lh = 1 * in, ld =  0.1 * in, textColor = [ 0.5, 0.5, 0.5 ], tileColor  ) {
  w = len( text );
  td = lh / 4;

    if ( len(tileColor ) == 3 ) {
      color( tileColor ) {
        translate( [ 0, td/2, -lh/6 ] ) {
          cube( [ lh * 1.6 * ( w + 1 )/2, td, lh * 1.5 ], center=true );
        }
      }
    }

    translate( [ 0, 0, -lh/2 ] )
      rotate( [ 90, 0, 0 ] )
        color( textColor )
          scale( [ 1, 1, 0.1 ] )
            if ( moText )
              text( text, font = "Liberation Mono", size = lh, s = ld * 10, halign="center" );
            else
              ;

}
