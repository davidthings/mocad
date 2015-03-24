include <../mo/mo.scad>

use <actHubHolePattern0_77.scad>

BracketWall  = 0.125 * in;

BeamMountDistance = ( 1.405 - ( 1.32 - 1.0607 ) / 2 ) * in;
BeamMountHoleDistance = 1.0607 * in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BracketWall, 0 ], [ 0, 0, 1 ], 180 ]
];

etcPositions = [
  [ [ -BeamMountHoleDistance/2, 0, BeamMountDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, BeamMountDistance ], [ 0, 0, 1 ], 0 ],
  [ [ BeamMountHoleDistance/2, 0, BeamMountDistance ], [ 0, 0, 1 ], 0 ],
];

PatternHoles = 9;
TotalHoles = PatternHoles + len( etcPositions );

module actFlatBracketA( sp, info = false ) {

  moMoveOriginTo( actFlatBracketAPosition( sp ) ) 
  {
    color( Aluminum )
      import("./stl/actobotics_flat_plate_a.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : TotalHoles - 1 ] ) {
          moMoveTo( actFlatBracketAPosition( [ si, pi ] ) ) {
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

function actFlatBracketAPosition( sipi ) = moCombinePositions( sets[ sipi[ 0 ] ], 
                                                         ( sipi[ 1 ] <  PatternHoles ) ? actHubHolePattern0_77Position( sipi[ 1 ] ) :
                                                                                         etcPositions[ sipi[ 1 ] - PatternHoles ] );

moMoveOriginTo( actFlatBracketAPosition( [ 0, 2 ] ) )
  actFlatBracketA( [ 0, 0 ], info = true, $name = true );
