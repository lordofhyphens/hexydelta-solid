// Simple spool holder to clamp onto shelf track.

center=40;
length=100;
hole_spacing=8;
hull(){
    cylinder(d=center, h=5, $fn=60);
    translate([center/2-(center/4),0,100]) cylinder(d=center/4, h=5, $fn=60);
}
hull(){
    translate([5,0,90])cylinder(d=center/4, h=5, $fn=60);
    translate([center/2-(center/4)+5,0,100]) cylinder(d=center/4, h=5, $fn=60);
}
difference() {
    roundcube([center+15, center+15, 5],center=true);
    for(i=[-(center+15-hole_spacing)/2, (center+15-hole_spacing)/2]){
        for(j=[-(center+15-hole_spacing)/2, (center+15-hole_spacing)/2]){
            #translate([i, j, -5/2]) cylinder(d=M5+1.5,h=10);
        }
    }
}

translate([center+60,0,0])
{
    difference() {
        roundcube([center+15, center+15, 5],center=true);
        for(i=[-(center+15-hole_spacing)/2, (center+15-hole_spacing)/2]){
            for(j=[-(center+15-hole_spacing)/2, (center+15-hole_spacing)/2]){
                #translate([i, j, -5/2]) cylinder(d=M5,h=10);
            }
        }
    }
    difference() {
        shim();
#        translate([0,0,-50-(5/2)])roundcube([100,100,100], center=true);
    }

    difference() {
        translate([0,0,(track[1]-5)/2])roundcube([center+15, center+15, track[1]-5],center=true);
        for(i=[-(center+15-hole_spacing)/2, (center+15-hole_spacing)/2]){
            for(j=[-(center+15-hole_spacing)/2, (center+15-hole_spacing)/2]){
                #translate([i, j, -5/2]) cylinder(d=M5,h=50);
            }
        }       #translate([0,0,11])rotate([0,90,0])cube(track,center=true);
    }
}
use<shim.scad>
use<inc/functions.scad>
include<inc/configuration.scad>
