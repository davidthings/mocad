include <../mo/mo.scad>

GridHeatsinkColor = [ 0.3, 0.3, 0.3 ];
GridHeatsinkThickness = 0.06 * in;
GridHeatsinkWidth = 1.5 * in;
GridHeatsinkHeight = 1 * in;
GridHeatsinkDepth = 0.5 * in;
GridHeatsinkCount = 15;
GridHeatsinkRatio = 0.5;

module moGridHeatsink( width = GridHeatsinkWidth, height = GridHeatsinkHeight, depth = GridHeatsinkDepth, color = GridHeatsinkColor, thickness = GridHeatsinkThickness, info = false ) {
  moPitch(-1)
  color( color ) {
    linear_extrude( height = thickness, twist = 0 ) {
      difference() {
        square( [ width, height ], center = true );
      }
    }
    w = width / GridHeatsinkCount * GridHeatsinkRatio;
    h = height / GridHeatsinkCount * GridHeatsinkRatio;
    for (y = [-1 : 2/GridHeatsinkCount : 1]) {
      for ( x = [ -1 : 2/GridHeatsinkCount : 1 ] ) {
        translate([ ( width - w) * x / 2 - w /2 , ( height - h ) * y / 2 - h / 2, -depth ] )
        cube( [ w, h, depth ], center = false);
      }
    }
  }
  if ( info ) {
    moPartOrigin();
    for ( i = [ 0 : 5 ] )
      moMoveTo( moGridHeatsinkPosition( i, width, height, thickness ) )
        moPosition( i );
  }
  if ( $name )
    moPartLabel( parent_module( 1 ) );
}

moGridHeatsinkPositions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 1, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0.5, 0.5, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ -0.5, 0.5, 0 ], [ 0, 0, 1 ], -90 ],
  [ [ 0, 0.5, 0.5 ], [ 1, 0, 0 ], -90 ],
  [ [ 0, 0.5, -0.5 ], [ 1, 0, 0 ], 90 ],
];

function vs( a, b ) = [ a[0]*b[0], a[1]*b[1], a[2]*b[2] ];

function moGridHeatsinkPosition( p = 0, width = GridHeatsinkWidth, height = GridHeatsinkHeight, thickness = GridHeatsinkThickness ) = [
  vs( moGridHeatsinkPositions[ p ][ 0 ], [ width, thickness, height ] ),
  moGridHeatsinkPositions[ p ][ 1 ], 
  moGridHeatsinkPositions[ p ][ 2 ] 
];

moGridHeatsink( 2 * in, 2 * in, 0.25 * in, info = true, $name = true );