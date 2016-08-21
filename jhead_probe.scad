$fa=0.1;
$fs=0.1;

module e3d(tolerance=0.2, filament=2){
difference() {
  cylinder(d=16+tolerance, h=12.7); 
  translate([0,0,3])
  #difference() {
    cylinder(d=16+tolerance, h=6);
    cylinder(d=12-tolerance, h=6);
  }
 }
}

module jhead_pos(tolerance=0.2, filament=2) {
  difference() {
    cylinder(d=16-tolerance, h=5.2+4.64+3); 
    translate([0,0,3])
      difference() {
        translate([0,0,-tolerance/2])cylinder(d=16+tolerance, h=4.64+tolerance);
        translate([0,0,-tolerance/2])cylinder(d=12+tolerance, h=4.64+tolerance);
      }
    cylinder(d=filament+tolerance, h=15); 
  }
}

adapter(filament=3.6, tolerance=0.5,back=false);
translate([0,10,0])mirror([0,1,0])adapter(filament=3.6, tolerance=0.5,back=true);
module jhead(shadow=true, tolerance=0.2, filament=2) {
  if (shadow) {
    difference()
    {
      union() {
        cylinder(d=25, h=15); 
        translate([0,0,5])cube([40,10,10],center=true);
      }
      jhead_pos(tolerance=tolerance, filament=filament);
      cylinder(d=filament+tolerance, h=15); 
      for (i=[15,-15])
        translate([i,10,5]) rotate([90,0,0]) cylinder(d=3.2,h=20);
    }
  }
}

module adapter(tolerance=0.2, filament=3, back=true)
{
  difference()
  {
    union(){
      translate([0,0,8+37.5-8])jhead_pos(tolerance=0.3, filament=0, shadow=true);
      translate([-7,7,-2.5 + 11.5])
      cube([35,5,21], center=true);
      translate([0,6/2,30/2+8 + 11.5/2])
      cube([21,6+7,35-11.5], center=true);
    }
    if (back) {
        translate([0,0,11.5]) {
            #translate([0,20,02])cube([60,40,120], center=true);
            #translate([-7,-1,5])cube([35,5+7,16], center=true);
      }
    }
    else {
        translate([0,0,11.5])
            #translate([-19,20,-5.5-5]){
                rotate([90,0,0])cylinder(r=1.2, h=40);
                #translate([22.5,0,10.3]) rotate([90,0,0])cylinder(r=1.2, h=40);
            }
      #translate([0,20,32+11.5])cube([60,40,40], center=true);
      #translate([-7,-1,-5+11.5])cube([35,5+7,16], center=true);
    }
  }
}

