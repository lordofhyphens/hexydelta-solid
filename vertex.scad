module wings(vertex_angles, holes=true, holes_only=false) {
  difference() {
    union() {
      translate([-wing_thickness/4,0,height/2])roundcube([track[0]+(wing_thickness*1.5), track[1]+wing_thickness,height], center=true, r=2);
      for (i = vertex_angles) 
        rotate([0,0,i]) translate([wing_length/2,0,height/2])roundcube([wing_length, wing_thickness, height ],center=true, r=2);
    }
    if (holes) {
      for (i = [-1, 1])
        for (x = [30, 40, wing_length-5])
          for (z = [base_thickness+5, (((height-10) - (base_thickness+5)) /2) + base_thickness+5, height-10])
            translate([0,i*x,z])
              rotate([0,0,-i*120])
              rotate([90,0,0])
              #cylinder(r=2.4, h=70,center=true);
    }
  }
  if (holes_only == true) {
    for (i = [-1, 1])
      for (x = [30, 40, wing_length-5])
        for (z = [base_thickness+5, (((height-10) - (base_thickness+5)) /2) + base_thickness+5, height-10])
          translate([0,i*x,z])
            rotate([0,0,-i*120])
            rotate([90,0,0])
            cylinder(r=2.4, h=70,center=true);
  }
}
module base(holes_only=false) {
  difference() {
    union() {
      wings([60,-60], holes_only=holes_only);
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

module face_mount(type="none", hole=5.5, shadow=false) 
{ // Front mounting
    if (shadow) {
        // four motor mounting holes
        difference() 
        {
            translate([10,0,center])rotate([0,90,0])#linear_extrude(height=height) stepper_motor_mount(17, tolerance=1);
            translate([10,0,center])rotate([0,90,0])cylinder(d=25, h=height);;
        }
    }
    else {
        face_distance = (type == "pulley" ? [39, 0, height/2] : [42, 0, height/2]);
        if (type != "none") {
            difference() {
                union() {
                    translate(face_distance)roundcube([wing_thickness, plate_length,height],center=true, r=1);
                    if (type == "pulley") {
                        translate([32,0,center])rotate([0,90,0]) cylinder(r2=hole/2 + 3, r1=hole/2+1, h=5, $fn=18);
                    }
                }
                if (type == "motor") {
                    translate([10,0,center])rotate([0,90,0])#linear_extrude(height=height) stepper_motor_mount(17, tolerance=0.5);
                } else {
                    translate([20,0,center])rotate([0,90,0])#polyhole(d=hole, h=25);
                }

            }
            depth = ( type == "motor" ? 20 : 30);
            shift = ( type == "motor" ? 24 : 12);
            difference() {
                for (i = [plate_length/2 - wing_thickness/2, -plate_length/2 + wing_thickness/2]) 
                    translate([depth/2+shift,i,height/2]) roundcube([depth,wing_thickness,height],center=true);
                translate([18,0,((height-10)/2)+5])rotate([90,0,0])#cylinder(d=height-10, h=70,center=true);
            }
        }
    }
}

module pulley() {
    base();
    face_mount("pulley");
}
module motor() {
    difference() {
        base(); 
        translate([-30,0,0])face_mount("motor", shadow=true);
    }
    translate([-10,0,0])face_mount("motor");
}

base();
translate([100,0,0]) motor();
translate([-100,0,0]) pulley();
include<inc/configuration.scad>
use<inc/functions.scad>
use<polyholes.scad>
use<MCAD/motors.scad>
