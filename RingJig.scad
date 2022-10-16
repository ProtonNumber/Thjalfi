$fn = 100;
difference() {
    cylinder(h = 12, d = 56);
    cylinder(h = 4, d = 54);
    cylinder(h = 8, d = 50);
    translate([0, 0, 8]) {
        cube([56, 3, 8], true);
        cube([3, 56, 8], true);
    }
}