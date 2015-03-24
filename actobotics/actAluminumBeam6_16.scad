include <../mo/mo.scad>

BeamHoleDistance = 1.54 * in / 4;
BeamDepth = 0.25 * in;

HoleSets = 17;
HolesPerSet = 2;

module actAluminumBeam6_16( sp, info = false ) {
  moMoveOriginTo( actAluminumBeam6_16Position( sp ) )
  {
    color( Aluminum )
      rotate( [0,-90,0] )
        translate( [ BeamHoleDistance * 8, 0, 0 ] )
          import("./stl/actobotics_aluminum_beam_6_16.stl");

    if ( info == true ) {
      for ( si = [ 0 : HoleSets - 1 ] ) {
        for ( hi = [ 0 : HolesPerSet - 1 ] ) {
          moMoveTo( actAluminumBeam6_16Position( [ si, hi ]) ) {
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

function actAluminumBeam6_16Position( sp ) = [ 
  [ 0, ( sp[ 1 ] == 0 ) ? 0 : BeamDepth, sp[0] * BeamHoleDistance ], 
  [ 0, 0, 1 ], 
  ( sp[ 1 ] == 0 ) ? 0 : 180 ];

moMoveOriginTo( actAluminumBeam6_16Position( [ 4, 0 ] ) )
  actAluminumBeam6_16( [0,0], info = true, $name = true );

