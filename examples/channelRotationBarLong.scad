include <../mo/mo.scad>
use <../actobotics/actClampingHub0_77Spacing0_25.scad>
use <../actobotics/actFlatBracketB.scad>

barSpacing = ( ( 2.5 / 2 ) - 0.375 ) * in;

centerPositions = [ 
  moIdentityPosition, 
  [[ 0, 0, 1.5 * in ], [0, 0, 1], 0 ],
  [[ 0, 0, 2 * in ], [0, 0, 1], 0 ],
];

module channelRotationBarSide() {
  actFlatBracketB( info = false );
  moRoll( 2 )
    actClampingHub0_77Spacing0_25(  );
}
module channelRotationBarLong( p = 0, info = false ) {
  moMoveOriginTo( channelRotationBarLongPosition( p ) )  {
    $name = false;
    moPose( [ 0, 0, 0 ], [ 0, barSpacing, 0 ] )  
      channelRotationBarSide();
    moPose( [ 0, 0, 180 ], [ 0, -barSpacing, 0 ] )  
      channelRotationBarSide();
    if ( info == true ) {
      for ( pi = [ 0 : 2 ] ) {
        for ( pj = [ 0 : ( pi > 0 ) ? 3 : 0 ] ) {
          for ( pk = [ 0 : ( pi == 0 ) ? len( centerPositions ) - 1 : ( pj < 2 ) ? 0 : 16  ] ) {
            p = [ pi, pj, pk ];
            moMoveTo( channelRotationBarLongPosition( p ) )
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


channelRotationBarLong( 0, info = true, $name = true );

function channelRotationBarLongPosition( p ) =  ( p[ 0 ] == 0 ) ? centerPositions[ p[ 2 ] ] : 
                                                              moMoveToPosition(  ( p[ 0 ] == 1 ) ? [ [ 0, -barSpacing, 0 ], [ 0, 0, 1 ], 180 ] : 
                                                                                                    [ [ 0, barSpacing, 0 ], [ 0, 0, 1 ], 0 ],
                                                                                 actFlatBracketBPosition( [ p[1],  p[2] ] ) );

