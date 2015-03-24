include <../mo/mo.scad>

use <actChannelHolePattern.scad>

ChannelWidth = 1.5*in;
ChannelWall = 0.09*in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, ChannelWall, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ -ChannelWidth/2, ChannelWidth/2, 0 ], [ 0, 0, 1 ], -90 ],
  [ [ -ChannelWidth/2+ChannelWall, ChannelWidth/2, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ ChannelWidth/2, ChannelWidth/2, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ ChannelWidth/2-ChannelWall, ChannelWidth/2, 0 ], [ 0, 0, 1 ], -90 ],

  [ [ 0, ChannelWidth, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, ChannelWidth/2, ChannelWidth/2 ], [ 1, 0, 0 ], 90 ],
  [ [ 0, ChannelWidth/2, -ChannelWidth/2 ], [ 1, 0, 0 ], -90 ],
];

SpecialSets = 3;

extraPositions = [ 
  actChannelHolePatternPosition( 0 ),
  actChannelHolePatternPosition( 2 ),
  actChannelHolePatternPosition( 6 ),
  actChannelHolePatternPosition( 10 ),
  actChannelHolePatternPosition( 25)
];

PatternHoles = 27;
PatternShortHoles = 5;

module actAluminumChannel1_5( sp, info = false ) {

  moMoveOriginTo( actAluminumChannel1_5Position( sp ) )
  {
    color( Aluminum )
      translate( [ -ChannelWidth/2, 0, -ChannelWidth/2 ] )
        import("./stl/actobotics_1.5_aluminum_channel.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : ( si < len( sets ) - SpecialSets ) ? PatternHoles - 1 : PatternShortHoles - 1 ] ) {           
          moMoveTo( actAluminumChannel1_5Position( [ si, pi ]) ) {
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

function actAluminumChannel1_5Position( sipi ) = moCombinePositions( 
    sets[ sipi[ 0 ] ], 
    ( sipi[ 0 ] < len( sets ) - SpecialSets ) ?
       actChannelHolePatternPosition( sipi[ 1 ] ) :
       extraPositions[ sipi[ 1 ] ]
  );

actAluminumChannel1_5( [0,0], info = true, $name = true );


