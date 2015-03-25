use <../actobotics/actAluminumChannel1_5.scad>
use <../actobotics/actAluminumChannel3_0.scad>
use <../actobotics/actClampingHub0_77Spacing0_25.scad>
use <../actobotics/actHubAdapterD.scad>
use <../actobotics/actBallBearingFlanged0_25.scad>
use <../mocad/moShaft.scad>

include  <../mo/mo.scad>
/*
moGridParts( [ 0, 10*in, 0 ], [ 3*in, 0, 0 ]  ) {
  $name = true;
  actAluminumChannel3_0( info = false);
  actAluminumChannel1_5( info = false);
  actClampingHub0_77Spacing0_25( info = true );
  actHubAdapterD( info = true );
  actBallBearingFlanged0_25( info = true );
  moShaft( info = true );
}
*/
hub1Angle = 20 + 60 * sin( $t * 360 );
hub2Angle = 20 + 60 * sin( $t * 360 );

hub1Origin = moAttachPosition( 0,
                               actAluminumChannel3_0Position( [ 0, 5, 0 ] ), 
                               moMoveToPosition( moFlipPosition, moRollPosition( hub1Angle ) ), 
                               actClampingHub0_77Spacing0_25Position( 1 ) );

hub2Origin = moAttachPosition( 0, 
                               actAluminumChannel3_0Position( [ 3, 8, 0 ] ), 
                               moMoveToPosition( moLinearPosition( 0.5*in ), moRollPosition( hub2Angle ) ), 
                               actClampingHub0_77Spacing0_25Position( 1 ) );

hub1Joint = moMoveToPosition( hub1Origin, actClampingHub0_77Spacing0_25Position( 5 ) );

hub2Joint = moMoveToPosition( hub2Origin, actClampingHub0_77Spacing0_25Position( 6 ) );

actAluminumChannel3_0( info = false);

moAttach( 0, actAluminumChannel3_0Position( [ 3, 8, 0 ] ), 0, actBallBearingFlanged0_25Position( 2 ) )
  actBallBearingFlanged0_25();

moAttach( 0, actAluminumChannel3_0Position( [ 0, 2, 0 ] ), 0, actBallBearingFlanged0_25Position( 2 ) )
  actBallBearingFlanged0_25();

moAttach( 0, actAluminumChannel3_0Position( [ 0, 4, 0 ] ), 0, actBallBearingFlanged0_25Position( 2 )  )
  actBallBearingFlanged0_25();

moAttach( 0, actAluminumChannel3_0Position( [ 0, 2, 0 ] ), moLinearPosition( -0.5 * in ), moShaftPosition( 1, l = 2*in )  )
  moShaft( l = 3*in);

moAttach( 0, actAluminumChannel3_0Position( [ 3, 8, 0 ] ), moLinearPosition( -0.7 * in ), moShaftPosition( 1, l = 1*in )  )
  moShaft( l = 2*in);

moMoveTo( hub1Origin  )
  actClampingHub0_77Spacing0_25();

moMoveTo( hub2Origin )
  actClampingHub0_77Spacing0_25();
  
module Ball( c = Red ) {
  color( c ) {
    sphere( r = 0.1 * in, center = true );
  }
}

moMoveTo( hub1Joint )
  Ball( Red );

moMoveTo( hub2Joint )
  Ball( Blue);

module joinPositions( pos1, pos2 ) {
  delta = pos2 - pos1;
  echo( delta );
  echo( VMAG(  delta ) );

  color( [ 0.4, 0.4, 0.4 ] )
    hull() {
      translate( pos1 ) 
        sphere( r = 0.01 * in, center = true );
      translate( pos2 ) 
        sphere( r = 0.01 * in, center = true );
    }
}

joinPositions( hub1Joint[ 0 ], hub2Joint[ 0 ] );
