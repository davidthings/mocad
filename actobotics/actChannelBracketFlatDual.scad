include <../mo/mo.scad>

use <actChannelHolePattern.scad>

BracketWall  = 0.09*in;
BracketCenterHoleDistance = 1.5*in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 1, 0 ], 0 ],
  [ [ 0, BracketWall, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ BracketCenterHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ BracketCenterHoleDistance, BracketWall, 0 ], [ 0, 0, 1 ], 180 ]
];

PatternHoles = 27;

module actChannelBracketFlatDual( sp, info = false ) {
  moMoveOriginTo( actChannelBracketFlatDualPosition( sp ) ) 
  {
    color( Steel )
        translate( [ BracketCenterHoleDistance/2, 0, 0 ] )
          import("./stl/actobotics_flat_dual_channel_bracket.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : PatternHoles - 1 ] ) {           
          moMoveTo( actChannelBracketFlatDualPosition( [ si, pi ] ) ) {
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

function actChannelBracketFlatDualPosition( sipi ) = moCombinePositions( sets[ sipi[ 0 ] ], actChannelHolePatternPosition( sipi[ 1 ] ) );

moMoveOriginTo( actChannelBracketFlatDualPosition( [ 0, 1 ] ) )
  actChannelBracketFlatDual( [ 0, 0 ], info = true, $name = true );

