module shim(endstop = false, backing_hole=M5) {
    plugs = 4.9;
    plug_diameter = [track[2], track[1]-8.5, track[0]-4.5];
    for (i=[(7+3.1)/2, -(7+3.1)/2])
        translate([0,i,plugs/2])cube([18.5, 2.8,plugs], center=true);
    translate([0,0,-(12.5)/2])
        mirror([0,0,1])
        difference() {
            cube(plug_diameter,center=true);
            translate([0,0,5])
                #cylinder(d=M5+tolerance, h=10, $fn=60);
        }
    if (endstop) {
        translate([25,0,-(12.5)/2]) difference()
        { 
            cube([29,plug_diameter[1], plug_diameter[2]], center=true);
            for (j = [7.5])
            for (i=[9.5/2, -9.5/2]) {
                #translate([j,i,-10]) cylinder(d=M2_5, h=20);
            }
        }
    }
}

for (y = [0:2]) translate([0,30*y,0])shim();
translate([0,-30,0])shim(endstop=true);

include<inc/configuration.scad>
