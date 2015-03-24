use <../mocad/moShaft.scad>

include <../mo/mo.scad>

//
// moPipeline
//
// Create a moPipeline according to a plan.  The plan is an array of [ turn, move ] pairs.  Starting from the origin,
// facing in the positive Y direction, execute the plan one step at a time, turning and then moving the specified amounts.
//
// To visualize what is going on, imagine you're tunneling.  At each step you make a turn in three dimensions,
// then tunnel forward for a defined distance.  For example, when
//
// plan = [
//          [ [ 0, 0, 0 ], 10 ],
//          [ [ -90, 0, 0 ], 5 ],
//          [ [ 0, 0, 45 ], 5 ]
//        ];
//
// moPipeline( plan, 1 );
//
// moPipeline will draw a 10mm segment straight out in the positive Y direction, since there is no turn specified.  Then
// we turn in the downward direction 90 degrees and move (down) 5mm.   Next we turn left 45 degrees and move a further
// 5mm
//

module moPipeline( plan = [ [ [ 0, 0, 0 ], 10 ], [ [ -90, 0, 0 ], 5 ],[ [ 0, 0, 45 ], 3 ] ],
                   diameter = 1, info = false ) {
  moPipelineInner( plan, 0, diameter, $name = false );
  if ( info == true )
    moPartOrigin();

  if ( $name )
    moPartLabel( parent_module( 1 ) );
}

//
// moPipeline Points
//
// Draw a moPipeline from one point to another.  As the default behaviour, the X, Y and Z components of the move are resolved
// in order of vector magnitude in each direction.
//
//   moPipelinePoints( from, to, 1 )
//
// Would draw a moPipeline from the from point to the two point resolving each axis in order
//
// For more control, a design may be specified.  For example,
//
//   moPipelinePoints( from, to, 1, "YXZ" )
//
// will draw a 1mm moPipeline from the from point to the to point by resolving the Y first, then the X, then the Z
//
//   moPipelinePoints( from, to, 1, "YXZXY" )
//
// will draw the moPipeline resolving half the Y, then half the X, then the Z, the rest of the X, and the rest of the Y
//

module moPipelinePoints( fromPoint = [ 0, 0, 0 ], toPoint = [ 5, 10, 3 ],
                         diameter = 1, designString = "", offset = 0, info = false ) {
  v = toPoint - fromPoint;
  if ( designString != "" ) {
    designScale = moPipelinePointsDesignScale( designString[ 0 ], designString );
    translate( fromPoint )
      moPipelinePointsInner( v, diameter, designString, designScale, offset, 0, $name = false );
  } else {
    ds = moPipelinePointsDesign( v );
    designScale = moPipelinePointsDesignScale( ds[ 0 ], ds );
    translate( fromPoint )
      moPipelinePointsInner( v, diameter, ds, designScale, offset, 0, $name = false );
  }
  if ( info == true )
    moPartOrigin();
  if ( $name )
    moPartLabel( parent_module( 1 ) );
}

//
// moPipeline Positions
//
// Draw a moPipeline from one position (point+direction) to another.  The pipe segments begin
// with a segment.
//
//  moPipelinePositions( fromPosition, toPosition, diameter, offset = 0  )
//
//

//
// Internals
//

module moPipelineInner( plan, step, diameter ) {
  rotate( plan[ step ][ 0 ] ) {
    moShaft( 1, l = plan[ step ][ 1 ], caps = true, d = diameter );
    if ( step < len( plan ) - 1 ) {
      translate( [ 0, plan[ step ][ 1 ], 0 ] ) {
        moPipelineInner( plan, step + 1, diameter );
      }
    }
  }
}

function vs( a, b ) = [ a[0]*b[0], a[1]*b[1], a[2]*b[2] ];

// Add some kind of nudge system with the 4 leg versions to allow multipe moPipelines
// VUNIT(v);

function moPipelinePointsDesign( v, remaining = [ 1, 1, 1 ] ) =
  ( v[ 0 ] != 0 && remaining[ 0 ] == 1 &&
    ( remaining[ 0 ] * abs( v[ 0 ] ) >= remaining[ 1 ] * abs( v[ 1 ] ) ) &&
    ( remaining[ 0 ] * abs( v[ 0 ] ) >= remaining[ 2 ] * abs( v[ 2 ] ) )  ) ? str( "X", moPipelinePointsDesign( v, [ 0, remaining[ 1 ], remaining[ 2 ] ] ) ) :
  ( ( v[ 1 ] != 0 && remaining[ 1 ] == 1 &&
    ( remaining[ 1 ] * abs( v[ 1 ] ) >= remaining[ 0 ] * abs( v[ 1 ] ) ) &&
    ( remaining[ 1 ] * abs( v[ 1 ] ) >= remaining[ 2 ] * abs( v[ 2 ] ) )  ) ? str( "Y", moPipelinePointsDesign( v, [ remaining[ 0 ], 0, remaining[ 2 ] ] ) ) : (
  ( ( v[ 2 ] != 0 && remaining[ 2 ] == 1 &&
    ( remaining[ 2 ] * abs( v[ 2 ] ) >= remaining[ 0 ] * abs( v[ 0 ] ) ) &&
    ( remaining[ 2 ] * abs( v[ 2 ] ) >= remaining[ 1 ] * abs( v[ 1 ] ) )  ) ? str( "Z", moPipelinePointsDesign( v, [ remaining[ 0 ], remaining[ 1 ], 0 ] ) ) :
  ""
  )));

function moPipelinePointsDesignScale( c, designString, designStep = 0 ) =
    [
       ( c == "X" || c == "x" ) ? 1 : 0,
       ( c == "Y" || c == "y" ) ? 1 : 0,
       ( c == "Z" || c == "z" ) ? 1 : 0
    ] +
    ( ( designStep < len( designString ) - 1 ) ? moPipelinePointsDesignScale( designString[ designStep + 1 ], designString, designStep + 1 ) : [ 0, 0, 0 ] );

module moPipelinePointsInner( v, diameter, designString, designScale, offset, designStep ) {
  dc = designString[ designStep ];
  ds = [
         ( dc == "X" || dc == "x" ) ? 1 / designScale[ 0 ] : 0,
         ( dc == "Y" || dc == "z") ? 1 / designScale[ 1 ] : 0,
         ( dc == "Z" || dc == "z") ? 1 / designScale[ 2 ] : 0,
       ];

  nudge = ( ( ( designStep == 0 ) ? 1 : 0 )  + ( ( designStep ==  len( designString ) - 1 ? -1 : 0  ) ) )  * ( VUNIT( ds ) * offset );

  dv = vs( ds, v );

  translate( 0.5 * ( dv + nudge ) ) {
    rotate( [ ds[ 2 ] != 0 ? 90 : 0, 0, ds[ 0 ] != 0 ? 90 : 0 ] )  // something something
      moShaft( 0, l = VLEN( dv + nudge ), caps = true, d = diameter );
  }
  if ( designStep < len( designString ) - 1 ) {
    translate( dv + nudge )
    moPipelinePointsInner( v, diameter, designString, designScale, offset, designStep + 1 );
  }
}

//
// Examples
//

moPipeline( $name = true );

translate( [ 50, 0, 0 ] )
  moPipelinePoints( $name = true );

// moPipeline
/*
color( [ 1, 1, 1 ] )
  moPipeline( [
              [ [ 0, 0, 0 ], 10 ],
              [ [ -90, 0, 0 ], 5 ],
              [ [ 0, 0, 45 ], 5 ]
            ],
            0.25 );
*/
// moPipelinePoints

at = sin( 360 * $t + 90 );


// moPipelinePoints
module spheres( f, t, r = 0.25 ) {
    color( [ 1, 0.5, 0 ] ) {
    translate( f )
      sphere( r = r );
    translate( t )
      sphere( r = r );
  }
}

p = [ 0, 0, 0 ];
pTo = [ 0 + at * 3, at * -5, at * 5 ];

module pipeLabel( text ) {
  //moFlip()
    moPose( [ 0, 0, 0 ], [ 0, -2, -2] )
      moLabel( text, 0.5, 0.05, [ 1, 1, 1 ], [ 0, 0, 0] );
}

module pipeDemo( design, offset = 0 ) {
  spheres( p, pTo, 0.25 );
  moPipelinePoints( p, pTo, 0.25, design, offset );
    moPose( [ 0, 0, 0 ], [ 0, -2, -2] )
      moLabel( design, 0.5, 0.05, [ 1, 1, 1 ], [ 0, 0, 0] );
}

translate( [ -35, 0, 0 ] ) {
  pXTo = [ 10, 5, 2 ];
  spheres( p, pXTo, 0.25 );
  moPipelinePoints( p, pXTo, 0.25, "", 0 );
    moPose( [ 0, 0, 0 ], [ 0, -2, -2] )
      moLabel( "?", 0.5, 0.05, [ 1, 1, 1 ], [ 0, 0, 0] );
  pXTo2 = [ 5, 10, 2 ];
  spheres( p, pXTo2, 0.25 );
  moPipelinePoints( p, pXTo2, 0.25, "", 0 );
  pXTo3 = [ 5, 2, 10 ];
  spheres( p, pXTo3, 0.25 );
  moPipelinePoints( p, pXTo3, 0.25, "", 0 );
}

translate( [ -15, 40, 0 ] ) {
  pipeDemo( "XYZ" );
}

translate( [ -10, 40, 0 ] ) {
  pipeDemo( "XZY" );
}

translate( [ -5, 40, 0 ] ) {
  pipeDemo( "YXZ" );
}

translate( [ 0, 40, 0 ] ) {
  pipeDemo( "YZX" );
}

translate( [ 5, 40, 0 ] ) {
  pipeDemo( "ZYX" );
}

translate( [ 10, 40, 0 ] ) {
  pipeDemo( "ZXY" );
}

translate( [ -15, 20, 0 ] ) {
  pipeDemo( "XYZX" );
}

translate( [ -10, 20, 0 ] ) {
  pipeDemo( "XZYX" );
}

translate( [ -5, 20, 0 ] ) {
  pipeDemo( "YXZY" );
}

translate( [ 0, 20, 0 ] ) {
  pipeDemo( "YZXY" );
}

translate( [ 5, 20, 0 ] ) {
  pipeDemo( "ZYXZ" );
}

translate( [ 10, 20, 0 ] ) {
  pipeDemo( "ZXYZ" );
}

translate( [ 15, 20, 0 ] ) {
  pipeDemo( "XYZXYZ" );
}

translate( [ 20, 10, 0 ] ) {

  translate( [ 10, 20, 0 ] ) {
    pipeDemo( "ZXYZ" );
  }
  translate( [ 10, 20, 0 ] ) {
    pipeDemo( "ZXYZ" );
  }
  translate( [ 10, 20, 0 ] ) {
    pipeDemo( "ZXYZ" );
  }

  p6From = [ 14, 0, 0 ];
  p6To = p6From + pTo;
  spheres( p6From, p6To, 0.25 );
  moPipelinePoints( p6From, p6To, 0.25, "YXZY", 0.0 );

  p7From = [ 14, 0.0, 0.5 ];
  p7To = p7From + pTo;
  spheres( p7From, p7To, 0.25 );
  moPipelinePoints( p7From, p7To, 0.25, "YXZY", 0.5 );

  p8From = [ 14, 0.0, 1.0 ];
  p8To = p8From + pTo;
  spheres( p8From, p8To, 0.25 );
  moPipelinePoints( p8From, p8To, 0.25, "YXZY", 1 );

  p9From = [ 18, 0, 0 ];
  p9To = p9From + pTo;
  spheres( p9From, p9To, 0.25 );
  moPipelinePoints( p9From, p9To, 0.25,  "ZXYZ", 0.0 );

  p10From = [ 18.5, 0.0, 0 ];
  p10To = p10From + pTo;
  spheres( p10From, p10To, 0.25 );
  moPipelinePoints( p10From, p10To, 0.25, "ZXYZ", -0.5 );

  p11From = [ 19, 0.0, 0 ];
  p11To = p11From + pTo;
  spheres( p11From, p11To, 0.25 );
  moPipelinePoints( p11From, p11To, 0.25, "ZXYZ", -1 );
}

//
