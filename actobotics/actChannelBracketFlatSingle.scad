include <../mo/mo.scad>

use <actChannelHolePattern.scad>

BracketWall  = 0.09*in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BracketWall, 0 ], [ 0, 0, 1 ], 180 ]
];

PatternHoles = 27;

module actChannelBracketFlatSingle( sp, info = false ) {

  moMoveOriginTo( actChannelBracketFlatSinglePosition( sp ) ) 
  {
    color( Steel )
      import("./stl/actobotics_flat_single_channel_bracket.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : PatternHoles - 1 ] ) {         
          moMoveTo( actChannelBracketFlatSinglePosition( [ si, pi ] ) ) {
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

function actChannelBracketFlatSinglePosition( sipi ) = moCombinePositions( sets[ sipi[ 0 ] ], actChannelHolePatternPosition( sipi[ 1 ] ) );

moMoveOriginTo( actChannelBracketFlatSinglePosition( [ 1, 0 ] ) )
  actChannelBracketFlatSingle( [ 0, 0 ], info = true, $name = true );
