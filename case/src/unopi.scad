module roundedcube(xdim ,ydim ,zdim,rdim) {
    hull(){
        translate([rdim,rdim,0])cylinder(h=zdim,r=rdim);
        translate([xdim-rdim,rdim,0])cylinder(h=zdim,r=rdim);

        translate([rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);
        translate([xdim-rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);
    }
}

module shell(xdim, ydim, zdim) {
    translate([-1,-1, -1]) difference() {
        roundedcube(xdim+4, ydim+4, zdim+3, 3);
        translate([2,2,2]) cube([xdim, ydim, zdim+2], center =false);
    }
}

$fn = 64;


//translate([2, 1.5, 5]) import("unopi-pcb.stl");
module bottom() {
    difference() {
        union() {
            difference() {
                
                shell(87.5, 58, 20); 
                translate([82, 5, 19]) rotate([0, 90, 0]) roundedcube(14, 50, 10, 3);
                translate([6.5, 3, 4]) rotate([90, 0, 0]) roundedcube(10,5,5, 2);
                translate([22.5, 3, 4]) rotate([90, 0, 0]) roundedcube(20,7,5, 2);
                translate([50.5, 3, 6]) rotate([90, 0, 0]) roundedcube(8,6,5, 2);
                translate([-4, 22, 1]) cube([20,16,4], center = false);   
               
                }
            translate([5.5, 5, 0]) cylinder(h = 3, r = 3);
            translate([63.5, 5, 0]) cylinder(h = 3, r = 3);
            translate([63.5, 54, 0]) cylinder(h = 3, r = 3);
            translate([5.5, 54, 0]) cylinder(h = 3, r = 3);
        }
        translate([5.5, 5, -3]) cylinder(7, 4.3, 1.3);
        translate([63.5, 5, -3]) cylinder(7, 4.3, 1.3);
        translate([63.5, 54, -3]) cylinder(7, 4.3, 1.3);
        translate([5.5, 54, -3]) cylinder(7, 4.3, 1.3);
    }
}

module top() {
rotate([0, 180, 0])
translate([0,0,-5])
    difference() {
        union(){
            translate([-1, -1, 0]) roundedcube(87.5+4, 58+4, 5, 3);
            translate([5.5, 5, -17]) cylinder(h = 18, r = 3);
            translate([63.5, 5, -17]) cylinder(h = 18, r = 3);
            translate([63.5, 54, -17]) cylinder(h = 18, r = 3);
            translate([5.5, 54, -17]) cylinder(h = 18, r = 3);
        }
        translate([5.5, 5, -18]) cylinder(h = 18, r = 1.2);
        translate([63.5, 5, -18]) cylinder(h = 18, r = 1.2);
        translate([63.5, 54, -18]) cylinder(h = 18, r = 1.2);
        translate([5.5, 54, -18]) cylinder(h = 18, r = 1.2);
        for(i=[40:4:56])
            translate([-3, i, 3]) cube([100,2,10]);
        translate([43.75, 15, 3]) linear_extrude(height = 4) 
            text(text = "ZX-UNO PI", halign="center", font="Impact");
    }
    
}
//translate([-89.4, 70, 1]) bottom();
top();