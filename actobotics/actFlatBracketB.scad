include <../mo/mo.scad>

use <actHubHolePattern0_77.scad>

BracketWall  = 0.09 * in;
BracketDistance  = 1.5*in;
BracketHoleDistance  = 1.0607*in;
BracketHoleDistance_2  = BracketHoleDistance/2;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BracketWall, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ 0, 0, BracketDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BracketWall, BracketDistance ], [ 0, 0, 1 ], 180 ]
];

etcPositions = [
  [ [ BracketHoleDistance_2, 0, 0  ], [ 0, 0, 1 ], 0 ],
  [ [ BracketHoleDistance_2, 0, -BracketHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, -BracketHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -BracketHoleDistance_2, 0, -BracketHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ -BracketHoleDistance_2, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ -BracketHoleDistance_2, 0, BracketHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, BracketHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ BracketHoleDistance_2, 0, BracketHoleDistance_2 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, -BracketDistance/2 ], [ 0, 0, 1 ], 0 ],
];

PatternHoles = 9;

module actFlatBracketB( sp, info = false ) {

  moMoveOriginTo( actFlatBracketBPosition( sp ) ) 
  {
    color( Aluminum )
        import("./stl/actobotics_flat_plate_b.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : ( si > 1 ) ? ( PatternHoles + len( etcPositions ) -1  ) : PatternHoles - 1 ] ) {
          moMoveTo( actFlatBracketBPosition( [ si, pi ] ) ) {
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

function actFlatBracketBPosition( sipi ) = 
    ( sipi[ 0 ] < len( sets ) ) ? moCombinePositions( sets[ sipi[ 0 ] ], ( sipi[ 1 ] < PatternHoles ) ? actHubHolePattern0_77Position( sipi[ 1 ] ) : etcPositions[ sipi[ 1 ] - PatternHoles ] ):
                              etcPositions[ sipi[ 1 ] ] ;

moMoveOriginTo( actFlatBracketBPosition( [ 0, 2 ] ) )
  actFlatBracketB( [ 0, 0 ], info = true, $name = true );
