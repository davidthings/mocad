include <../mo/mo.scad>

use <actChannelHolePattern.scad>

// Bit guess-worky here
ChannelWidthAdjust = 1.317*in;
ChannelWidthAdjust45 = ChannelWidthAdjust * sin( 45 );
ChannelWidthAdjust45_2 = ChannelWidthAdjust45/2;

ChannelWidth = 1.5*in;
ChannelWidth45 = ChannelWidth * sin( 45 );
ChannelWidth45_2 = ChannelWidth45/2;

ChannelWall = 0.09*in;
ChannelWall45 = ChannelWall * sin( 45 );

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, ChannelWall, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -ChannelWidthAdjust, ChannelWidth45_2, 0 ], [ 0, 0, 1 ], -45 ],
  [ [ -ChannelWidthAdjust + ChannelWall45, ChannelWidth45_2 + ChannelWall45, 0 ], [ 0, 0, 1 ], 135 ],

  [ [ ChannelWidthAdjust, ChannelWidth45_2, 0 ], [ 0, 0, 1 ], 45 ],
  [ [ ChannelWidthAdjust - ChannelWall45, ChannelWidth45_2 + ChannelWall45, 0 ], [ 0, 0, 1 ], -135 ],
];

PatternHoles = 27;

module actChannelBracket45AngleDual( sp, info = false ) {

  moMoveOriginTo( actChannelBracket45AngleDualPosition( sp ) )
  {
    color( Aluminum )
      translate( [ 0, 0, -ChannelWidth/2 ] )
        rotate( [ 90,0,0 ] )
        import("./stl/actobotics_45_degree_dual_angle_channel_bracket.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : PatternHoles - 1 ] ) {
          moMoveTo( actChannelBracket45AngleDualPosition( [ si, pi ]) ) {
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

function actChannelBracket45AngleDualPosition( sp ) = moCombinePositions( sets[ sp[0] ], actChannelHolePatternPosition( sp[ 1 ] ) );

moMoveOriginTo( actChannelBracket45AngleDualPosition( [ 1,0 ] ) )
  actChannelBracket45AngleDual( [0,0], info = true, $name = true );


