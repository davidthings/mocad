include <../mo/mo.scad>

PCBColor = [ 0, 0.3, 0 ];
PCBThickness = 0.06 * in;
PCBWidth = 1.5 * in;
PCBHeight = 1 * in;
PCBSpacing = 0.1 * in;
PCBMoldingLength = 0.45 * in;

module moPCB( width = PCBWidth, height = PCBHeight, color = PCBColor, thickness = PCBThickness, info = false ) {
  moPitch(-1)
  color( color ) {
    linear_extrude( height = thickness, twist = 0 ) {
      difference() {
        square( [ width, height ], center = true );
        children();
      }
    }
  }
  if ( info ) {
    moPartOrigin();
    for ( i = [ 0 : 5 ] )
      moMoveTo( moPCBPosition( i, width, height, thickness ) )
        moPosition( i );
  }
  if ( $name )
    moPartLabel( parent_module( 1 ) );
}

moPCBPositions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 1, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0.5, 0.5, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ -0.5, 0.5, 0 ], [ 0, 0, 1 ], -90 ],
  [ [ 0, 0.5, 0.5 ], [ 1, 0, 0 ], -90 ],
  [ [ 0, 0.5, -0.5 ], [ 1, 0, 0 ], 90 ],
];

function vs( a, b ) = [ a[0]*b[0], a[1]*b[1], a[2]*b[2] ];

function moPCBPosition( p = 0, width = PCBWidth, height = PCBHeight, thickness = PCBThickness ) = [
  vs( moPCBPositions[ p ][ 0 ], [ width, thickness, height ] ),
  moPCBPositions[ p ][ 1 ], 
  moPCBPositions[ p ][ 2 ] 
];

module moPCBSIPMolding( x = 10, spacing = PCBSpacing, length = PCBMoldingLength, thickness = PCBSpacing/2, info = false ) {
  shift = length / 2;
  color( Black )
    translate( [ 0, length/2, 0 ] )
      cube( [ x * spacing, length, thickness ], center = true );
  if ( info ) {
    moPartOrigin();
    for ( i = [ 0 : 5 ] )
      moMoveTo( moPCBSIPMoldingPosition( i, x, spacing, length, thickness ) )
        moPosition( i );
  }
  if ( $name )
    moPartLabel( parent_module( 1 ) );
}

function moPCBSIPMoldingPosition( p = 0, x = 10, spacing = PCBSpacing, length = PCBMoldingLength, thickness = PCBSpacing / 2 ) = 
[
  vs( moPCBPositions[ p ][ 0 ], [ x * spacing, length, thickness ] ),
  moPCBPositions[ p ][ 1 ], 
  moPCBPositions[ p ][ 2 ] 
];

module moPCBPins( x = 10, spacing = 0.1 * in, diameter = 0.02 * in, length = 0.3 * in, ascent = 0.025 * in, info = false, center = true ) {
  shift = length / 2 - ascent;
  moPitch() {
    for ( xi = [ 0 : x - 1 ] ) {      
      translate( [ ( xi - (( center ) ? x / 2 - 0.5 : 0 ) ) * spacing, 0, 0  ] ) {
        translate( [ 0, 0, -shift ] ) {
          color( Copper )
            moYaw( 0.5 )
              cylinder( h = length, d = diameter, center = true, $fn = 4 );        
        }
      if ( info )
        moPitch( - 1 ) moPosition( xi );
      }
    }
  }
  if ( info )
    moPartOrigin();
  if ( $name )
    moPartLabel( parent_module( 1 ) );
}

function moPCBPinsPosition( x, xSize = 10, spacing = 0.1, center = true ) = [ ( x - (( center ) ? x / 2 - 0.5 : 0 ) ) * spacing, 0 ];

module moPCBHoles( x = 10, spacing = 0.1 * in, drill = 0.02 * in, info = false, center = true ) {
  for ( xi = [ 0 : x - 1 ] ) {      
    translate( [ ( xi - (( center ) ? x / 2 - 0.5 : 0 ) ) * spacing, 0 ] ) {
      circle( d = drill, center = true );        
      if ( info )
        moPitch( - 1 ) moPosition( xi );
    }
  }
  if ( info )
    moPartOrigin();
  if ( $name )
    moPartLabel( parent_module( 1 ) );
}

function moPCBHolesPosition( x, xSize = 10, spacing = 0.1, center = true ) = [ ( x - (( center ) ? x / 2 - 0.5 : 0 ) ) * spacing, 0 ];


module moPCBHoleGrid( x = 10, y = 10, spacing = 0.1 * in, drill = 0.02 * in, info = false, center = true ) {
  c = ( center ) ? [ x / 2 - 0.5, y / 2 - 0.5] : [ 0, 0 ];
  for ( yi = [ 0 : y - 1 ] ) {
    for ( xi = [ 0 : x - 1 ] ) {      
      translate( [ ( xi - c[ 0 ] ) * spacing, ( yi - c[ 1 ] ) * spacing  ], 0 ) {
        circle( d = drill, center = true );        
        if ( info )
          moPitch( - 1 ) moPosition2( [ xi, yi ] );
      }
    }
  }
  if ( info )
    moPartOrigin();
  if ( $name )
    moPartLabel( parent_module( 1 ) );
}

function moPCBHoleGrid( x, xSize = 10, ySize = 10, spacing = 0.1, center = true ) = 
  [ ( x - (( center ) ? x / 2 - 0.5 : 0 ) ) * spacing, ( y - (( center ) ? y / 2 - 0.5 : 0 ) ) * spacing ];


//moMoveOriginTo( moGridPosition( [ 2, 2, ] ) )

translate( [ -6 * in, 0, 0 ] ) {
  moPCB( 1.5 * in, 1 * in, info = true, $name = true )
    moPCBHoles( 10, 0.1 * in, 0.04 * in );
  moPCBPins( 10, 0.1 * in, length = 0.6 * in );
  moMoveTo( moPCBPosition( 1  ) )
    moFlip()
      moPCBSIPMolding( 10, length = 0.44 * in );
}
translate( [ -4 * in, 0, 0 ] )
   moPCBSIPMolding( 10, 0.1 * in, 0.5 * in, 0.05 * in, info = true, $name = true );
translate( [ -2 * in, 0, 0 ] )
   moPCBPins( 10, 0.1 * in, 0.02 * in, info = true, $name = true );
translate( [ 0 * in, 0, 0 ] )
  moPCBHoles( 10, info = true, $name = true );
translate( [ 2 * in, 0, 0 ] )
moPCBHoleGrid( 10, 10, info = true, $name = true );



