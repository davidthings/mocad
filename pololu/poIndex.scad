// All files referenced by the path up and then back down so they may be easily copied


use <../pololu/poVNH5019.scad>					
use <../pololu/poDualVNH5019.scad>					

include <../mo/mo.scad>

poIndex( );

module poIndex() {
  $name = true;

  moGridParts( [ 0, 0, 0], [ 0, 5 * in, 0 ], rotate = 0 ) {
    selectOther();
  }
}

module selectOther( ) {
  moGridParts( [ 0, 0, 0], [ 3 * in, 0, 0 ] ) {
    poVNH5019(); 
    poDualVNH5019(); 
  }  
}

