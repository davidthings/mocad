// All files referenced by the path up and then back down so they may be easily copied


use <../adafruit/adaLCD2_8CapTouch.scad>
use <../adafruit/adaBatteryLiPo3_7V1200mAh.scad>
use <../adafruit/adaBatteryChargerMicroLiPo.scad>


include <../mo/mo.scad>

adaIndex( );

module adaIndex() {
  $name = true;

  moGridParts( [ 0, 0, 0], [ 0, 5 * in, 0 ], rotate = 0 ) {
    selectOther();
  }
}


module selectOther( ) {
  moGridParts( [ 0, 0, 0], [ 3 * in, 0, 0 ] ) {
    adaLCD2_8CapTouch();
    adaBatteryLiPo3_7V1200mAh();
    adaBatteryChargerMicroLiPo();
  }
}
