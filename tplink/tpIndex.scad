// All files referenced by the path up and then back down so they may be easily copied


use <../tplink/tpWR703N.scad>

include <../mo/mo.scad>

tpIndex( );

module tpIndex() {
  $name = true;

  moGridParts( [ 0, 0, 0], [ 0, 5 * in, 0 ], rotate = 0 ) {
    selectOther();
  }
}

module selectOther( ) {
  moGridParts( [ 0, 0, 0], [ 4 * in, 0, 0 ] ) {
    tpWR703N();
  }
}

