$fn=200;

// Debug stuff:
do_bottom_duct=true; // should be true for final piece
show_E3D_v6_fan_clip=false; // should be false for final piece

// these can slightly change to look of the object:
corner_r = 4;
wall_factor=1.5;
corner_r2 = 3;


/*rotate([180-45,0,0])*/ difference() {
    union() {
        difference() {
            translate([4,4,0]) minkowski(){
                cube([40-(corner_r*2),40-(corner_r*2),1]);
                cylinder(r=corner_r,h=1);
            }
            translate([20,20,-0.1]) cylinder(h=2.2, r=18);
        }
        difference() {
            union() {            
                hull() {
                    translate([5,19.25-(2.8284/2),29.55-(2.8284/2)])rotate([-45,0,0]) translate([corner_r2-wall_factor, corner_r2-wall_factor, 0]) {
                        minkowski(){
                            cube([30+(wall_factor*2)-(corner_r2*2),30+(wall_factor*2)-(corner_r2*2),1]);
                            cylinder(r=corner_r2,h=1);
                        } // MINKOWSKI
                    } // 
                    
                    difference() {
                        translate([20,20,-0.1]) cylinder(h=2.2, r=18+wall_factor);
                        translate([0,0,-0.1]) cube([40,20,2.2]);
                    } // DIFFERENCE
                } // HULL
                if(do_bottom_duct) {
                    bottom_duct();
                }
            } // UNION
            
            hull() {
                translate([5+(wall_factor/2),19.25-(2.8284/2)+(wall_factor/2),29.55-(2.8284/2)-(wall_factor/2)])rotate([-45,0,0]) translate([corner_r2-wall_factor/2, corner_r2-wall_factor/2, 0]) union() {
                    difference() {
                        minkowski(){
                            cube([30-(corner_r2*2),30-(corner_r2*2),1]);
                            cylinder(r=corner_r2,h=1);
                        } // MINKOWSKI
                    } // DIFFERENCE
                } // UNION
                
                difference() {
                    translate([20,20,0]) cylinder(h=2, r=18-(wall_factor/2));
                    translate([0,0,-0.1]) cube([40,20,2.2]);
                } // DIFFERENCE
            } // HULL
            
            
            translate([5,19.25-(2.8284/2),29.55-(2.8284/2)]) rotate([-45,0,0]) union() {
                translate([0,-wall_factor,2]) cube([30,20,10+wall_factor+0.1]);
            }
            
            translate([5,19.25-(2.8284/2),29.55-(2.8284/2)]) rotate([-45,0,0]) union() {
                translate([0,-wall_factor,2]) cube([30,20,2+wall_factor]);
            }
            
            
            
            
        } // DIFFERENCE
        translate([5,19.25-(2.8284/2),29.55-(2.8284/2)])rotate([-45,0,0]) translate([corner_r2-wall_factor/2, corner_r2-wall_factor/2, 0]) difference() {
            minkowski(){
                cube([30+wall_factor-(corner_r2*2),30+wall_factor-(corner_r2*2),1]);
                cylinder(r=corner_r2,h=1);
            } // MINKOWSKI
            translate([15-corner_r2,15-corner_r2,-0.1]) cylinder(h=2.2, r=13.5);
                    
            //translate([3+(wall_factor/2)-corner_r2,3+(wall_factor/2)-corner_r2,-0.1]) cylinder(h=2.2, r=1.6);
            //translate([27+(wall_factor/2)-corner_r2,3+(wall_factor/2)-corner_r2,-0.1]) cylinder(h=2.2, r=1.6);
            translate([3+(wall_factor/2)-corner_r2,27+(wall_factor/2)-corner_r2,-0.1]) cylinder(h=2.2, r=1.6);
            translate([27+(wall_factor/2)-corner_r2,27+(wall_factor/2)-corner_r2,-0.1]) cylinder(h=2.2, r=1.6);
        } // DIFFERENCE
        difference() {
            translate([5,19.25-(2.8284/2),29.55-(2.8284/2)]) rotate([-45,0,0]) union() {
                translate([-wall_factor,-corner_r2,0]) cube([30+wall_factor*2,wall_factor*2,10+wall_factor]);
                translate([-wall_factor,-wall_factor*2,0]) cube([corner_r2*2, 6.5, 10+wall_factor]);
                translate([30-corner_r2*2+wall_factor,-wall_factor*2,0]) cube([corner_r2*2, 6.5, 10+wall_factor]);
            }
            
            
            difference() {
                translate([-5,-5,-5])cube([50,50,100]);
                bottom_duct(true);
            }
            
            translate([5,19.25-(2.8284/2),29.55-(2.8284/2)]) rotate([-45,0,0]) union() {
                translate([0,-wall_factor,2]) cube([30,20,10+wall_factor+0.1]);
            }
        } // DIFFERENCE
        translate([5,19.25-(2.8284/2),29.55-(2.8284/2)])rotate([-45,0,0]) translate([corner_r2-wall_factor/2, corner_r2-wall_factor/2, 0]) {
            translate([3+(wall_factor/2)-corner_r2,3+(wall_factor/2)-corner_r2,0]) cylinder(h=4, r=1.1);
            translate([27+(wall_factor/2)-corner_r2,3+(wall_factor/2)-corner_r2,0]) cylinder(h=4, r=1.1);
        } // 
        difference() {
            translate([1.5+37, 20-wall_factor*1.25, -1]) rotate([3,0,0]) rotate([0,0,90])wedge([wall_factor*1.5, 37, 300]);
            translate([0, 20-wall_factor*3, 30]) rotate([3,0,0]) cube([40, (wall_factor*3), 500]);
        }
    } // UNION
    translate([4,4,-0.1]) cylinder(h=6.1, r=1.6);
    translate([36,4,-0.1]) cylinder(h=6.1, r=1.6);
    translate([4,36,-0.1]) cylinder(h=6.1, r=1.6);
    translate([36,36,-0.1]) cylinder(h=6.1, r=1.6);
    
    translate([4,4,2]) rotate([0,0,6.5]) cylinder(h=4, r=6/2, $fn=6);
    translate([36,4,2]) rotate([0,0,-6.5]) cylinder(h=4, r=6/2, $fn=6);
    translate([4,36,2]) rotate([0,0,-6.5]) cylinder(h=4, r=6/2, $fn=6);
    translate([36,36,2]) rotate([0,0,6.5]) cylinder(h=4, r=6/2, $fn=6);
    
    /*
    translate([-5,-5,(550*$t)/10]) cube([50,50,200]);
    translate([-5,-5,-199.99]) cube([50,50,200]);
    */
    
    translate([-5,-5,-50]) cube([50,50,50]);
} // DIFFERENCE

if(show_E3D_v6_fan_clip) {
    /*rotate([180-45,0,0])*/ translate([0,-15.05,15.05]) rotate([-45,0,0]) union() {
        color("blue", 0.5) translate([20,18+26,49.54]) rotate([0,-90,180]) import("V6.6_Duct.stl");
    }
}
module bottom_duct(hull_only=false) {
    translate([0,0,0]) difference() {
        hull() difference(){
            union(){
                translate([20,20,0]) cylinder(h=10, r1=19, r2=18.6);
                translate([20,20,10]) cylinder(h=10, r1=18.6, r2=17.25);
                translate([20,20,20]) cylinder(h=10, r1=17.25, r2=14.6);
                translate([20,20,30]) cylinder(h=10, r1=14.6, r2=10.7);
                translate([20,20,40]) cylinder(h=10, r1=10.7, r2=6.7);
                translate([20,20,50]) cylinder(h=10, r1=6.7, r2=3);
                
                translate([8, 18.5, 0]) cylinder(h=60, r=4);
                translate([8+24, 18.5, 0]) cylinder(h=60, r=4);
                translate([20, 18-1, 0]) cylinder(h=60, r=11);
            }
            
            translate([0,0,30])rotate([45,0,0]) cube([40, 80, 40]);
            translate([0,20-0,0]) rotate([-3,0,0]) cube([40,40,60]); 
        }
        translate([20, 40,30])rotate([45,0,0]) cylinder(h=50, r=8);
        translate([20, 27+5,20])rotate([20,0,0]) translate([0,0,14.7])cylinder(h=30, r2=5.2, r1=12.25);
        if(!hull_only) {
            translate([0,0,0])difference() {
                hull() difference(){
                    union(){
                        translate([20,20,0]) cylinder(h=10, r1=19-wall_factor, r2=18.6-wall_factor);
                        translate([20,20,10]) cylinder(h=10, r1=18.6-wall_factor, r2=17.25-wall_factor);
                        translate([20,20,20]) cylinder(h=10, r1=17.25-wall_factor, r2=14.6-wall_factor);
                        translate([20,20,30]) cylinder(h=10, r1=14.6-wall_factor, r2=10.7-wall_factor);
                        translate([20,20,40]) cylinder(h=10, r1=10.7-wall_factor, r2=6.7);
                        translate([20,20,50]) cylinder(h=10, r1=6.7, r2=3);
                        
                        translate([8+wall_factor, 18.5, 0]) cylinder(h=60, r=4-(wall_factor/2));
                        translate([8+24-wall_factor, 18.5, 0]) cylinder(h=60, r=4-(wall_factor/2));
                        translate([20, 18+wall_factor-1, 0]) cylinder(h=60, r=11-(wall_factor/2));
                    }
                    
                    translate([0,0,30])rotate([45,0,0]) cube([40, 80, 40]);
                    translate([0,20-wall_factor,0]) rotate([-3,0,0]) cube([40,40,60]); 
                }
                translate([20, 40-wall_factor,30])rotate([45,0,0]) cylinder(h=50, r=8+(wall_factor/2));
                translate([20, 27+5-wall_factor,20])rotate([20,0,0])  translate([0,0,14.5])cylinder(h=30, r2=5.2+(wall_factor/2), r1=12.25+(wall_factor/2));
                translate([20, 27+5-wall_factor,20])rotate([20,0,0])  translate([0,0,14.5-6])cylinder(h=6, r2=12.25+(wall_factor/2), r1=10.2+(wall_factor/2));
            }
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