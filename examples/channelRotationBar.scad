include <../mo/mo.scad>
use <../actobotics/actClampingHub0_77Spacing0_25.scad>
use <../actobotics/actFlatBracketA.scad>

barSpacing = ( ( 2.5 / 2 ) - 0.375 ) * in;

BeamMountDistance = ( 1.405 - ( 1.32 - 1.0607 ) / 2 ) * in;

centerPositions = [ 
  moIdentityPosition, 
  [[ 0, 0, BeamMountDistance ], [0, 0, 1], 0 ]
];

module channelRotationBarSide() {
  actFlatBracketA( info = false );
  moRoll( 2 )
    actClampingHub0_77Spacing0_25(  );
}
module channelRotationBar( p = 0, info = false ) {
  moMoveOriginTo( channelRotationBarPosition( p ) )  {
    $name = false;
    moPose( [ 0, 0, 0 ], [ 0, barSpacing, 0 ] )  
      channelRotationBarSide();
    moPose( [ 0, 0, 180 ], [ 0, -barSpacing, 0 ] )  
      channelRotationBarSide();
    if ( info == true ) {
      for ( pi = [ 0 : 2 ] ) {
        for ( pj = [ 0 : ( pi > 0 ) ? 1 : 0 ] ) {
          for ( pk = [ 0 : ( pi > 0 ) ? 3 : len( centerPositions )  ] ) {
            p = [ pi, pj, pk ];
            moMoveTo( channelRotationBarPosition( p ) )
              moPosition3( p );
          }
        }
      }
    }
  }
  if ( info == true )
    moPartOrigin();
  if ( $name )
    moPose( 0, [ 0, -2 * in, 0 ] )
      moPartLabel( parent_module( 2 ) );
}


channelRotationBar( 0, info = true, $name = true );

function channelRotationBarPosition( p ) =  ( p[ 0 ] == 0 ) ? centerPositions[ p[ 2 ] ] : 
                                                              moMoveToPosition(  ( p[ 0 ] == 1 ) ? [ [ 0, -barSpacing, 0 ], [ 0, 0, 1 ], 180 ] : 
                                                                                                    [ [ 0, barSpacing, 0 ], [ 0, 0, 1 ], 0 ],
                                                                                 actFlatBracketAPosition( [ p[1], ( p[2] > 0 ) ? p[2] + 8 : 0 ] ));

