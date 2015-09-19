// All files referenced by the path up and then back down so they may be easily copied

use <../mocad/moLogo.scad>
use <../mocad/moShaft.scad>
use <../mocad/moSpacer.scad>
use <../mocad/moPCB.scad>
use <../mocad/moGrid.scad>
use <../mocad/moSocketHeadCapScrew6_32.scad>
use <../mocad/moSnapFastener6.scad>
use <../mocad/moPipeline.scad>
use <../mocad/moBattery12V7AhLiFePO4.scad>
use <../mocad/moHExtrusion.scad>
use <../mocad/moTeeExtrusion.scad>
use <../mocad/moChannelExtrusion.scad>
use <../mocad/moTube.scad>
use <../mocad/moRectangularTube.scad>
use <../mocad/moRectangularExtrusion.scad>
use <../mocad/moRightAngleExtrusion.scad>
use <../mocad/moMicroUSB.scad>
use <../mocad/moRJ45Socket.scad>
use <../mocad/moRJ45SocketSmall.scad>
use <../mocad/moTubeFitting.scad>

include <../mo/mo.scad>

moIndex( );

module moIndex() {
  $name = true;

  moGridParts( [ 0, 0, 0], [ 0, 5 * in, 0 ], rotate = 0 ) {
    selectFasteners();
    selectRaw();
    selectElectronics();
    selectOther();
  }
}

module selectFasteners() {
  moGridParts( [ 0, 0, 0], [ 2 * in, 0, 0 ] ) {
    moSnapFastener6();
    moSocketHeadCapScrew6_32();
  }
}

module selectRaw() {
  spec = [ 2 * in, 0.5*in, 0.5*in, 0.06*in, 0.5 * in ];
  specRE = [ 2 * in, 0.5*in, 0.06*in, 0.5 * in ];
  specT = [ 2 * in, 0.25*in, 0.06*in, 0.5 * in ];
  moGridParts( [ 0, 0, 0], [ 3 * in, 0, 0 ] ) {
    moHExtrusion( spec, 0, info = true );
    moTeeExtrusion( spec, 0, info = true );
    moRightAngleExtrusion( spec, 0, info = true );
    moTube( specT, 0, info = true );
    moRectangularTube( spec, 0, info = true );
    moRectangularExtrusion( specRE, 0, info = true );
    moChannelExtrusion( spec, 0, info = true );
    moTubeFitting( info = true );
  }  
}

module selectOther( ) {
  moGridParts( [ 0, 0, 0], [ 4 * in, 0, 0 ] ) {
    moShaft( );
    moSpacer( );
    moPipeline( );
    moPipelinePoints();
    moGrid( info = true );
  }
}

module selectElectronics( ) {
  moGridParts( [ 0, 0, 0], [ 4 * in, 0, 0 ] ) {
    moMicroUSB( );
    moRJ45Socket();
    moRJ45SocketSmall();
    moPCB( );
    moPCBPins(  );
    moPCBSIPMolding( );
    moPCBHoles(  );
    moPCBHoleGrid( );
    moBattery12V7AhLiFePO4();
  }
}
