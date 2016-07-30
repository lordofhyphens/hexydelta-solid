w=40;
h=34;
difference() {
    union() {
        roundcube([w+10, h+10, 5], center=true);
        translate([-10,0,0])
            translate([0,0,10])roundcube([15,15,25], center=true);
    }
    #for (i = [-1, 1]) {
        for (j = [-1, 1]) {
            translate([i*w/2, j*h/2,0])
                cylinder(d=3.4, h=10,center=true);
        }
    }
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
    translate([5,0,0])
    hull() { 
        for (i = [-1, 1])
        translate([0,i*(h-6-6)/2,0])
            cylinder(r=6, h=5,center=true);
    }
}
for (i = [-1, 1]) {
    translate([i*w/2,0,6]) 
    {
        difference() {
            hull () {
                rotate([0,90,0])cylinder(r=4, h=10,center=true);
                translate([0,0,-6])roundcube([10,h-5,5], center=true);
            }
            rotate([0,90,0])cylinder(d=3.4, h=10,center=true);
        }
    }
}
use<inc/functions.scad>
