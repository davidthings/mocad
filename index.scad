// All files referenced by the path up and then back down so they may be easily copied

use <mocad/moLogo.scad>	
use <mocad/moIndex.scad>					
use <pjrc/pjrcIndex.scad>					
use <adafruit/adaIndex.scad>					
use <sparkfun/sparkIndex.scad>					
use <pololu/poIndex.scad>					
use <actobotics/actIndex.scad>					

include <mo/mo.scad>

index( );

module index() {
  $name = true;

  translate( [ -25 * in, 0, 0 ] )
    rotate( [ 0, 0, -10 ] )
      scale( [ 4, 4, 4 ] )
        moLogo( $name=false );

  moGridParts( [ 0, 0, 0], [ 0, 5 * in, 0 ], rotate = 0 ) {
    moGridParts( [ 0, 0, 0], [ 0, 0, 0 ] )
    pjrcIndex();
    sparkIndex();
    poIndex();
    adaIndex();
    moIndex();
  }

  translate( [ 0, 35 * in, 0 ] )
    actIndex();
}

