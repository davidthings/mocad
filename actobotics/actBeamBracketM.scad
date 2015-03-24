include <../mo/mo.scad>

use <actHubHolePattern0_77.scad>

BracketWall  = 0.125 * in;
BeamMountDistance = 1.50 * in / 2;
BeamHoleDistance = 1.54 * in / 4;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BracketWall, 0 ], [ 0, 0, 1 ], 180 ]
];

etcPositions = [
  [ [ -BeamHoleDistance, 0, BeamMountDistance ], [ 0, 0, 1 ], 0 ],
  [ [ 0, 0, BeamMountDistance ], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance, 0, BeamMountDistance ], [ 0, 0, 1 ], 0 ],
];

PatternHoles = 9;
TotalHoles = PatternHoles + len( etcPositions );

module actBeamBracketM( sp, info = false ) {

  moMoveOriginTo( actBeamBracketMPosition( sp ) ) 
  {
    color( BlackDelrin )
      import("./stl/actobotics_beam_bracket_m.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) - 1 ] ) {
        for ( pi = [ 0 : TotalHoles - 1 ] ) {
          moMoveTo( actBeamBracketMPosition( [ si, pi ] ) ) {
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


function actBeamBracketMPosition( sipi ) = moCombinePositions( sets[ sipi[ 0 ] ], 
                                                         ( sipi[ 1 ] <  PatternHoles ) ? actHubHolePattern0_77Position( sipi[ 1 ] ) :
                                                                                         etcPositions[ sipi[ 1 ] - PatternHoles ] );

moMoveOriginTo( actBeamBracketMPosition( [ 0, 2 ] ) )
  actBeamBracketM( [ 0, 0 ], info = true, $name = true );

