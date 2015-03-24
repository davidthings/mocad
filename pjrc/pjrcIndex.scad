// All files referenced by the path up and then back down so they may be easily copied


use <../pjrc/pjrcTeensy3_1.scad>					

include <../mo/mo.scad>

pjrcIndex( );

module pjrcIndex() {
  $name = true;

  moGridParts( [ 0, 0, 0], [ 0, 5 * in, 0 ], rotate = 0 ) {
    selectOther();
  }
}

module selectOther( ) {
  moGridParts( [ 0, 0, 0], [ 3 * in, 0, 0 ] ) {
    pjrcTeensy3_1();
  }
}
