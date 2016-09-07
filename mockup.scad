echo(arm_length * sin(60));
echo(arm_length * cos(60));
echo(dead_zone);
module top() {
    sidewalls(switchmount=true, bedmount=false);
    for (i = [60: 60 : 360 - 60]) 
    rotate([0,0,i])
    sidewalls(switchmount=false, bedmount=false);
}
module bottom() {
    for (i = [0: 60 : 360 - 60]) 
    rotate([0,0,i])
    sidewalls(switchmount=false, bedmount=true);
}

translate([0,0,200]) 
mirror([0,0,1])
top();
bottom();

use<vertex.scad>
use<inc/functions.scad>
use<sides.scad>
include<inc/configuration.scad>
