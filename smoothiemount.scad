// lower-left corner = endstops
hole_d = 4;
board_dimension=[130, 111, 2];

module smoothie_holes(d1=0, d2=0,h=0, center=false) {
d2 = (d2 > 0 ? d2 : d1);
translate([-board_dimension[0]/2,-board_dimension[1]/2,0]) {
    translate([11-2, 10.67 - 2, 0]) cylinder(d1=d1, d2=d2, h=h, center=center);
    translate([103.4-2, 6 - 2, 0]) cylinder(d=d1,d2=d2, h=h, center=center);
    translate([4.5-2, 103.5-2, 0]) cylinder(d=d1,d2=d2, h=h, center=center);
    translate([103.53-2, 103.5-2, 0]) cylinder(d=d1,d2=d2, h=h, center=center);
    translate([123.4+2, 61.5-2, 0]) cylinder(d=d1, d2=d2,h=h, center=center);
    translate([123.4+2, 51.8-2, 0]) cylinder(d=d1, d2=d2, h=h, center=center);
}
}
translate([0,0,0])
difference() {
    smoothie_holes(d2=hole_d+6,d1=hole_d+10, h=3);
    smoothie_holes(d1=3, h=3);
}
difference() {
    roundcube([board_dimension[0]+16, board_dimension[1]+16,6],center=true);
    translate([0,0,5])roundcube([board_dimension[0]+10, board_dimension[1]+10,10],center=true);
    for (i = [-track[1]/2-10, track[1]/2+10, 0])
    translate([0,i,0])
    #hull() {
        translate([-track[2]/2,0,0])
        cylinder(r=6,h=20, center=true);
        translate([track[2]/2,0,0])
        cylinder(r=6,h=20, center=true);
    }
    rotate([0,0,90])
    for (i = [-track[1]/2-30, track[1]/2+40])
    translate([0,i,0])
    #hull() {
        translate([-track[2]/2-5,0,0])
        cylinder(r=6,h=20, center=true);
        translate([track[2]/2+5,0,0])
        cylinder(r=6,h=20, center=true);
    }

}

include<inc/configuration.scad>
use<inc/functions.scad>
