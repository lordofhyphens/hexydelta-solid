
count=6;
wing_length=60;
wing_thickness=7.5;
base_thickness=5;
height=40 + base_thickness;
track=[17.4,24.5, height];
center=25;
mounting_screw_dia = 3.4;
plate_length=55;
module wings(vertex_angles, holes=true) {
    difference() {
      union() {
        translate([-wing_thickness/4,0,height/2])roundcube([track[0]+(wing_thickness*1.5), track[1]+wing_thickness,height], center=true);
        for (i = vertex_angles) 
          rotate([0,0,i]) translate([wing_length/2,0,height/2])roundcube([wing_length, wing_thickness, height ],center=true);
      }
      if (holes) {
      for (i = [-1, 1])
        for (x = [30, 40, wing_length-5])
        for (z = [base_thickness+5, ((height-10) - (base_thickness+5)) /2, height-10])
        translate([0,i*x,z])
          rotate([0,0,-i*120])
          rotate([90,0,0])
          #cylinder(r=2.4, h=70,center=true);
      }
    }
}
module base() {
  difference() {
    union() {
      wings([60,-60]);
      hull() {
        linear_extrude(height=base_thickness) projection(cut=false)wings([60,-60]);
      }
    }
    #translate([0,0,height/2])cube(track, center=true);
    #translate([-22,0,center])rotate([0,90,0]) polyhole(d=5.5, h =60);
    #translate([-13,0,center])rotate([0,90,0]) cylinder(d=M5nut+tolerance, h=M5nutThickness, $fn=6);
    for (i = [1, -1]) {
      translate([0,i*20,0]) #polyhole(d=mounting_screw_dia, h=base_thickness);
      translate([22,i*17,0]) #polyhole(d=mounting_screw_dia, h=base_thickness);
      translate([27,i*30,0]) #polyhole(d=mounting_screw_dia, h=base_thickness);
      translate([34,i*38,0]) #polyhole(d=mounting_screw_dia, h=base_thickness);
    }
  }
}

module face_mount(type="none", hole=5.5) 
{ // Front mounting
  if (type != "none") {
    difference() {
      union() {
        translate([40,0,height/2])roundcube([wing_thickness, plate_length,height],center=true);
        if (type == "pulley") {
          translate([32,0,center])rotate([0,90,0]) cylinder(r2=hole/2 + 3, r1=hole/2+1, h=5);
        }
      }
      if (type == "motor") {
        translate([10,0,center])rotate([0,90,0])#linear_extrude(height=height) stepper_motor_mount(17);
    } else {
      translate([20,0,center])rotate([0,90,0])#polyhole(d=hole, h=25);
    }

    }

    difference() {
      for (i = [plate_length/2 - wing_thickness/2, -plate_length/2 + wing_thickness/2]) 
        translate([30/2+12,i,height/2]) roundcube([30,wing_thickness,height],center=true);
      translate([18,0,((height-10)/2)+5])rotate([90,0,0])#cylinder(d=height-10, h=70,center=true);
    }
  }
}

module pulley() {
  base();
  face_mount("pulley");
}
module motor() {
  base(); 
  face_mount("motor");
}

base();
include<inc/configuration.scad>
use<inc/functions.scad>
use<polyholes.scad>
use<MCAD/motors.scad>
