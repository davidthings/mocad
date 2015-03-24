include <../mo/mo.scad>

use <actHubHolePattern0_77.scad>

MountDepth = 0.25*in;
MountWidth = 1.32*in;
MountHoleDistance = 1.061 * in;

MountOffsetX = -0.2995 * in;
MountOffsetY = -0.56 * in;
MountOffsetZ = -1.1174 * in;

sets = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, MountDepth, 0 ], [ 0, 0, 1 ], 180 ]
];

etcPositions = [
  [ [ MountWidth / 2, MountDepth/2, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ MountWidth / 2, MountDepth/2, -MountHoleDistance/2 ], [ 0, 0, 1 ], 90 ],
  [ [ -MountWidth / 2, MountDepth/2, -MountHoleDistance/2 ], [ 0, 0, 1 ], -90 ],
  [ [ -MountWidth / 2, MountDepth/2, 0 ], [ 0, 0, 1 ], -90 ],
  [ [ -MountWidth / 2, MountDepth/2, MountHoleDistance/2 ], [ 0, 0, 1 ], -90 ],
  [ [ MountWidth / 2, MountDepth/2, MountHoleDistance/2 ], [ 0, 0, 1 ], 90 ],
];

PatternHoles = 9;

module actPillowBlockQuad0_25( sp, info = false ) {

  moMoveOriginTo( actPillowBlockQuad0_25Position( sp ) ) 
  {
    color( Aluminum )
      translate( [ MountOffsetX, MountOffsetY, MountOffsetZ ] )
        import("./stl/actobotics_1_4_ball_bearing_quad_pillow_block.stl");

    if ( info == true ) {
      for ( si = [ 0 : len(sets) ] ) {
        for ( pi = [ 0 : si < len( sets ) ? ( PatternHoles - 1 ) : len( etcPositions ) - 1 ] ) {
          moMoveTo( actPillowBlockQuad0_25Position( [ si, pi ] ) ) {
            moPosition2( [ si, pi ] );
          }
        }
      }
    }
  }
  if ( info == true )
    moPartOrigin();  
}

function actPillowBlockQuad0_25Position( sipi ) = 
  sipi[ 0 ] < len( sets ) ?  moCombinePositions( sets[ sipi[ 0 ] ], actHubHolePattern0_77Position( sipi[ 1 ] ) ) :
                             etcPositions[ sipi[ 1 ] ];

moMoveOriginTo( actPillowBlockQuad0_25Position( [ 1, 0 ] ) )
  actPillowBlockQuad0_25( [ 0, 0 ], info = true );

