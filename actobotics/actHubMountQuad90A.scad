include <../mo/mo.scad>

use <actHubHolePattern0_77.scad>

MountDepth = 0.25*in;
MountFlangeDepth = 0.25*in / 2; // Not specified in mini CAD diagram
MountWidth = 1.0*in;
MountHoleDistance = 1.061 * in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, MountFlangeDepth, 0 ], [ 0, 0, 1 ], 180 ]
];

etcPositions = [
  [ [ MountWidth/2, MountDepth/2, -MountHoleDistance/2 ], [ 0, 0, 1 ], 90 ],
  [ [ -MountWidth/2, MountDepth/2, -MountHoleDistance/2 ], [ 0, 0, 1 ], -90 ],
  [ [ -MountWidth/2, MountDepth/2, 0 ], [ 0, 0, 1 ], -90 ],
  [ [ -MountWidth/2, MountDepth/2, MountHoleDistance/2 ], [ 0, 0, 1 ], -90 ],
  [ [ MountWidth/2, MountDepth/2, MountHoleDistance/2 ], [ 0, 0, 1 ], 90 ],
  [ [ MountWidth/2, MountDepth/2, 0 ], [ 0, 0, 1 ], 90 ],
];

PatternHoles = 9;

module actHubMountQuad90A( sp, info = false ) {

  moMoveOriginTo( actHubMountQuad90APosition( sp ) ) 
  {
    color( Aluminum )
      rotate( [ 0, 180, 0 ] )
        import("./stl/actobotics_90_degree_quad_hub_mount_a.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) ] ) {
        for ( pi = [ 0 : si < len( sets ) ? ( PatternHoles - 1 ) : len( etcPositions ) - 1 ] ) {
          moMoveTo( actHubMountQuad90APosition( [ si, pi ] ) ) {
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

function actHubMountQuad90APosition( sipi ) = 
  sipi[ 0 ] < len( sets ) ?  moCombinePositions( sets[ sipi[ 0 ] ], actHubHolePattern0_77Position( sipi[ 1 ] ) ) :
                             etcPositions[ sipi[ 1 ] ];

moMoveOriginTo( actHubMountQuad90APosition( [ 1, 0 ] ) )
  actHubMountQuad90A( [ 0,0 ], info = true, $name = true );
