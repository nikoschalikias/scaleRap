renderpart=3;

// good to keep this >= 0.5
flap__back_clearance=0.6;
$fn=200;

if(renderpart == 3) {
    translate([1, 6+flap__back_clearance, -4]) rotate([min(120*$t, 90),0,0])  flap();
    translate([0, 23, -20]) rotate([90,0,0])  duct();
    color("red", 0.5) translate([0,0,-20])rotate([90,0,0])import("e3d_v6_duct.stl");
} else if(renderpart == 2) {
    translate([1,6,6])rotate([90,0,0])flap();
} else {
    translate([9.25, 40, 23]) rotate([180,0,0]) duct();
}


module flap() {
    union() {
        difference() {
            union() {
                difference() {
                    translate([19, -4, 4]) rotate([90,0,0])cylinder(h=2, r=19);
                    translate([-1,-6.1,0]) cube([40, 2.2, 40]);
                    translate([36.5,-6.1,-6]) cube([5,12.2,12]);
                }
                translate([-1, 0, 0]) rotate([0,90,0])cylinder(h=39-1.5, r=6, $fn=200);
                translate([35, 0, 0]) rotate([0,90,0])cylinder(h=2, r=3.5, $fn=100);
            }
            translate([3, -4, -6.5]) cube([31.1-1.5, 13, 13]);
            translate([25, 0, 0]) rotate([0,90,0])cylinder(h=20, r=5.3/2, $fn=100);
            
            translate([-0.9, 0, 0]) rotate([0,90,0]) servoArm(0.2);
        }
    }
    
    if(renderpart == 3) {
        color("white") translate([-1, 0, 0]) rotate([0,90,0]) difference() {
            servoArm();
            
            difference() {
                cylinder(h=5, r=55);
                cylinder(h=5, r=5.99);
            }
            
        }
        
    }
}


module duct() {
    corner_r = 4;
    
    difference() {
        union() {
            difference() {
                union() {
                    difference() {
                        union() {
                            translate([corner_r,corner_r-3,0]) minkowski(){
                                cube([40-(corner_r*2),43-(corner_r*2),22]);
                                cylinder(r=corner_r,h=1);
                            }
                            // servo mounts
                            translate([-9.3, -3, 23-(12+flap__back_clearance)]) cube([14, 12.5, 12+flap__back_clearance]);
                            translate([-9.3, 10+23, 23-(12+flap__back_clearance)]) cube([14, 7, 12+flap__back_clearance]);
                        }

                        translate([20,20,-0.1]) cylinder(h=23.2, r=18.5);
                        difference() {
                            scale([1,0.85,1]) translate([20,20,-1]) cylinder(h=23.2, r1=19.5, r2=21);
                            translate([0,9,-10]) cube([40, 40, 40]);
                        }
                    }
                    translate([0, 9.5, 0]) cube([40, 13, 23]);
                                
                    
                    
               }
               
               translate([1-0.15+1-0.18, 9, -0.1]) cube([36.3+0.36, 14, 23.2]);
               translate([37.5, 20-4, 23-(6+flap__back_clearance)]) rotate([0,90,0])cylinder(h=5, r=4.15, $fn=100);
               
               
               translate([-0.5, 10,11+(6-flap__back_clearance)]) union() {
                   //translate([0,-0.5,0]) cube([1.5, 13, 6.6+flap__back_clearance ]);
                   translate([0, 6, 0]) rotate([0,90,0]) cylinder(h=5, r1=6.5, r2=8);
                   translate([-0.1,0.2+2.25,0]) cube([5, 7.5, 6.2+flap__back_clearance]);
               }
               
               // servo mount holes
               translate([-9.4,10-2.4,17-flap__back_clearance]) rotate([0,90,0]) cylinder(h=6.1, r=1);
               translate([-9.4,10+22.5+2.4,17-flap__back_clearance]) rotate([0,90,0]) cylinder(h=6.1, r=1);
               
               //servo gear pin notch
               translate([-0.1,16,(17-flap__back_clearance)-3]) cube([2.1, 12, 6]);
               
           }
          translate([0, 16,12-flap__back_clearance])difference() {
               translate([0,-1,0])cube([4, 21, 11+flap__back_clearance]);
               translate([-0.1,0.2-3.75,5]) cube([5, 7.5, 6.2+flap__back_clearance]);
               translate([-0.1,0,5])rotate([0,90,0]) cylinder(h=5, r1=6.5, r2=8);
              //servo gear pin notch
              translate([-0.1,0,5-3]) cube([2.1, 12, 6]);
          }
       }
       //fan mount holes
       translate([4,4,-0.5]) cylinder(h=24, r=1.8);
       translate([4,36,-0.5]) cylinder(h=24, r=1.8);
       translate([36,4,-0.5]) cylinder(h=24, r=1.8);
       translate([36,36,-0.5]) cylinder(h=24, r=1.8);
   }
}



module servoArm(overfill=0) {
    union() {
        translate([0,0,-overfill]) cylinder(h=4+(overfill*2), r=3.5);
        translate([6.5/2, 0, 4]) rotate([90,90,180]) hull() {
            wedge([1.5+overfill, 6.5,16]);
            translate([0, 6.5/2, 16]) rotate([0,90,0])cylinder(h=1.5+overfill, r=2);
        }
    }
    
}


module wedge(size) {
	p = [
		[0,0,0],
		[size[0],0,0],
		[size[0],size[1],0],
		[0,size[1],0],
		[size[0],size[1]/2,size[2]],
		[0,size[1]/2,size[2]]
	];
	f = [
		[0,1,4], //front
		
		[1,2,4], // right
		[2,5,4],

		[2,3,5], // back
		
		[3,0,5], // left
		[4,5,0],
		
		[1,0,3], // bottom
		[2,1,3]
	];
	polyhedron(points=p,faces=f);
}