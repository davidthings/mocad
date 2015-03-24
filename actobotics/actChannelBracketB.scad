include <../mo/mo.scad>

use <actChannelHolePattern.scad>

// From CAD diagram - https://www.servocity.com/html/channel_bracket_b__585482_.html
ChannelArmOffsetY = 2.25 * in;
ChannelArmOffsetZ = 1.849 * in;

ChannelWidth = 1.5*in;
ChannelWidth_2 = ChannelWidth / 2;;
ChannelWidth45 = ChannelWidth * sin( 45 );
ChannelWidth45_2 = ChannelWidth45/2;

ChannelWall = 0.09*in;
ChannelWall45 = ChannelWall * sin( 45 );

sets = [
// Pattern Holes Complete
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, ChannelWall, 0 ], [ 0, 0, 1 ], 180 ],

// Pattern Hole Subsets
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], -90 ], [ [ -ChannelArmOffsetY + 4 * ChannelWidth45_2, -ChannelWidth_2, ChannelArmOffsetZ - 4 * ChannelWidth45_2 ], [ 0, 1, 0 ], 135 ]  ),
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], 90 ], [ [ ChannelArmOffsetY - 4 * ChannelWidth45_2, -ChannelWidth_2, ChannelArmOffsetZ - 4 * ChannelWidth45_2 ], [ 0, 1, 0 ], -135 ]  ),
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], -90 ], [ [ -ChannelArmOffsetY + 4 * ChannelWidth45_2, ChannelWidth_2-ChannelWall, ChannelArmOffsetZ - 4 * ChannelWidth45_2 ], [ 0, 1, 0 ], 135 ]  ),
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], 90 ], [ [ ChannelArmOffsetY - 4 * ChannelWidth45_2, ChannelWidth_2-ChannelWall, ChannelArmOffsetZ - 4 * ChannelWidth45_2 ], [ 0, 1, 0 ], -135 ]  ),

// PatternNearlyComplete
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], -90 ], [ [ -ChannelArmOffsetY + 3 * ChannelWidth45_2, -ChannelWidth_2, ChannelArmOffsetZ - 3 * ChannelWidth45_2 ], [ 0, 1, 0 ], 135 ]  ),
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], 90 ], [ [ ChannelArmOffsetY - 3 * ChannelWidth45_2, -ChannelWidth_2, ChannelArmOffsetZ - 3 * ChannelWidth45_2 ], [ 0, 1, 0 ], -135 ]  ),
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], -90 ], [ [ -ChannelArmOffsetY + 3 * ChannelWidth45_2, ChannelWidth_2-ChannelWall, ChannelArmOffsetZ - 3 * ChannelWidth45_2 ], [ 0, 1, 0 ], 135 ]  ),
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], 90 ], [ [ ChannelArmOffsetY - 3 * ChannelWidth45_2, ChannelWidth_2-ChannelWall, ChannelArmOffsetZ - 3 * ChannelWidth45_2 ], [ 0, 1, 0 ], -135 ]  ),

// Tessellation Sets (PatternHoles)
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], -90 ], [ [ -ChannelArmOffsetY + 2 * ChannelWidth45_2, -ChannelWidth_2, ChannelArmOffsetZ - 2 * ChannelWidth45_2 ], [ 0, 1, 0 ], 135 ]  ),
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], 90 ], [ [ ChannelArmOffsetY - 2 * ChannelWidth45_2, -ChannelWidth_2, ChannelArmOffsetZ - 2 * ChannelWidth45_2 ], [ 0, 1, 0 ], -135 ]  ),
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], -90 ], [ [ -ChannelArmOffsetY + 2 * ChannelWidth45_2, ChannelWidth_2-ChannelWall, ChannelArmOffsetZ - 2 * ChannelWidth45_2 ], [ 0, 1, 0 ], 135 ]  ),
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], 90 ], [ [ ChannelArmOffsetY - 2 * ChannelWidth45_2, ChannelWidth_2-ChannelWall, ChannelArmOffsetZ - 2 * ChannelWidth45_2 ], [ 0, 1, 0 ], -135 ]  ),

  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], -90 ], [ [ -ChannelArmOffsetY + 1 * ChannelWidth45_2, -ChannelWidth_2, ChannelArmOffsetZ - 1 * ChannelWidth45_2 ], [ 0, 1, 0 ], 135 ]  ),
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], 90 ], [ [ ChannelArmOffsetY - 1 * ChannelWidth45_2, -ChannelWidth_2, ChannelArmOffsetZ - 1 * ChannelWidth45_2 ], [ 0, 1, 0 ], -135 ]  ),
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], -90 ], [ [ -ChannelArmOffsetY + 1 * ChannelWidth45_2, ChannelWidth_2-ChannelWall, ChannelArmOffsetZ - 1 * ChannelWidth45_2 ], [ 0, 1, 0 ], 135 ]  ),
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], 90 ], [ [ ChannelArmOffsetY - 1 * ChannelWidth45_2, ChannelWidth_2-ChannelWall, ChannelArmOffsetZ - 1 * ChannelWidth45_2 ], [ 0, 1, 0 ], -135 ]  ),

  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], -90 ], [ [ -ChannelArmOffsetY + 0 * ChannelWidth45_2, -ChannelWidth_2, ChannelArmOffsetZ - 0 * ChannelWidth45_2 ], [ 0, 1, 0 ], 135 ]  ),
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], 90 ], [ [ ChannelArmOffsetY - 0 * ChannelWidth45_2, -ChannelWidth_2, ChannelArmOffsetZ - 0 * ChannelWidth45_2 ], [ 0, 1, 0 ], -135 ]  ),
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], -90 ], [ [ -ChannelArmOffsetY + 0 * ChannelWidth45_2, ChannelWidth_2-ChannelWall, ChannelArmOffsetZ - 0 * ChannelWidth45_2 ], [ 0, 1, 0 ], 135 ]  ),
  moCombinePositions( [ [ 0, 0, 0 ],[ 0, 0, 1 ], 90 ], [ [ ChannelArmOffsetY - 0 * ChannelWidth45_2, ChannelWidth_2-ChannelWall, ChannelArmOffsetZ - 0 * ChannelWidth45_2 ], [ 0, 1, 0 ], -135 ]  ),
];

PatternHoleSubsets = [
  [
    actChannelHolePatternPosition( 12 ),
    actChannelHolePatternPosition( 3 ),
    actChannelHolePatternPosition( 11 ),
  ],
  [
    actChannelHolePatternPosition( 14 ),
    actChannelHolePatternPosition( 9 ),
    actChannelHolePatternPosition( 15 ),
  ]
];

SetsPatternHoleSubSets = 2;
SetsPatternHoleNearlyComplete = 6;
SetsPatternHoleTessellation = 10;

PatternHolesSubset = 3;
PatternHolesTessellation = 16;
PatternHolesNearlyComplete = 22;
PatternHolesComplete = 27;

module actChannelBracketB( sp, info = false ) {

  moMoveOriginTo( actChannelBracketBPosition( sp ) )
  {
    color( Aluminum )
      translate( [ 0, ChannelWall,0 ] )
        rotate( [ 180,0,0 ] )
          import("./stl/actobotics_channel_bracket_b.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : ( si < SetsPatternHoleSubSets ) ? ( PatternHolesComplete  - 1 ) :
                                                 ( si < SetsPatternHoleNearlyComplete ) ? PatternHolesSubset - 1 : ( si < SetsPatternHoleTessellation ) ? ( PatternHolesNearlyComplete - 1 ) :
                                                                                                                                                              ( PatternHolesTessellation - 1 )  ] ) {
          
            moMoveTo( actChannelBracketBPosition( [ si, pi ]) ) {
            moPosition2( [ si, pi ] );
          }
        }
      }
    }
  }
  if ( info == true )
    moPartOrigin();
  if ( $name == true )
    moPartLabel( parent_module(1) );
}

function actChannelBracketBPosition( sp ) = moCombinePositions( sets[ sp[0] ], ( ( sp[ 0 ] < SetsPatternHoleSubSets ) || ( sp[ 0 ] >= SetsPatternHoleNearlyComplete ) ) ? actChannelHolePatternPosition( sp[ 1 ] ) :
                                                                                                                                                                          PatternHoleSubsets[ sp[ 0 ] % 2 ][ sp[ 1 ] ] );

moMoveOriginTo( actChannelBracketBPosition( [ 0,2 ] ) )
  actChannelBracketB( [0,0], info = true, $name = true );
