use <../actobotics/actAluminumChannel3_0.scad>
use <../actobotics/actMotorMountClamping37.scad>

use <../mocad/moSocketHeadCapScrew6_32.scad>

include <../mo/mo.scad>

actAluminumChannel3_0(  );

moAttach( 0, 
          actAluminumChannel3_0Position( [ 2, 2, 25 ] ), 
          moFlipPosition, 
          actMotorMountClamping37Position( 3 ) )
  actMotorMountClamping37( );
  
moAttach( 0, 
          actAluminumChannel3_0Position( [ 2, 5, 22 ] ) )
  moSocketHeadCapScrew6_32( );
  
moAttach( 0, 
          actAluminumChannel3_0Position( [ 2, 5, 26 ] ) )
  moSocketHeadCapScrew6_32( );
