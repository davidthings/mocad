include <../mo/mo.scad>

BeamHoleSpacing = 0.770 * in;
BeamHoleSpacing_2 = BeamHoleSpacing / 2;
BeamHoleDiameter = 0.160 * in;
BeamHoleDiameter_2 = BeamHoleDiameter / 2;
BeamHoleDepth = 0.25 * in;
BeamLength = BeamHoleSpacing + 2 * BeamHoleDiameter;
BeamLength_2 = BeamLength / 2;
BeamHeight = 2 * BeamHoleDiameter;
BeamHeight_2 = BeamHoleDiameter;
BeamDepth = BeamHoleDepth;
BeamDepth_2 = BeamDepth/2;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ 0, BeamDepth_2, BeamHeight_2 ], [ 1, 0, 0 ], -90 ],
  [ [ 0, BeamDepth_2, -BeamHeight_2 ], [ 1, 0, 0 ], 90 ],

  [ [ BeamLength_2, BeamDepth_2, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ -BeamLength_2, BeamDepth_2, 0 ], [ 0, 0, 1 ], -90 ],
];

module actBeamFragment( p = 0, info = false ) {
  moPresent( positions, p, info ) 
    color( Yellow )
     translate( [ 0, BeamHoleDepth/2, 0 ] )
     rotate( [ 90, 0, 0 ] )
	  difference() {
	    cube( [ BeamLength, BeamHeight, BeamDepth ], center = true );
	    union() {
	      translate( [ BeamHoleSpacing_2, 0, 0 ] )
	        cylinder( h = BeamHoleDepth + 2 * Epsilon, r = BeamHoleDiameter_2, center = true );
	      translate( [ -BeamHoleSpacing_2, 0, 0 ] )
	        cylinder( h = BeamHoleDepth + 2 * Epsilon, r = BeamHoleDiameter_2, center = true );
	    }
	}
}

function actBeamFragmentPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actBeamFragmentPosition( 3 ) )
  actBeamFragment( 0, info = true );
