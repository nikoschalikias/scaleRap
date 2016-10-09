//-- Blower (centrifugal) fan duct for the Direct Drive
//-- Extruder by Marty Rice.
//-- AndrewBCN - Barcelona, November 2014
//-- GPLV3

//-- based on source code by Robert Quattlebaum (darco)
//-- Thingiverse #387301

//-- uses a 5015S 12V blower (centrifugal) fan

$fs=0.1;

module FanDuct() {
	tol=0.10;
	wallThickness=1.3; // tested with 1.3mm, but original value was 0.8mm and should work too

	module Shape(dia) {
		hull() {
			cube([15.2+dia*2,20+dia*2,3],center=true);
			translate([6,0,11]) cylinder(r=6+dia,h=0.1);
		}
		hull() {
			translate([6,0,11]) cylinder(r=6+dia,h=0.1);
			translate([12.5,0,19]) rotate([10,0,90]) scale([1,0.8,1]) cylinder(r=4.2+dia*1.5,h=0.1);
		}
		hull() {
			translate([12.5,0,19]) rotate([10,0,90]) scale([1,0.8,1]) cylinder(r=4.2+dia*1.5,h=0.1);
			translate([23,0,27]) rotate([0,0,90]) scale([1,0.5,1]) cylinder(r=3.5+dia*1.5,h=0.1);
		}
	}

	difference() {
		Shape(dia=wallThickness+tol);
		Shape(dia=tol);
	}
}


FanDuct();