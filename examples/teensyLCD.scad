use <../sparkfun/sparkWombat.scad>		
use <../pjrc/pjrcTeensy3_1.scad>
use <../adafruit/adaLCD2_8CapTouch.scad>					
use <../adafruit/adaBatteryLiPo3_7V1200mAh.scad>					
use <../adafruit/adaBatteryChargerMicroLiPo.scad>	
use <../mocad/moPCB.scad>

include <../mo/mo.scad>

module testerElectronics(  ) {
  sparkWombat(  );
  
  moPose( t=[ -1.05 * in, -0.44 * in, -0.7 * in ]  ) {
    moFlip() moMoveOriginTo( pjrcTeensy3_1Position( 1 )  )  {
      pjrcTeensy3_1( 0 );
        moMoveTo( pjrcTeensy3_1Position( 9 ) )
          moFlip() moRoll( ) moPCBSIPMolding( 14 );
        moMoveTo( pjrcTeensy3_1Position( 10 ) )
          moFlip() moRoll( ) moPCBSIPMolding( 14 );
        moMoveTo( pjrcTeensy3_1Position( 7 ) )
          moRoll( ) moPCBPins( 14, length = 0.6 * in );
        moMoveTo( pjrcTeensy3_1Position( 8 ) )
          moRoll( ) moPCBPins( 14, length = 0.6 * in );
      
    }
  }  
  moPose( t=[ 0.3 * in, -0.44 * in, -0.0 * in ] ) 
   moRoll( -1 ) moFlip() moMoveOriginTo( adaLCD2_8CapTouchPosition( 1 ) )   {
      adaLCD2_8CapTouch( 0  );
      moMoveTo( adaLCD2_8CapTouchPosition( 10 ) )
        moFlip() moRoll( ) moPCBSIPMolding( 20 );
      moMoveTo( adaLCD2_8CapTouchPosition( 11 ) )
        moFlip() moRoll( ) moPCBSIPMolding( 20 );
      moMoveTo( adaLCD2_8CapTouchPosition( 8 ) )
        moRoll( ) moPCBPins( 20, length = 0.6 * in );
      moMoveTo( adaLCD2_8CapTouchPosition( 9 ) )
        moRoll( ) moPCBPins( 20, length = 0.6 * in );
   }

    moPose( t = [ 0, 0, 0 ] )
      moFlip() moRoll( 2 ) adaBatteryLiPo3_7V1200mAh(  );					
  moPose( t = [ 1.2 * in, 0, -1 * in ] )
    moFlip() moRoll( 1 ) moMoveOriginTo( adaBatteryChargerMicroLiPoPosition( 1 ) ) {
      adaBatteryChargerMicroLiPo( 0 );
      if ( $internalDetail )
        moMoveTo( adaBatteryChargerMicroLiPoPosition( 20 ) )
          moRoll( ) 
            moPCBPins( 4, length = 0.155 * in );
    }  
  
  moPose( t = [ -1 * in, 0, 1.15 * in ] ) moFlip()
    moPCBSIPMolding( 6 );

  moPose( t = [ -1 * in, 0, 0.35 * in ] ) moFlip()
    moPCBSIPMolding( 6 );

  moPose( t = [ -1 * in, 0, 0.35 * in ] ) moFlip()
    moPCBSIPMolding( 6 );
  }  
  
 
testerElectronics(  );
  
  
function moEncaseInternal2( minMax, point ) = [
  [ min( minMax[ 0 ][ 0 ], point[ 0 ] ), min( minMax[ 0 ][ 1 ], point[ 1 ] ), min( minMax[ 0 ][ 2 ], point[ 2 ] ) ], 
  [ max( minMax[ 1 ][ 0 ], point[ 0 ] ), max( minMax[ 1 ][ 1 ], point[ 1 ] ), max( minMax[ 1 ][ 2 ], point[ 2 ] ) ] 
];
    
function moEncaseInternal( positions, index ) = ( ( index == len( positions ) - 1 ) ? [ positions[ index ], positions[ index ] ] :   
                                               moEncaseInternal2( moEncaseInternal( positions, index + 1 ), positions[ index ] ) );

  
    
module moEncase( positions, expand = [ 0, 0, 0 ], color = White ) {
  bounds = moEncaseInternal( positions, 0 );
  color( color) {
    cube( [ bounds[ 1 ][ 0 ] - bounds[ 0 ][ 0 ] + expand[ 0 ] * 2, 
            bounds[ 1 ][ 1 ] - bounds[ 0 ][ 1 ] + expand[ 1 ] * 2, 
            bounds[ 1 ][ 2 ] - bounds[ 0 ][ 2 ] + expand[ 2 ] * 2 ], center = true );
  }
}  

module case( thickness = 0.1 * in ) {
  modulePositions = [ 
         sparkWombatPosition( 11 )[ 0 ],
         sparkWombatPosition( 12 )[ 0 ],
         sparkWombatPosition( 13 )[ 0 ],
         sparkWombatPosition( 10 )[ 0 ],
         [ 0, -0.4 * in, 0 ] 
       ];
  windowPositions = [ 
         adaLCD2_8CapTouchPosition( 2 )[ 0 ],
         adaLCD2_8CapTouchPosition( 3 )[ 0 ],
         adaLCD2_8CapTouchPosition( 4 )[ 0 ],
         adaLCD2_8CapTouchPosition( 5 )[ 0 ],
         [ 0, -0.4 * in, 0 ] 
       ];

  difference( ) {

    moEncase( modulePositions, [ thickness, thickness, thickness ] );

    translate( [ 0, 0, 0 ] )
    moEncase( modulePositions);  
      translate( [0, -0.27 * in, 0 ] )
    moEncase( windowPositions );
  }
}  


//translate( [ 0, -0.25 * in, 0 ] )
//color( White )
//  minkowski() {
//    case();
//    sphere( r = 0.1 * in );
//  }
