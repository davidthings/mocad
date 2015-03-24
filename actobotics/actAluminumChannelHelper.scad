include <../mo/mo.scad>

use <actChannelHolePattern.scad>

ChannelWidth = 1.5*in;
ChannelWidth_2 = ChannelWidth / 2;
ChannelWall = 0.09*in;

function sets( s = 0 ) = [
  [ [ 0, 0, s * ChannelWidth_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -ChannelWidth_2, ChannelWidth_2, s * ChannelWidth_2 ], [ 0, 0, 1 ], -90 ],
  [ [ ChannelWidth_2, ChannelWidth_2, s * ChannelWidth_2 ], [ 0, 0, 1 ], 90 ],
  [ [ 0, ChannelWall, s * ChannelWidth_2 ], [ 0, 0, 1 ], 180 ],
  [ [ -ChannelWidth_2+ChannelWall, ChannelWidth_2, s * ChannelWidth_2 ], [ 0, 0, 1 ], 90 ],
  [ [ ChannelWidth_2-ChannelWall, ChannelWidth_2, s * ChannelWidth_2 ], [ 0, 0, 1 ], -90 ],
  [ [ 0, ChannelWidth, s * ChannelWidth_2 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, ChannelWidth_2, ( s + 1 ) * ChannelWidth_2 ], [ 1, 0, 0 ], 90 ],
  [ [ 0, ChannelWidth_2, ( s - 1 ) * ChannelWidth_2 ], [ 1, 0, 0 ], -90 ],
];

SpecialSets = 3;
Sets = 9;
RegularSets = Sets - SpecialSets;
PatternShortHoles = 5;
PatternHoles = 16;
PatternHolesComplete = 27;

extraPositions = [
  actChannelHolePatternPosition( 0 ),
  actChannelHolePatternPosition( 2 ),
  actChannelHolePatternPosition( 6 ),
  actChannelHolePatternPosition( 10 ),
  actChannelHolePatternPosition( 25)
];

module actAluminumChannelHelper( lsp, filename, levels, info = false ) {
  moMoveOriginTo( actAluminumChannelHelperPosition( lsp ) ) {
    color( Aluminum )
      translate( [ -ChannelWidth_2, 0, -ChannelWidth_2 ] )
        import(filename);

    if ( info == true ) {
      for ( li = [ 0 : levels - 1 ] ) {
        for ( si = [ 0 : Sets - 1 ] ) {
          for ( pi = [ 0 : ( (( li == 0 || li == levels - 1  ) && ( si < 3 || si >= RegularSets ) ) ?
                                ( ( si < RegularSets ) ? PatternHolesComplete - 1 : PatternShortHoles - 1 ) :
                                0 ) ] ) {
            moMoveTo( actAluminumChannelHelperPosition( [ li, si, pi ] ) )
              moPosition3( [ li, si, pi ] );
          }
        }
      }
    }
  }
  if ( info == true )
    moPartOrigin();
  if ( $name == true )
    moPartLabel( parent_module(2) );
}

function actAluminumChannelHelperPosition( sp ) = moCombinePositions(
    sets( sp[0] )[ sp[ 1 ] ],
    ( sp[ 1 ] < RegularSets ) ?
       actChannelHolePatternPosition( sp[ 2 ] ) :
       extraPositions[ sp[ 2 ] ]
  );

moMoveOriginTo( actAluminumChannelHelperPosition( [ 0, 0, 0 ] ) ) {
  actAluminumChannelHelper( [ 0, 0, 0 ], "./stl/actobotics_1.5_aluminum_channel.stl", 1, info = true, $name = true );
}
