difference() {
union()
{
translate([0,0,9.8])
rotate([90,0,0])roundcube([30,20,15],center=true);
translate([0,(25-15)/2,15/2-0.05])
rotate([0,0,0])roundcube([20,25,15],center=true);
translate([0,5.9,15/2-0.05])
rotate([0,90,0])roundcube([15,27,30],center=true);
}
#translate([0,0,14-2]) rotate([90,0,0]) cylinder(d=4.3, h =20);
for (i = [-8, 8])
#translate([i,10,0]) cylinder(d=4, h =20,center=true);
#translate([0,(25-15)/2+5,35/2+5])rotate([0,90,0])roundcube([35,25,45],center=true);
}
use<inc/functions.scad>
