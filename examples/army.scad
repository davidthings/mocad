
include <../mo/mo.scad>

use <../mocad/moWorkspace.scad>


ArmyWorkspaceSize = 15  * in;

Army();

JointRadius = 2;
JointSpec = [ [  1, 0, 0 ], 60 ];

ActuatorSpec = [ 8, 1.5 ];
LimbSpec = [ 20, 2 ];

function jointPosition( p = 0, radius = JointRadius, spec = JointSpec ) = ( p == 0 ) ?   [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ] :
                                                          moMoveToPositions( [ [[0, radius, 0],[0,0,1],0],  [[ 0, 0, 0 ], spec[ 0 ], spec[ 1 ] ], [[0, radius, 0],[0,0,1],180]]);

module joint( p = 0, radius = JointRadius, spec = JointSpec, info = false ) {
  moMoveOriginTo( jointPosition( p, radius, spec ) ) {
    color( Gray ) 
      translate( [ 0, radius, 0 ] )
        sphere( r = radius, center = true );

    if ( info == true ) {
      for ( p = [0:1] ) {
        moMoveTo( jointPosition( p, radius, spec ) )
        moPosition( p );
      }
    }   
  }
  if ( info == true )
        moPartOrigin();

  if ( $name == true ) {
    moPartLabel( parent_module(2) );
  }
}

function limbSegmentPosition( p = 0, spec = LimbSpec ) = ( p == 0 ) ?   [ [ 0, spec[ 0 ] / 2, 0 ], [ 0, 0, 1 ], 0 ] :
                                                          [ [ 0, spec[ 0 ], 0 ], [ 0, 0, 1 ], 180 ];

module limbSegment( p = 0, spec = LimbSpec, info = false ) {
  moPresent( limbSegmentPosition( p, spec ), p, info ) {
      translate( [ 0, spec[ 0 ] / 2, 0 ] ) {
        color( White ) 
          cube( [ spec[ 1 ], spec[ 0 ], spec[ 1 ] ], center = true );
      }
  }
   if ( info == true ) {
    for ( p = [0:1] ) {
      moMoveTo( limbSegmentPosition( p, spec ) )
        moPosition( p );
    }
    moPartOrigin();
   }
  if ( $name == true ) {
    moPartLabel( parent_module(2) );
  }
}

function jointedLimbSegmentPosition( p = 0, limbSpec = LimbSpec, jointRadius = JointRadius, jointSpec = JointSpec ) = ( p == 0 ) ? [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ] :
                                                                                                      moMoveToPositions( [ jointPosition( 1, jointRadius, jointSpec ), moFlipPosition, limbSegmentPosition( 1, limbSpec ) ]);

module jointedLimbSegment( limbSpec = LimbSpec, jointRadius = JointRadius,  jointSpec = JointSpec, info = false ) {
  // limb space origin is the point the limb attaches to the rest of the body
  joint();
  moMoveTo( jointPosition( 1, jointRadius, jointSpec ) )
    moFlip()
      limbSegment();
  
  if ( info == true ) {
    moMoveTo( jointedLimbSegmentPosition( 0, limbSpec, jointRadius, jointSpec ) )
      moPosition( 0 );
    moMoveTo( jointedLimbSegmentPosition( 1, limbSpec, jointRadius, jointSpec ) )
      moPosition( 1 );
    moPartOrigin();
  }
}


function limbPosition( p = 0, jointSpecs, limbSpec = LimbSpec, jointRadius = JointRadius, index = 0 ) = ( p == 0 ) ? [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ] :
                                                                                                                          ( ( index < len( jointSpecs ) - 1 ) ?  moMoveToPositions( [ jointedLimbSegmentPosition( 1, limbSpec, jointRadius, jointSpecs[ index ] ),                                                                                                                                                                                     
                                                                                                                                                                                      moFlipPosition,
                                                                                                                                                                                      limbPosition( 1, jointSpecs, limbSpec, jointRadius, index + 1 ) ] ) :
                                                                                                                                                             jointedLimbSegmentPosition( 1, limbSpec, jointRadius, jointSpecs[ index ] ) );
                                                                                                                                                 

module limb( jointSpecs, limbSpec = LimbSpec, jointRadius = JointRadius, index = 0, info = false ) {
  jointedLimbSegment( limbSpec, jointRadius, jointSpecs[ index ]  );
  if ( index < len( jointSpecs ) - 1 ) {
    moMoveTo( jointedLimbSegmentPosition( 1, limbSpec, jointRadius, jointSpecs[ index ] ) ) 
      moFlip()
        limb( jointSpecs, limbSpec, jointRadius, index + 1  );
  }
  if ( info == true ) {
    moMoveTo( limbPosition( 0, jointSpecs, limbSpec, jointRadius, index ) )
      moPosition( 0 );
    moMoveTo( limbPosition( 1, jointSpecs, limbSpec, jointRadius, index ) )
      moPosition( 1 );    
    moPartOrigin();  
  }
}

HandSpec = [ [ 20, 20, 10 ], 2 ];

function handPosition( p = 0, handSec = HandSpec ) = ( p == 0 ) ? [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ] : [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ];

module hand( p = 0, handSpec = HandSpec, info = false ) {
  color( Gray ) {
    cube( handSpec[ 0 ],  center = true );
  }  
  if ( info == true ) {
    moMoveTo( limbPosition( 0, jointSpecs, limbSpec, jointRadius, index ) )
      moPosition( 0 );
    moMoveTo( limbPosition( 1, jointSpecs, limbSpec, jointRadius, index ) )
      moPosition( 1 );    
    moPartOrigin();  
  }
  
}

// moSmoothAnimationCycle( 0, 0.2, 90 ), 
JointSpec1 = [ [  0, 1, 0 ], 20 ];
JointSpec2 = [ [  0, 0.707, 0.707 ], 40 ];
JointSpec3 = [ [  1, 0, 0 ], 90 ];
JointSpec4 = [ [  1, 0, 0 ], 90 ];

module Army() {
  Workspace( 2, size = ArmyWorkspaceSize, name = "Army" );

  Step( 1, size = ArmyWorkspaceSize, height = 20 ) {
    moGridParts( ) {
      hand( );
      limb( [ JointSpec1, JointSpec2, JointSpec3, JointSpec4 ], info = true );
      jointedLimbSegment( info = true );
      limbSegment( info = true );
      joint( p = 0, info = true );
    }
  }

  Step( 2, size = ArmyWorkspaceSize );
}
