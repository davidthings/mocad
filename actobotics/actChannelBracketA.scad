include <../mo/mo.scad>

use <actChannelHolePattern.scad>

BracketWall  = 0.09*in;
BracketCenterHoleDistance = 1.5*in;
BracketCenterHoleDistance_2 = BracketCenterHoleDistance/2;

sets = [
  [ [ 0, 0, 0 ], [ 0, 1, 0 ], 0 ],
  [ [ 0, BracketWall, 0 ], [ 0, 0, 1 ], 180 ],

  moCombinePositions( [ [ BracketCenterHoleDistance_2, 1 * BracketCenterHoleDistance_2, 0 ], [ 0, 0, 1 ], 90 ], [ [ 0, 0, 0 ], [0, 1, 0], 90] ),
  moCombinePositions( [ [ -BracketCenterHoleDistance_2, 1 * BracketCenterHoleDistance_2, 0 ], [ 0, 0, 1 ], -90 ], [ [ 0, 0, 0 ], [0, 1, 0], 90] ),
  moCombinePositions( [ [ BracketCenterHoleDistance_2- BracketWall, 1 * BracketCenterHoleDistance_2, 0 ], [ 0, 0, 1 ], -90 ], [ [ 0, 0, 0 ], [0, 1, 0], 90] ),
  moCombinePositions( [ [ -BracketCenterHoleDistance_2+ BracketWall, 1 * BracketCenterHoleDistance_2, 0 ], [ 0, 0, 1 ], 90 ], [ [ 0, 0, 0 ], [0, 1, 0], 90] ),
  
  // Tessellation Hole Count
  moCombinePositions( [ [ BracketCenterHoleDistance_2, 2 * BracketCenterHoleDistance_2, 0 ], [ 0, 0, 1 ], 90 ], [ [ 0, 0, 0 ], [0, 1, 0], 90] ),
  moCombinePositions( [ [ -BracketCenterHoleDistance_2, 2 * BracketCenterHoleDistance_2, 0 ], [ 0, 0, 1 ], -90 ], [ [ 0, 0, 0 ], [0, 1, 0], 90] ),
  moCombinePositions( [ [ BracketCenterHoleDistance_2- BracketWall, 2 * BracketCenterHoleDistance_2, 0 ], [ 0, 0, 1 ], -90 ], [ [ 0, 0, 0 ], [0, 1, 0], 90] ),
  moCombinePositions( [ [ -BracketCenterHoleDistance_2+ BracketWall, 2 * BracketCenterHoleDistance_2, 0 ], [ 0, 0, 1 ], 90 ], [ [ 0, 0, 0 ], [0, 1, 0], 90] ),

  // Tessellation Hole Count
  moCombinePositions( [ [ BracketCenterHoleDistance_2, 3 * BracketCenterHoleDistance_2, 0 ], [ 0, 0, 1 ], 90 ], [ [ 0, 0, 0 ], [0, 1, 0], 90] ),
  moCombinePositions( [ [ -BracketCenterHoleDistance_2, 3 * BracketCenterHoleDistance_2, 0 ], [ 0, 0, 1 ], -90 ], [ [ 0, 0, 0 ], [0, 1, 0], 90] ),
  moCombinePositions( [ [ BracketCenterHoleDistance_2- BracketWall, 3 * BracketCenterHoleDistance_2, 0 ], [ 0, 0, 1 ], -90 ], [ [ 0, 0, 0 ], [0, 1, 0], 90] ),
  moCombinePositions( [ [ -BracketCenterHoleDistance_2+ BracketWall, 3 * BracketCenterHoleDistance_2, 0 ], [ 0, 0, 1 ], 90 ], [ [ 0, 0, 0 ], [0, 1, 0], 90] ),
];

SetTessellation = 6; 
PatternHoles = 27;
PatternTessellationHoles = 16;

module actChannelBracketA( sp, info = false ) {
  moMoveOriginTo( actChannelBracketAPosition( sp ) ) 
  {
    color( Aluminum )
      translate( [ 0, BracketWall, 0 ] )
        moFlip()
          import("./stl/actobotics_channel_bracket_a.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : (si < SetTessellation ) ? ( PatternHoles - 1 ) : ( PatternTessellationHoles - 1 ) ] ) {           
          moMoveTo( actChannelBracketAPosition( [ si, pi ] ) ) {
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

function actChannelBracketAPosition( sipi ) = moCombinePositions( sets[ sipi[ 0 ] ], actChannelHolePatternPosition( sipi[ 1 ] ) );

moMoveOriginTo( actChannelBracketAPosition( [ 1, 0 ] ) )
  actChannelBracketA( [ 0, 0 ], info = true, $name = true );
