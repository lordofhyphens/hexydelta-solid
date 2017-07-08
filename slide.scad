module slide(mount=true, magnetic=false) {
    t_x = (magnetic ? 3 : 0 );
    difference() {
        union() {
            roundcube([w+10, h+10, 5], center=true);
            if (mount)
                translate([-10-t_x,0,0])
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
                translate([-t_x,0,12])
                {
                    rotate([0,90,90])
                    translate([-2,0,-2])
                    #hull() {
                        rotate([90,0,0])cylinder(r=3, h=40, center=true);
                        translate([0,0,4])rotate([90,0,0])cylinder(r=3, h=40, center=true);
                    }
                    rotate([0,0,90])
                        #hull() {
                            rotate([90,0,90])cylinder(r=3, h=20, center=true);
                            translate([0,0,6])rotate([90,0,90])cylinder(r=3, h=20, center=true);
                        }
                }
            }

        cutout_hole_offset = ( mount ? (magnetic ? 3.5 : 5) : 0);
        cutout_hole_r = ( mount ? (magnetic ? 9 : 6) : 12);

        translate([cutout_hole_offset,0,0])
            hull() { 
                for (i = [-1, 1])
                    translate([0,i*(h-8-cutout_hole_r)/2,0])
                        cylinder(r=cutout_hole_r, h=5,center=true, $fn=30);
            }
        if (mount && !magnetic)
            for (i = [-1, 1]) {
                translate([i*w/2,0,6]) 
                {
                    rotate([0,90,0])cylinder(d=2.9, h=10,center=true);
                    if (i == -1)
                    #translate([3.6,0,0])rotate([0,90,0])cylinder(d=M3nut+tolerance, h=M3nutThickness+5,center=true, $fn=6);
                }
            }
    }

    if (mount && !magnetic)
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
module bar(thick=1.85) {

    narrow=25;
    wide = 20.4;
    y = 19;
    points=[[-wide/2,0], [wide/2, 0], [narrow/2,y], [-narrow/2, y]];
    points2=[[(-wide+thick*2)/2,0], [(wide-thick*2)/2, 0], [(narrow-thick*2)/2,y], [(-narrow+thick*2)/2, y]];
    difference() {
        linear_extrude(h=100) polygon(points=points);
        translate([0,thick,0])
            linear_extrude(h=100) polygon(points=points2);
    }
}
// slide pieces
// 8.4-5.2
module contact_pieces(reduced_contact=0, thick=1.85)
{
    difference() {
        roundcube([track[0]+5, track[1]+25, track[2]+5],center=true);

        translate([-12-(4.8-2.5),0,50])rotate([180,0,90])scale([1.1,1.1,1])#bar();
        cube([track[0]+20,10, track[2]+30],center=true);
        for (i = [-h/2, h/2])
            for (j = [-w/2, w/2])
            {
                #translate([-11.2+(8.4-5.2-1),j,i]) rotate([30,0,0])rotate([0,90,0])cylinder(d=6.5+0.4, h=40, $fn=6);
                #translate([0,j,i]) rotate([0,90,0])cylinder(d=2.8, h=40, center=true);
            }
        translate([-15,0,0])
        #cube([17, 22, 90],center=true);
        translate([-9,0,0])
            if (reduced_contact > 0) {
                for (i = [-15:reduced_contact:15])
                    translate([0,0,i])
                        #cube([30, track[1]+5,2.5],center=true);
            }
    }
}

*slide(magnetic=true);
translate([50,0,(track[0]/2)]) rotate([90,90,0]) contact_pieces(reduced_contact=1);
translate([110,0,(track[0]/2)]) rotate([90,90,0]) contact_pieces(reduced_contact=1, thick=1.75);
translate([-50,0,(track[0]/2)]) rotate([90,90,0]) contact_pieces(reduced_contact=1, thick=1.65);
*translate([50,50,(track[0]/2)]) rotate([90,90,0]) contact_pieces(reduced_contact=1);
*translate([-50,0,0])slide(mount=false);
include<inc/configuration.scad>
use<inc/functions.scad>

h=40;
w=track[1]+9.5;
