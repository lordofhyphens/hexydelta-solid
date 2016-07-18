module buildplate() {
  difference() {
    cylinder(d=plate_dia, h=3, $fn=30);
    for (i = [0:60:300]) {
      #rotate([0,0,i]) translate([inset_hole_r,0,-3]) cylinder(d=3.1, h=9);
    }
  }
}
module buildplate_holes(d=3.1) {
    for (i = [0:60:300]) {
      #rotate([0,0,i]) translate([inset_hole_r,0,-3]) cylinder(d=d, h=9);
    }
}

*translate([0,0,plate_height])rotate([0,0,30])buildplate();
base_set(holes_only=false);

difference() {
  union() {
    for (i = [30:60:330]) {
      rotate([0,0,i])translate([(plate_dia/2)+(5/2)+11.7,0,plate_height/2]) {
        roundcube([5,95,plate_height],center=true);
        translate([-15,0,0])roundcube([30,10,plate_height],center=true);
      }
    }
  }
  base_set(cutout = true, gaps = false);
  translate([0,0,plate_height-3])rotate([0,0,30])buildplate_holes();
}

// placement of vertices, based on bed plate/size.
module base_set(cutout = false, gaps = true) {
  for (i = [0, 3, -2, 2, -1])
    rotate([0,0,60*i])
      translate([(plate_dia/2) + 25,0,0]) rotate([0,0,180])base(holes=gaps, holes_only=cutout);
}

use<vertex.scad>
use<inc/functions.scad>
include<inc/configuration.scad>
plate_height = height + 5; // how far to put the build plate above the vertex points
