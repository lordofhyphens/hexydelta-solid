use <inc/functions.scad>
mirror([1,0,0])
translate([-33,-35,-7])
{
  shift=9.4;
  rotate([0,0,90])linear_extrude(height=15+7-shift)projection(cut=false)import("STL/T1_extruder_v0.9.stl");
  translate([0,0,20-shift])
    rotate([0,0,90])import("STL/T1_extruder_v0.9.stl");
}
tolerance=0.3;
fudge_distance=0;
wheels = 4;
echo("Tolerance: ", tolerance);

mirror([0,0,1])xcarriage(plate=plate,mountpoints=1, wheels=wheels);
*translate([60,0,0])mirror([0,0,1])mate_plate(plate=plate,mountpoints=1, wheels=wheels);

module xcarriage(plate, mountpoints=1, wheels=4, sepwidth=25, shift=[], padding=35) {
  scaled_plate = [track[0]+40, height, 7];

  difference() {
  union() 
  {
    translate([0,0,scaled_plate[2]/2])roundcube(scaled_plate, percent=5, center=true);
    translate([0,0,scaled_plate[2]/2])roundcube(scaled_plate, center=true);
  }

    // gaps for attachment points
    translate([0,fudge_distance/2,0])
    { // holes for v wheel mounting
      for (i = [1 , -1])
        if (i == 1 || wheels == 4) {
          color("blue")translate([0,i*(scaled_plate[1]-10)/2, 0]) 
          {
            #translate([-scaled_plate[0]/2 + M5nut, 0,0])
            {
              cylinder(r=M5/2 + tolerance, h=scaled_plate[2],  $fs=0.1);
            }
            #translate([scaled_plate[0]/2 - M5nut,0,0])
            {
              cylinder(r=M5/2 + tolerance*2, h=scaled_plate[2],  $fs=0.1);
            }
          }
        } else {
          color("blue")translate([0,i*scaled_plate-5, 0]) 
          {
            cylinder(r=M5/2 + tolerance*2, h=scaled_plate[2],  $fs=0.1);
          }
        }
    }
  }
}
module mate_plate(plate, mountpoints=1, wheels=4, sepwidth=5, shift=[], padding=5) {
  scaled_plate = [track[1]+40, height, track[0]];

  difference() {
  union() 
  {
    translate([0,0,scaled_plate[2]/2])roundcube(scaled_plate, percent=5, center=true);
    translate([0,0,scaled_plate[2]/2])roundcube(scaled_plate, center=true);
  }

    // gaps for attachment points
    translate([0,fudge_distance/2,0])
    { // holes for v wheel mounting
      for (i = [1 , -1])
        if (i == 1 || wheels == 4) {
          color("blue")translate([0,i*(scaled_plate[1]-10)/2, 0]) 
          {
            #translate([-scaled_plate[0]/2 + M5nut, 0,0])
            {
              cylinder(r=M5/2 + tolerance, h=scaled_plate[2],  $fs=0.1);
            }
            #translate([scaled_plate[0]/2 - M5nut,0,0])
            {
              cylinder(r=M5/2 + tolerance*2, h=scaled_plate[2],  $fs=0.1);
            }
          }
        } else {
          color("blue")translate([0,i*scaled_plate-5, 0]) 
          {
            cylinder(r=M5/2 + tolerance*2, h=scaled_plate[2],  $fs=0.1);
          }
        }
    }
    translate([0,0,8])rotate([90,90,0])cube([track[0]-1,track[1],track[2]+5],center=true);

  }
}

include<inc/configuration.scad>
include<inc/metric.scad>
include<MCAD/nuts_and_bolts.scad> // MCAD library
include<inc/extrusions.scad>
include<inc/vslot.scad>
use<shim.scad>

plate = [track[1]+15, track[0]+10, 7];
