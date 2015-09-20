include <../mo/mo.scad>
use <../mocad/moTube.scad>
use <../mocad/moTubeFitting.scad>
use <../mocad/moGrid.scad>

TubeFittingWall = 0.1 * in;
TubeFittingDiameter = 0.25 * in;
TubeFittingDistance  = TubeFittingDiameter / 2 + TubeFittingWall;
TubeFittingSocketLength = 0.5 * in;

CornerSpec = [
  [ [ -TubeFittingDistance, TubeFittingDistance, TubeFittingDistance ], [ 0, 0, 1 ], 180  ],
  [ [ 0, -0.125 * in, 0 ], [ 1, 0, 0 ], 0, TubeFittingDiameter,  TubeFittingSocketLength, TubeFittingWall ],
  [ [ 0.125 * in, 0, 0 ], [ 0, 0, 1 ], 90, TubeFittingDiameter, TubeFittingSocketLength, TubeFittingWall ],
  [ [ 0, 0, -0.125 * in ], [ 1, 0, 0 ], 90, TubeFittingDiameter, TubeFittingSocketLength, TubeFittingWall ],
];

InLineSpec = [
  [ [ -TubeFittingDistance, TubeFittingDistance, TubeFittingDistance ], [ 0, 0, 1 ], 180  ],
  [ [ 0, -0.125 * in, 0 ], [ 1, 0, 0 ], 0, TubeFittingDiameter,  TubeFittingSocketLength, TubeFittingWall ],
  [ [ 0, 0, 0.125 * in  ], [ 1, 0, 0 ], -90, TubeFittingDiameter, TubeFittingSocketLength, TubeFittingWall ],
  [ [ 0, 0, -0.125 * in ], [ 1, 0, 0 ], 90, TubeFittingDiameter, TubeFittingSocketLength, TubeFittingWall ],
  [ [ 0.125*in, 0, 0 ], [ 0, 0, 1 ], 90, TubeFittingDiameter, TubeFittingSocketLength, TubeFittingWall ],
];


TubeSpec = [ 8 * in, 0.125 * in, 0.06*in, 4*in ];
ShortTubeSpec = [ 4 * in, 0.125 * in, 0.06*in, 4*in ];


module frameSide() {

  //moGrid( xs = 5, ys = 5, s = 1 * in, info = true );


  moMoveTo( moGridPosition( [ -4, 0 ], s = 1 * in ) )
    moPitch()
      moMoveOriginTo( moTubePosition( [ 1, 0 ], TubeSpec ) )
        moTube( TubeSpec, [ 0, 0 ], info = false );

  moMoveTo( moGridPosition( [ 0, 4 ], s = 1 * in ) )
    moYaw()
      moMoveOriginTo( moTubePosition( [ 1, 0 ], TubeSpec ) )
        moTube( TubeSpec, [ 0, 0 ], info = false );

  moMoveTo( moGridPosition( [ 4, 0 ], s = 1 * in ) )
    moPitch()
      moMoveOriginTo( moTubePosition( [ 1, 0 ], TubeSpec ) )
        moTube( TubeSpec, [ 0, 0 ], info = false );

  moMoveTo( moGridPosition( [ 0, -4 ], s = 1 * in ) )
    moYaw()
      moMoveOriginTo( moTubePosition( [ 1, 0 ], TubeSpec ) )
        moTube( TubeSpec, [ 0, 0 ], info = false );

  
  moMoveTo( moGridPosition( [ -4, 4 ], s = 1 * in ) )
    moTubeFitting( [ 0, 0 ], spec = CornerSpec, wall = TubeFittingWall, info = false  );

  moMoveTo( moGridPosition( [ 4, 4 ], s = 1 * in ) )
    moYaw( -1)
      moTubeFitting( [ 0, 0 ], spec = CornerSpec, wall = TubeFittingWall, info = false  );

  moMoveTo( moGridPosition( [ -4, -4 ], s = 1 * in ) )
    moRoll( -1 )
      moTubeFitting( [ 0, 0 ], spec = CornerSpec, wall = TubeFittingWall, info = false );

  moMoveTo( moGridPosition( [ 4, -4 ], s = 1 * in ) )
    moRoll()
    moYaw( -1 )
      moTubeFitting( [ 0, 0 ], spec = CornerSpec, wall = TubeFittingWall, info = false  );


}

module internalLayer() {

  moMoveTo( [[  -4 * in, -4 *in, 0 * in ], [ 1, 0, 0 ], 0 ]  )
    moTube( ShortTubeSpec, [ 0, 0 ], info = false );
  moMoveTo( [[  4 * in, -4 *in, 0 * in ], [ 1, 0, 0 ], 0 ]  )
    moTube( ShortTubeSpec, [ 0, 0 ], info = false );
  moMoveTo( [[  4 * in, -4 *in, 0 * in ], [ 1, 0, 0 ], 0 ]  )
    moYaw()
      moTube( TubeSpec, [ 0, 0 ], info = false );
  moMoveTo( [[  4 * in, 0 *in, 0 * in ], [ 1, 0, 0 ], 0 ]  )
    moYaw()
      moTube( TubeSpec, [ 0, 0 ], info = false );

  
  moMoveTo( [[  -4 * in, 0, 0 ], [ 1, 0, 0 ], 0 ]  )  
    moTubeFitting( [ 0, 0 ], spec = InLineSpec, wall = TubeFittingWall, info = false  );
  moMoveTo( [[  4 * in, 0, 0 ], [ 1, 0, 0 ], 0 ]  )  
    moYaw( - 1)
      moTubeFitting( [ 0, 0 ], spec = InLineSpec, wall = TubeFittingWall, info = false  );
  moMoveTo( [[  4 * in, -4 * in, 0 ], [ 1, 0, 0 ], 0 ]  )  
    moYaw( -2 )
      moTubeFitting( [ 0, 0 ], spec = InLineSpec, wall = TubeFittingWall, info = false  );
  moMoveTo( [[  -4 * in, -4 * in, 0 ], [ 1, 0, 0 ], 0 ]  )  
    moYaw( 1 )
      moTubeFitting( [ 0, 0 ], spec = InLineSpec, wall = TubeFittingWall, info = false  );
  
}

module frame() {

  internalLayer();
  
  color( White ) {
    moMoveTo( [[  0 * in, -2*in, 4.25 * in ], [ 1, 0, 0 ], 0 ]  )   
      cube( [ 8.35 * in, 4.35 * in, 0.125 * in ], center = true );
    moMoveTo( [[  0 * in, -2*in, -4.25 * in ], [ 1, 0, 0 ], 0 ]  )   
      cube( [ 8.35 * in, 4.35 * in, 0.125 * in ], center = true );
    moMoveTo( [[  0, -4.25*in, 0 * in ], [ 1, 0, 0 ], 0 ]  )   
      cube( [ 8.35*in, 0.125 * in, 8.35 * in ], center = true );
  }
    
  moMoveTo( [[  -4 * in, -4*in, 4 * in ], [ 1, 0, 0 ], 0 ]  )
      moTube( ShortTubeSpec, [ 0, 0 ], info = false );

  moMoveTo( [[  4 * in, -4*in, 4 * in ], [ 1, 0, 0 ], 0 ]  )
      moTube( ShortTubeSpec, [ 0, 0 ], info = false );

  moMoveTo( [[  4 * in, -4*in, -4 * in ], [ 1, 0, 0 ], 0 ]  )
      moTube( ShortTubeSpec, [ 0, 0 ], info = false );

  moMoveTo( [[  -4 * in, -4*in, -4 * in ], [ 1, 0, 0 ], 0 ]  )
    moTube( ShortTubeSpec, [ 0, 0 ], info = false );

  frameSide();
  
  translate( [ 0, -4 * in, 0 ] )
    moFlip( 2 )
      frameSide();
}


frame();