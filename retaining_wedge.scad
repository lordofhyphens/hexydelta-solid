
module wedge(thick=3.2, tension=0.2, shaft=3, screw=M3) 
{
    difference() {
        union() {
            for (i = [0,120]) 
                hull() {
                    cylinder(d=screw+shaft+3, h=thick, $fn=30);
                    rotate([0,0,i])
                    translate([15,0,0])cylinder(d=screw, h=thick);
                }
        rotate([0,0,60])
            translate([-(screw)/2,0,0])
            translate([0,0,thick-tension])cylinder(d=screw+shaft,h=thick, $fn=30);
        }
        rotate([0,0,60])
            translate([-screw/2,0,0])
        #polyhole(d=screw, h=thick*2+1);
    }
}
for (i = [0:2]) {
    translate([i*12, 0,0])
        rotate([0,0,-60])
    wedge();
}

use<polyholes.scad>
include<inc/configuration.scad>
