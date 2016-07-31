// Copyright (C) 2012 Joseph Lenox
// HexyDelta 

//==========================================================================//
// Configuration file for HexyDelta OpenSCAD files                          //
// Scroll past the definition section to change basic and advanced settings //
//==========================================================================//

//====================//
// Definition Section //
//====================//

// Print the hole_calibration.scad object to dial in the next 6 settings
// Google found http://www.fairburyfastener.com/xdims_metric_nuts.htm
M8=8.4;// diameter of M8 threaded rod
M5=5.3;// diameter of M5 threaded rod
M3=3.4;// diameter of M3 threaded rod
M2_5=2.7; // diameter of M2.5 threaded rod
M8nut=13;// diameter of M8 nut flat to flat
M5nut=8;// diameter of M5 nut flat to flat
M3nut=5.6;// diameter of M3 nut flat to flat

M8nutThickness=6.8;// thickness of a standard M8 nut(nylock is 8mm)
M5nutThickness=4.7;// thickness of a standard M5 nut(nylock is 5mm)
M3nutThickness=2.4;// thickness of a standard M3 nut

// Acme Linear Screw and Nut
ACME14=6.5;// diameter of 1/4 inch ACME threaded rod in mm
ACME14nut=12.8;// diameter of ACME 1/4 inch nut flat to flat in mm
ACME14nutThickness=6.5;// thickness of ACME 1/4 inch nut in mm

//rotary bearings
// format is IDxODxL
xx623=[3, 10, 4];
xx625=[5, 16, 6];
MF204=[4, 10, 4];
MF126=[6, 12, 4];
rotaryBearing=xx623;// for readability(can be changed if other bearings are used


//=======================//
//  Basic Config Items   //
//=======================//

count=6;
//=======================//
// Advanced Config Items //
//=======================//
$fn=8;		// default resolution for parts, decrease if part compiling or stl/gcode is unmanageable
plate_dia = 25.4*(8.5 + (1.5/12));
inset_hole=3.3+1.5;
inset_hole_r = (plate_dia / 2 ) - inset_hole;
base_thickness=5;
height=40 + base_thickness;
track=[17.4,24.5, height];
track_thickness = 2;
center=25;
mounting_screw_dia = 3.4;
plate_length=55;

tolerance=0.2;
