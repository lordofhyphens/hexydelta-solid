/* Modified from https://github.com/jcrocholl/kossel
License: GPL
*/ 
include <inc/configuration.scad>;

separation = (magnetic ? 40 : track[1] + 10);  // Distance between ball joint mounting faces.
offset = 20;  // Same as DELTA_EFFECTOR_OFFSET in Marlin.
mount_radius = 12.5;  // Hotend mounting screws, standard would be 25mm.
hotend_radius = 8.2;  // Hole for the hotend (J-Head diameter is 16mm).
push_fit_height = 7;  // Length of brass threaded into printed plastic.
height = 12;
cone_r1 = 2.5;
cone_r2 = 14;

module effector() {
    difference() {
        union() {
            cylinder(r=offset-3, h=height, center=true, $fn=60);
            for (a = [60:120:359]) rotate([0, 0, a]) {
                rotate([0, 0, 30]) translate([offset-2, 0, 0])
                    cube([10, 13, height], center=true);
                for (s = [-1, 1]) scale([s, 1, 1]) {
                    translate([0, offset, 0]) 
                        if (magnetic) {
                            difference() {
                                intersection() {
                                    cube([separation+10, 40, height], center=true);
                                    translate([0, -4, 0]) rotate([0, 90, 0])
                                        cylinder(r=10, h=separation+10, center=true);
                                    translate([separation/2-6, 0, 0]) rotate([0, 90, 0])
                                        cylinder(r1=cone_r2, r2=cone_r2, h=20, center=true, $fn=24);
                                }
                                translate([(track[1]+9.5)/2,-1,0]) {
                                    rotate([45, 0, 0]) {
                                        #cylinder(r=m3_radius, h=separation+1, center=true, $fn=12);
                                    }
                                    rotate([-45, 0, 0])
                                        translate([0,6,0])
                                        #cube([30,3,20],center=true);
                                }
                            }
                        }
                else {
                    difference() {
                        intersection() {
                            cube([separation, 40, height], center=true);
                            translate([0, -4, 0]) rotate([0, 90, 0])
                                cylinder(r=10, h=separation, center=true);
                            translate([separation/2-7, 0, 0]) rotate([0, 90, 0])
                                cylinder(r1=cone_r2, r2=cone_r1, h=14, center=true, $fn=24);
                        }
                        rotate([0, 90, 0])
                            cylinder(r=m3_radius, h=separation+1, center=true, $fn=12);
                        rotate([90, 0, 90])
                            cylinder(r=m3_nut_radius, h=separation-24, center=true, $fn=6);
                    }
                }
                }
            }
        }
        translate([0, 0, push_fit_height-height/2])
            cylinder(r=hotend_radius, h=height, $fn=36);
        *translate([0, 0, -6]) # import("m5_internal.stl");
        translate([0, 0, -push_fit_height+1]) # cylinder(r=6.5, h=push_fit_height);
        for (a = [0:60:359]) rotate([0, 0, a]) {
            translate([0, mount_radius, 0])
                cylinder(r=m3_wide_radius, h=2*height, center=true, $fn=12);
        }
        if (magnetic) 
            for (a = [60:120:359]) rotate([0, 0, a]) 
                translate([0, offset, 0]) 

                    for (s = [-1, 1]) scale([s, 1, 1])
                        translate([(track[1]+9.5)/2,-1,0]) {
                            rotate([45, 0, 0]) {
                                #cylinder(r=m3_radius, h=separation+1, center=true, $fn=12);
                                translate([0,0,8])
                                    #cylinder(r=m3_nut_radius, h=6, center=true, $fn=6);
                            }
                        }
    }
}

translate([0, 0, height/2]) effector();
