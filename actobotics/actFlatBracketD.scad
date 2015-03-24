include <../mo/mo.scad>

use <actHubHolePattern0_77.scad>

BracketWall  = 0.09 * in;
BracketDistance  = 1.5*in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BracketWall, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, 0, BracketDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BracketWall, BracketDistance ], [ 0, 0, 1 ], 180 ],
  [ [ 0, 0, 2 * BracketDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BracketWall, 2 * BracketDistance ], [ 0, 0, 1 ], 180 ]
];

PatternHoles = 9;

module actFlatBracketD( sp, info = false ) {

  moMoveOriginTo( actFlatBracketDPosition( sp ) ) 
  {
    color( Aluminum )
      translate( [0, 0, BracketDistance ] ) 
        rotate( [ 0, 90, 0 ] )
          import("./stl/actobotics_flat_plate_d.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : ( si < len(sets) ) ? ( PatternHoles - 1 ) : 1 ] ) {
          moMoveTo( actFlatBracketDPosition( [ si, pi ] ) ) {
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

function actFlatBracketDPosition( sipi ) = moCombinePositions( sets[ sipi[ 0 ] ], actHubHolePattern0_77Position( sipi[ 1 ] ) );

moMoveOriginTo( actFlatBracketDPosition( [ 1, 0 ] ) )
  actFlatBracketD( [ 0, 0 ], info = true, $name = true );
