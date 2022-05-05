module fin() {
    linear_extrude(3) {
        polygon([[0, 0], 
                [101, 63.5], 
                [135, 49.7], 
                [105, -8.33],
                [65, -8.33],
                [65, -11],
                [0, -11]]);
    }
}

module thrustRing() {
    difference() { 
        union() {
            translate([0, 0, 5]) cylinder(d = 53.8, h = 5);
            difference() {
                cylinder(d = 50.8, h = 5);
                cube([3, 60, 10], true);
                cube([60, 3, 10], true);
            }
        }
        cylinder(d = 31, h = 10);
    }
}
thrustRing();