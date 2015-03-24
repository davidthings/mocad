include <../mo/mo.scad>

use <actChannelHolePattern.scad>

BracketWall  = 0.09*in;
BracketCenterHoleDistance = 1.5*in;
ShortBracketOffset = BracketCenterHoleDistance/2 + BracketWall;  // Crazy!  Not specified on drawing!

S45 = sin( 45 );

sets = [
  [ [ 0, 0, 0 ], [ 0, 1, 0 ], 0 ],
  [ [ 0, BracketWall, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, ShortBracketOffset, BracketCenterHoleDistance/2 ], [ 1, 0, 0 ], -90 ],
  [ [ 0, ShortBracketOffset, BracketCenterHoleDistance/2 - BracketWall ], [ 0, S45, S45 ], 180 ]
];

extraPositions = [
  actChannelHolePatternPosition( 13 ),
  actChannelHolePatternPosition( 4 ),
  actChannelHolePatternPosition( 5 ),
  actChannelHolePatternPosition( 6 ),
  actChannelHolePatternPosition( 7 ),
  actChannelHolePatternPosition( 8 ),
  actChannelHolePatternPosition( 9 ),
  actChannelHolePatternPosition( 14 ),
  actChannelHolePatternPosition( 1 ),
  actChannelHolePatternPosition( 12 ),
  actChannelHolePatternPosition( 3 ),
];

PatternHoles = 27;
PatternShortHoles = 11;

module actChannelBracket90AngleShort( sp, info = false ) {
  moMoveOriginTo( actChannelBracket90AngleShortPosition( sp ) )
  {
    color( Aluminum )
          import("./stl/actobotics_90_degree_single_angle_short_channel_bracket.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : ( si < len( sets ) - 2 ) ? PatternHoles - 1 : PatternShortHoles - 1 ] ) {
          moMoveTo( actChannelBracket90AngleShortPosition( [ si, pi ] ) ) {
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

function actChannelBracket90AngleShortPosition( sipi ) = moCombinePositions( 
    sets[ sipi[ 0 ] ],
    ( sipi[ 0 ] < len( sets ) - 2 ) ?
       actChannelHolePatternPosition( sipi[ 1 ] ) :
       extraPositions[ sipi[ 1 ] ]
  );

moMoveOriginTo( actChannelBracket90AngleShortPosition( [ 1, 0 ] ) )
  actChannelBracket90AngleShort( [ 0, 0 ], info = true, $name = true );
