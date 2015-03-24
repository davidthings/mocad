include <../mo/mo.scad>

use <actHubHolePattern0_77.scad>

MountDepth = 0.25*in;
MountFlangeDepth = MountDepth/2;  // not specified in CADlet
MountHeight = 1.32*in;
MountHoleDistance = 1.061 * in;
MountHoleFlangeDepth = 0.13 * in; // not specified in CADlet - guessed

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, MountFlangeDepth, 0 ], [ 0, 0, 1 ], 180 ]
];

etcPositions = [
  [ [ MountHeight/2, 0, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ MountHeight/2, 0, -MountHoleDistance/2 ], [ 0, 0, 1 ], 90 ],
  [ [ MountHeight/2, 0, MountHoleDistance/2 ], [ 0, 0, 1 ], 90 ],
  [ [ MountHeight/2 - MountHoleFlangeDepth, 0, -MountHoleDistance/2 ], [ 0, 0, 1 ], -90 ],
  [ [ MountHeight/2 - MountHoleFlangeDepth, 0, MountHoleDistance/2 ], [ 0, 0, 1 ], -90 ],
  [ [ -MountHeight/2, 0, 0 ], [ 0, 0, 1 ], -90 ],
  [ [ -MountHeight/2, 0, -MountHoleDistance/2 ], [ 0, 0, 1 ], -90 ],
  [ [ -MountHeight/2, 0, MountHoleDistance/2 ], [ 0, 0, 1 ], -90 ],
  [ [ -MountHeight/2 + MountHoleFlangeDepth, 0, -MountHoleDistance/2 ], [ 0, 0, 1 ], 90 ],
  [ [ -MountHeight/2 + MountHoleFlangeDepth, 0, MountHoleDistance/2 ], [ 0, 0, 1 ], 90 ],
];

PatternHoles = 9;

module actHubMountQuad90B( sp, info = false ) {

  moMoveOriginTo( actHubMountQuad90BPosition( sp ) ) 
  {
    color( Aluminum )
      import("./stl/actobotics_90_degree_quad_hub_mount_b.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) ] ) {
        for ( pi = [ 0 : si < len( sets ) ? ( PatternHoles - 1 ) : len( etcPositions ) - 1 ] ) {
          moMoveTo( actHubMountQuad90BPosition( [ si, pi ] ) ) {
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

function actHubMountQuad90BPosition( sipi ) = 
  sipi[ 0 ] < len( sets ) ?  moCombinePositions( sets[ sipi[ 0 ] ], actHubHolePattern0_77Position( sipi[ 1 ] ) ) :
                             etcPositions[ sipi[ 1 ] ];

moMoveOriginTo( actHubMountQuad90BPosition( [ 1, 0 ] ) )
  actHubMountQuad90B( [ 0, 0 ], info = true, $name = true );
