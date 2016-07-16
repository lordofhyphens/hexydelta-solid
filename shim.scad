for (i=[(7+3.1)/2, -(7+3.1)/2])
  translate([0,i,5.3/2])cube([18.5, 2.8,5.3], center=true);
translate([0,0,-(12.5)/2])
mirror([0,0,1])
difference() {
  cube([39,16,12.5],center=true);
  translate([0,0,5])
    #cylinder(d=5.6, h=10, $fn=60);
}
