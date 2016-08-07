
h=1.175*25.4;
w=2.750*25.4;
head=12;
plate=9;
center=1.175*25.4;
ptc_r=6.5;
left_hole=0.45*25.4;
right_hole_1=0.8*25.4;
right_hole_2=0.3*25.4;

difference() {
    union() {
        translate([-(center-(w/2)),0,-plate/2])
            cylinder(d=head+0.3, h=4.76+plate,$fn=30);
        roundcube([w,h,plate],center=true);
    }
    #translate([-(center-(w/2)),0,-plate/2])
    {
        cylinder(d=4.1+0.3, h=4.76+plate);
        cylinder(r=ptc_r+0.1, h=7, $fn=60);
    }
    #translate([-(left_hole-(w/2)),0,-plate/2])
    hull() {
        cylinder(d=M5, h=4.76+plate);
        translate([12,0,0])cylinder(d=M5, h=4.76+plate);
        }
    #translate([(right_hole_1-(w/2)),0,-plate/2])
    #hull() {
        cylinder(d=M5, h=4.76+plate);
        translate([right_hole_2-right_hole_1,0,0]) 
        cylinder(d=M5, h=4.76+plate);
    }
}



use <inc/functions.scad>
include<inc/configuration.scad>
