include <../mo/mo.scad>

use <actHubHolePattern0_77.scad>

BracketWall  = 0.09 * in;
BracketDistance  = 1.5*in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BracketWall, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, 0, BracketDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BracketWall, BracketDistance ], [ 0, 0, 1 ], 180 ]
];

etcPositions = [
  [ [ 0, 0, BracketDistance/2 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BracketWall, BracketDistance/2 ], [ 0, 0, 1 ], 180 ],
];

PatternHoles = 9;

module actFlatBracketC( sp, info = false ) {

  moMoveOriginTo( actFlatBracketCPosition( sp ) ) 
  {
    color( Aluminum )
      translate( [0, 0, BracketDistance/2] ) 
        import("./stl/actobotics_flat_plate_c.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) ] ) {
        for ( pi = [ 0 : ( si < len(sets) ) ? ( PatternHoles - 1 ) : 1 ] ) {
          moMoveTo( actFlatBracketCPosition( [ si, pi ] ) ) {
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

function actFlatBracketCPosition( sipi ) = 
    ( sipi[ 0 ] < len( sets ) ) ? moCombinePositions( sets[ sipi[ 0 ] ], actHubHolePattern0_77Position( sipi[ 1 ] ) ):
                              etcPositions[ sipi[ 1 ] ] ;

moMoveOriginTo( actFlatBracketCPosition( [ 0, 2 ] ) )
  actFlatBracketC( [ 0, 0 ], info = true, $name = true );
