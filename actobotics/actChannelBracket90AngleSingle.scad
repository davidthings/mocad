include <../mo/mo.scad>

use <actChannelHolePattern.scad>

BracketWall  = 0.09*in;
BracketCenterHoleDistance = 1.5*in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 1, 0 ], 0 ],
  [ [ 0, BracketWall, 0 ], [ 0, 0, 1 ], 180 ],
  moCombinePositions( [ [ 0, BracketCenterHoleDistance/2, BracketCenterHoleDistance/2 ], [ 1, 0, 0 ], -90 ], [[ 0, 0, 0 ], [0, 1, 0], 90] ),
  moCombinePositions( [ [ 0, BracketCenterHoleDistance/2, BracketCenterHoleDistance/2 - BracketWall ], [ 1, 0, 0 ], 90 ], [[ 0, 0, 0 ], [0, 1, 0], 90] ),
];

PatternHoles = 27;

module actChannelBracket90AngleSingle( sp, info = false ) {
  moMoveOriginTo( actChannelBracket90AngleSinglePosition( sp ) ) 
  {
    color( Aluminum )
          import("./stl/actobotics_90_degree_single_angle_channel_bracket.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : PatternHoles - 1 ] ) {           
          moMoveTo( actChannelBracket90AngleSinglePosition( [ si, pi ] ) ) {
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

function actChannelBracket90AngleSinglePosition( sipi ) = moCombinePositions( sets[ sipi[ 0 ] ], actChannelHolePatternPosition( sipi[ 1 ] ) );

moMoveOriginTo( actChannelBracket90AngleSinglePosition( [ 1, 0 ] ) )
  actChannelBracket90AngleSingle( [ 0, 0 ], info = true, $name = true );
