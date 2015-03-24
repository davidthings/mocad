include <../mo/mo.scad>

use <actHubHolePattern0_77.scad>

MountDepth = 0.25*in;
MountFlangeDepth = MountDepth/2;  // not specified in CADlet
MountHeight = 1.32*in;
MountHoleDistance = 1.061 * in;
MountSmallHoleDistance = 0.439 * in;
MountSideHoleDistance = 0.22 * in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, MountFlangeDepth, 0 ], [ 0, 0, 1 ], 180 ]
];

etcPositions = [
  [ [ MountHoleDistance/2, 0, -MountHoleDistance/2 ], [ 0, 0, 1 ], 0 ],
  [ [ MountSmallHoleDistance/2, 0, -MountHoleDistance/2 ], [ 0, 0, 1 ], 0 ],
  [ [ -MountSmallHoleDistance/2, 0, -MountHoleDistance/2 ], [ 0, 0, 1 ], 0 ],
  [ [ -MountHoleDistance/2, 0, -MountHoleDistance/2 ], [ 0, 0, 1 ], 0 ],

  [ [ MountHoleDistance/2, 0, MountHoleDistance/2 ], [ 0, 0, 1 ], 0 ],
  [ [ MountSmallHoleDistance/2, 0, MountHoleDistance/2 ], [ 0, 0, 1 ], 0 ],
  [ [ -MountSmallHoleDistance/2, 0, MountHoleDistance/2 ], [ 0, 0, 1 ], 0 ],
  [ [ -MountHoleDistance/2, 0, MountHoleDistance/2 ], [ 0, 0, 1 ], 0 ],

  [ [ MountSmallHoleDistance/2, MountFlangeDepth, -MountHoleDistance/2 ], [ 0, 0, 1 ], 180 ],
  [ [ -MountSmallHoleDistance/2, MountFlangeDepth, -MountHoleDistance/2 ], [ 0, 0, 1 ], 180 ],
  [ [ MountSmallHoleDistance/2, MountFlangeDepth, MountHoleDistance/2 ], [ 0, 0, 1 ], 180 ],
  [ [ -MountSmallHoleDistance/2, MountFlangeDepth, MountHoleDistance/2 ], [ 0, 0, 1 ], 180 ],

  [ [ MountHeight/2, MountSideHoleDistance, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ MountHeight/2, MountSideHoleDistance, -MountHoleDistance/2 ], [ 0, 0, 1 ], 90 ],
  [ [ MountHeight/2, MountSideHoleDistance, MountHoleDistance/2 ], [ 0, 0, 1 ], 90 ],
  [ [ -MountHeight/2, MountSideHoleDistance, 0 ], [ 0, 0, 1 ], -90 ],
  [ [ -MountHeight/2, MountSideHoleDistance, -MountHoleDistance/2 ], [ 0, 0, 1 ], -90 ],
  [ [ -MountHeight/2, MountSideHoleDistance, MountHoleDistance/2 ], [ 0, 0, 1 ], -90 ],
];

PatternHoles = 9;

module actHubMountQuad90C( sp, info = false ) {

  moMoveOriginTo( actHubMountQuad90CPosition( sp ) ) 
  {
    color( Aluminum )
      import("./stl/actobotics_90_degree_quad_hub_mount_c.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) ] ) {
        for ( pi = [ 0 : si < len( sets ) ? ( PatternHoles - 1 ) : len( etcPositions ) - 1 ] ) {
          moMoveTo( actHubMountQuad90CPosition( [ si, pi ] ) ) {
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

function actHubMountQuad90CPosition( sipi ) = 
  sipi[ 0 ] < len( sets ) ?  moCombinePositions( sets[ sipi[ 0 ] ], actHubHolePattern0_77Position( sipi[ 1 ] ) ) :
                             etcPositions[ sipi[ 1 ] ];

moMoveOriginTo( actHubMountQuad90CPosition( [ 1, 0 ] ) )
  actHubMountQuad90C( [ 0, 0 ], info = true, $name = true );
