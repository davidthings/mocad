include <../mo/mo.scad>

use <actHubHolePattern0_77.scad>

MountDepth = 0.25*in;
MountHeight = 1.32*in;
MountHoleDistance = 1.061 * in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, MountDepth, 0 ], [ 0, 0, 1 ], 180 ]
];

etcPositions = [
  [ [ 0, MountDepth/2, -MountHeight/2 ], [ 1, 0, 0 ], 90 ],
  [ [ -MountHoleDistance / 2, MountDepth/2, -MountHeight/2 ], [ 1, 0, 0 ], 90 ],
  [ [ MountHoleDistance / 2, MountDepth/2, -MountHeight/2 ], [ 1, 0, 0 ], 90 ],
  [ [ 0, MountDepth/2, MountHeight/2 ], [ 1, 0, 0 ], -90 ],
  [ [ -MountHoleDistance / 2, MountDepth/2, MountHeight/2 ], [ 1, 0, 0 ], -90 ],
  [ [ MountHoleDistance / 2, MountDepth/2, MountHeight/2 ], [ 1, 0, 0 ], -90 ],
];

PatternHoles = 9;

module actHubMountQuad90D( sp, info = false ) {

  moMoveOriginTo( actHubMountQuad90DPosition( sp ) ) 
  {
    color( Aluminum )
        import("./stl/actobotics_90_degree_quad_hub_mount_d.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) ] ) {
        for ( pi = [ 0 : si < len( sets ) ? ( PatternHoles - 1 ) : len( etcPositions ) - 1 ] ) {
          moMoveTo( actHubMountQuad90DPosition( [ si, pi ] ) ) {
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

function actHubMountQuad90DPosition( sipi ) = 
  sipi[ 0 ] < len( sets ) ?  moCombinePositions( sets[ sipi[ 0 ] ], actHubHolePattern0_77Position( sipi[ 1 ] ) ) :
                             etcPositions[ sipi[ 1 ] ];

moMoveOriginTo( actHubMountQuad90DPosition( [ 1, 0 ] ) )
  actHubMountQuad90D( [ 0, 0 ], info = true, $name = true );
