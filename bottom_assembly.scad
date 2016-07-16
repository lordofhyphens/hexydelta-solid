use<vertex.scad>

for (i = [1:1:6]) {
  rotate([0,0,i*60])translate([120,0,0])mirror([1,0,0])
  if (i % 2 == 0) {
    base();
  } else { 
    motor();
  }
}

translate([0,0,100])
mirror([0,0,1])
for (i = [1:1:6]) {
  rotate([0,0,i*60])translate([120,0,0])mirror([1,0,0])
  if (i % 2 == 0) {
    base();
  } else { 
    pulley();
  }
}
