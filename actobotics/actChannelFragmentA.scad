include <../mo/mo.scad>

ChannelHoleSpacing = 1.50 * in;
ChannelHoleDiameter = 0.250 * in;
ChannelHoleDepth = 0.25 * in;
ChannelLength = ChannelHoleSpacing + 2 * ChannelHoleDiameter;
ChannelLength_2 = ChannelLength/2;
ChannelHeight = 2 * ChannelHoleDiameter;
ChannelHeight_2 = ChannelHoleDiameter;
ChannelDepth = ChannelHoleDepth;
ChannelDepth_2 = ChannelDepth / 2;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, ChannelDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ 0, ChannelDepth_2, ChannelHeight_2 ], [ 1, 0, 0 ], -90 ],
  [ [ 0, ChannelDepth_2, -ChannelHeight_2 ], [ 1, 0, 0 ], 90 ],

  [ [ ChannelLength_2, ChannelDepth_2, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ -ChannelLength_2, ChannelDepth_2, 0 ], [ 0, 0, 1 ], -90 ],
];

module actChannelFragmentA( p = 0, info = false ) {
  moPresent( positions, p, info ) 
    color( Yellow )
     translate( [ 0, ChannelHoleDepth/2, 0 ] )
     rotate( [ 90, 0, 0 ] )
	  difference() {
	    cube( [ ChannelLength, ChannelHeight, ChannelDepth ], center = true );
	    union() {
	      translate( [ ChannelHoleSpacing/2, 0, 0 ] )
	        cylinder( h = ChannelHoleDepth + 2 * Epsilon, r = ChannelHoleDiameter/2, $fn=32, center = true );
	      translate( [ -ChannelHoleSpacing/2, 0, 0 ] )
	        cylinder( h = ChannelHoleDepth + 2 * Epsilon, r = ChannelHoleDiameter/2, $fn=32, center = true );
	    }
	}
}

function actChannelFragmentAPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actChannelFragmentAPosition( 3 ) )
  actChannelFragmentA( 0, info = true );

