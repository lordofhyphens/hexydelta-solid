module slide(mount=true) {
    difference() {
        union() {
            roundcube([w+10, h+10, 5], center=true);
            if (mount)
                translate([-10,0,0])
                    translate([0,0,10])roundcube([15,15,25], center=true);
        }
        #for (i = [-1, 1]) {
            for (j = [-1, 1]) {
                translate([i*w/2, j*h/2,0])
                    cylinder(d=3.4, h=10,center=true);
            }
        }
        if (mount)
            translate([-10,0,0]) {
                translate([0,0,7])
                {
                    #hull() {
                        rotate([90,0,0])cylinder(r=3, h=40, center=true);
                        translate([0,0,8])rotate([90,0,0])cylinder(r=3, h=40, center=true);
                    }
                    translate([10,0,0])
                        #hull() {
                            rotate([90,0,90])cylinder(r=3, h=20, center=true);
                            translate([0,0,8])rotate([90,0,90])cylinder(r=3, h=20, center=true);
                        }
                }
            }

        cutout_hole_offset = ( mount ? 5 : 0);
        cutout_hole_r = ( mount ? 6 : 12);

        translate([cutout_hole_offset,0,0])
            hull() { 
                for (i = [-1, 1])
                    translate([0,i*(h-8-cutout_hole_r)/2,0])
                        cylinder(r=cutout_hole_r, h=5,center=true, $fn=30);
            }
        if (mount)
            for (i = [-1, 1]) {
                translate([i*w/2,0,6]) 
                {
                    rotate([0,90,0])cylinder(d=2.9, h=10,center=true);
                    if (i == -1)
                    #translate([3.6,0,0])rotate([0,90,0])cylinder(d=M3nut+tolerance, h=M3nutThickness+5,center=true, $fn=6);
                }
            }
    }

    if (mount)
        for (i = [-1, 1]) {
            translate([i*w/2,0,6]) 
            {
                difference() {
                    hull () {
                        rotate([0,90,0])cylinder(r=4, h=10,center=true);
                        translate([0,0,-6])roundcube([10,h-5,5], center=true);
                    }
                    rotate([0,90,0])cylinder(d=2.9, h=10,center=true);
                    if (i == -1) {
                        translate([10,0,0]) translate([0,0,10])roundcube([15,15,25], center=true);
                    } else {
                        #translate([-4*i,0,0])rotate([0,90,0])cylinder(d=M3nut+tolerance, h=M3nutThickness+2,center=true, $fn=6);
                    }
                }
            }
        }
}

// slide pieces
module contact_pieces(reduced_contact=0)
{
    difference() {
        roundcube([track[0]+5, track[1]+25, track[2]+5],center=true);
        translate([-3,0,0])
        difference() {
            cube([track[0],track[1], track[2]+10],center=true);
            cube([track[0],track[1]-track_thickness*2, track[2]+10],center=true);
        }
        for (i = [-h/2, h/2])
            for (j = [-w/2, w/2])
                #translate([0,j,i]) rotate([0,90,0])cylinder(d=2.9, h=40, center=true);
        translate([-9,0,0])
        #cube([track[0],track[1], track[2]+10],center=true);
        #cube([track[1],5, track[2]+10],center=true);
        if (reduced_contact > 0) {
            for (i = [-15:reduced_contact:15])
                translate([0,0,i])
                    #cube([30, track[1]+5,2.5],center=true);
        }
    }
}

slide();
translate([50,0,(track[0]/2)]) rotate([90,90,0]) contact_pieces(reduced_contact=1);
translate([-50,0,0])slide(mount=false);
include<inc/configuration.scad>
use<inc/functions.scad>

h=40;
w=track[1]+9.5;
