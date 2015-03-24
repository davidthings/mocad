include <../mo/mo.scad>

BeamHoleDistance = 1.54 * in / 4;
BeamDepth = 0.25 * in;

HoleSets = 9;
HolesPerSet = 2;

module actAluminumBeam3_08( sp, info = false ) {

  moMoveOriginTo( actAluminumBeam3_08Position( sp ) )
  {
    color( Aluminum )
      rotate( [ 0, -90, 0 ] )
        translate( [ BeamHoleDistance * 4, 0, 0 ] )
          import("./stl/actobotics_aluminum_beam_3_08.stl");

    if ( info == true ) {
      for ( si = [ 0 : HoleSets - 1 ] ) {
        for ( hi = [ 0 : HolesPerSet - 1 ] ) {
          moMoveTo( actAluminumBeam3_08Position( [ si, hi ]) ) {
            moPosition2( [ si, hi ] );
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

function actAluminumBeam3_08Position( sp ) = [ 
  [ 0, ( sp[ 1 ] == 0 ) ? 0 : BeamDepth, sp[0] * BeamHoleDistance ], 
  [ 0, 0, 1 ], 
  ( sp[ 1 ] == 0 ) ? 0 : 180 ];

moMoveOriginTo( actAluminumBeam3_08Position( [ 4, 0 ] ) )
  actAluminumBeam3_08( [0,0], info = true, $name = true );
