include <../mo/mo.scad>

use <actHubHolePattern0_77.scad>

MountDepth = 0.25*in;
MountHeight = 0.75*in;
MountHoleDistance = 1.061 * in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, MountDepth, 0 ], [ 0, 0, 1 ], 180 ]
];

etcPositions = [
  [ [ 0, MountDepth/2, -MountHeight ], [ 1, 0, 0 ], 90 ],
  [ [ -MountHoleDistance / 2, MountDepth/2, -MountHeight ], [ 1, 0, 0 ], 90 ],
  [ [ MountHoleDistance / 2, MountDepth/2, -MountHeight ], [ 1, 0, 0 ], 90 ],
];

PatternHoles = 9;

module actHubMount90C( sp, info = false ) {

  moMoveOriginTo( actHubMount90CPosition( sp ) ) 
  {
    color( Aluminum )
      rotate( [ 0, 180, 0 ] )
        import("./stl/actobotics_90_degree_hub_mount_c.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) ] ) {
        for ( pi = [ 0 : si < len( sets ) ? ( PatternHoles - 1 ) : len( etcPositions ) - 1 ] ) {
          moMoveTo( actHubMount90CPosition( [ si, pi ] ) ) {
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

function actHubMount90CPosition( sipi ) = 
  sipi[ 0 ] < len( sets ) ?  moCombinePositions( sets[ sipi[ 0 ] ], actHubHolePattern0_77Position( sipi[ 1 ] ) ) :
                             etcPositions[ sipi[ 1 ] ];

moMoveOriginTo( actHubMount90CPosition( [ 1, 0 ] ) )
  actHubMount90C( [ 0, 0 ], info = true, $name = true );
