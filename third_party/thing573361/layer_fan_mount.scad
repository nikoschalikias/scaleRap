//-- Direct Drive Layer Fan Mount
//-- by AndrewBCN - Barcelona, Spain - November 2014
//-- GPLV3
//-- adds a layer fan to the Direct Drive Extruder
//-- by Marty Rice (Thingiverse #501755)

//-- this small piece is used to attach a blower fan
//-- to the direct drive extruder body

//-- also requires the layer fan duct

//-- the fan type used is the 5015S 12V centrifugal fan
//-- a.k.a 5015S blower fan
//-- (commonly available for around $2)

$fn=32;

pth=5; // plate thickness
pwi=16.5; // plate width

hth=5; // hinge cyls thickness

// plate

difference() {
  translate([pwi/2,0,pth/2]) {
    cube([pwi,10,pth], center=true);
    translate([-7,0,0]) cylinder(r=5, h=5, center=true);
  }
  // blower fan mount hole and nut trap, M4
  translate([pwi/2-7,0,pth/2]) cylinder(r=4.4/2, h=10, center=true);
  translate([pwi/2-7,0,pth]) cylinder(r=8.1/2, h=3, center=true, $fn=6);
}

// attach to extruder body
translate([hth/2,0,3]) {
  translate([0,10,pth/2]) rotate([0,90,0]) difference() {
    hull() {
      cylinder(r=7.2/2,h=hth, center=true);
      translate([3,-1,0]) cube([pth,2.2+7.2,hth], center=true);
    }
    cylinder(r=1.7,h=6, center=true); // M3 screw hole
  }

  translate([6.5+5,10,pth/2]) rotate([0,90,0]) difference() {
    hull() {
      cylinder(r=7.2/2,h=hth, center=true);
      translate([3,-1,0]) cube([pth,2.2+7.2,hth], center=true);
    }
    cylinder(r=1.7,h=6, center=true); // M3 screw hole
  }
}

