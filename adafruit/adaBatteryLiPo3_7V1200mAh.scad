include <../mo/mo.scad>

AdaBatteryLiPo3_7V1200mAh_BodyHeight = 2.1 * in;
AdaBatteryLiPo3_7V1200mAh_PCBHeight = 0.3 * in;
AdaBatteryLiPo3_7V1200mAh_Height = AdaBatteryLiPo3_7V1200mAh_BodyHeight + AdaBatteryLiPo3_7V1200mAh_PCBHeight;
AdaBatteryLiPo3_7V1200mAh_Width = 1.3 * in;
AdaBatteryLiPo3_7V1200mAh_Depth = 0.2 * in;
AdaBatteryLiPo3_7V1200mAh_WireSpacing = 0.1 * in;

AdaBatteryLiPo3_7V1200mAh_BodyColor = Aluminum;
AdaBatteryLiPo3_7V1200mAh_PCBColor = [ 1, 1, 0 ];

positions = [ 
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, AdaBatteryLiPo3_7V1200mAh_Depth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ AdaBatteryLiPo3_7V1200mAh_Width/2, AdaBatteryLiPo3_7V1200mAh_Depth/2, 0 ], [ 0, 0, 1 ], 90 ],  
  [ [ -AdaBatteryLiPo3_7V1200mAh_Width/2, AdaBatteryLiPo3_7V1200mAh_Depth/2, 0 ], [ 0, 0, 1 ], -90 ],  
  [ [ 0, AdaBatteryLiPo3_7V1200mAh_Depth/2, -AdaBatteryLiPo3_7V1200mAh_BodyHeight/2 ], [ 1, 0, 0 ], 90 ],  
  [ [ 0, AdaBatteryLiPo3_7V1200mAh_Depth/2, AdaBatteryLiPo3_7V1200mAh_BodyHeight/2 + AdaBatteryLiPo3_7V1200mAh_PCBHeight], [ 1, 0, 0 ], -90 ],  
  [ [ -AdaBatteryLiPo3_7V1200mAh_WireSpacing / 2, AdaBatteryLiPo3_7V1200mAh_Depth/2, AdaBatteryLiPo3_7V1200mAh_BodyHeight/2 + AdaBatteryLiPo3_7V1200mAh_PCBHeight], [ 1, 0, 0 ], -90 ],  
  [ [ AdaBatteryLiPo3_7V1200mAh_WireSpacing / 2, AdaBatteryLiPo3_7V1200mAh_Depth/2, AdaBatteryLiPo3_7V1200mAh_BodyHeight/2 + AdaBatteryLiPo3_7V1200mAh_PCBHeight], [ 1, 0, 0 ], -90 ],  
];

module adaBatteryLiPo3_7V1200mAh( p = 0, info = false ) {
    moPresent( positions, p, info ) {
        translate( [ 0, AdaBatteryLiPo3_7V1200mAh_Depth / 2, 0 ] ) {
          union() {
            color( AdaBatteryLiPo3_7V1200mAh_BodyColor ) {
              linear_extrude( height = AdaBatteryLiPo3_7V1200mAh_BodyHeight, twist = 0, center = true ) {
                square( [ AdaBatteryLiPo3_7V1200mAh_Width, AdaBatteryLiPo3_7V1200mAh_Depth ], center = true );
              }
            }
            translate( [ 0, 0, AdaBatteryLiPo3_7V1200mAh_BodyHeight / 2 ] ) {
              color( AdaBatteryLiPo3_7V1200mAh_PCBColor ) {
                linear_extrude( height = AdaBatteryLiPo3_7V1200mAh_PCBHeight, twist = 0 ) {
                  square( [ AdaBatteryLiPo3_7V1200mAh_Width, AdaBatteryLiPo3_7V1200mAh_Depth ], center = true );
                }
              }          
            }
          }
        }
    }
}


function adaBatteryLiPo3_7V1200mAhPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( adaBatteryLiPo3_7V1200mAhPosition( 1 ) ) {
  adaBatteryLiPo3_7V1200mAh( 0, info = true, $name = true );
}

