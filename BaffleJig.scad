$fn = 100;
difference() {
    cylinder(h = 14, d = 54);
    cylinder(h = 6, d = 50.2);
    cylinder(h = 10, d = 46.2);
    translate([0, 0, 3]) {
        rotate([0, 90, 0]) cylinder(h = 55, d = 3, center = true);  
        rotate([90, 0, 0]) cylinder(h = 55, d = 3, center = true);
    }
    for(i = [0 : 1 : 6]) {
        rotate([0, 0, i * 60]) {
            translate([17, 0, 0]) cylinder(h = 14, d = 5);
            translate([10, 0, 0]) cylinder(h = 14, d = 5);
        }
    }
}