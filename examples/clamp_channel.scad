use <../actobotics/actAluminumChannel3_0.scad>
use <../actobotics/actMotorMountClamping37.scad>

include <../mo/mo.scad>

actAluminumChannel3_0(  );

moAttach( 0, 
          actAluminumChannel3_0Position( [ 2, 2, 25 ] ), 
          moFlipPosition, 
          actMotorMountClamping37Position( 3 ) )
  actMotorMountClamping37(  );
  
  
