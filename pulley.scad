belt_width=6;
module pulley(bearing=xx625, center=M5) {
    difference() {
        union() {
            cylinder(d1=bearing[1]+7, d2=bearing[1]+3, h=bearing[2]/2-0.5, $fn=60);
            translate([0,0,bearing[2]*2])mirror([0,0,1])cylinder(d1=bearing[1]+7, d2=bearing[1]+3, h=bearing[2]/2-0.5, $fn=60);

            cylinder(d=bearing[1]+3, h=bearing[2]*2, $fn=60);
            translate([0,0,-1.5])cylinder(d=bearing[1]+7, h=1.5, $fn=60);
            translate([0,0,bearing[2]*2])cylinder(d=bearing[1]+7, h=2, $fn=60);
        }
        translate([0,0,2])polyhole(bearing[2]*2+tolerance, bearing[1]+tolerance);
        #translate([0,0,-2])polyhole(d=center, h=bearing[2]*2);
    }
}
pulley();
include<inc/configuration.scad>
use<inc/functions.scad>
use<polyholes.scad>
