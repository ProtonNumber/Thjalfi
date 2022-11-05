$fn = 500;

module fin() {
    translate([-1.5, 0, 110]) rotate([0, 90, 0]) linear_extrude(3) {
        polygon([[0, 0], 
                [106, 63.5], 
                [140, 49.7], 
                [110, -8.35],
                [70, -8.35],
                [70, -11],
                [0, -11]]);
    }
}

module thrustRing() {
    difference() { 
        union() {
            translate([0, 0, 10]) cylinder(d = 53.8, h = 10);
            difference() {
                cylinder(d = 50.8, h = 10);
                cube([3, 60, 20], true);
                cube([60, 3, 20], true);
            }
        }
        cylinder(d = 31, h = 20);
    }
}

module boattailQuadrant() {
    radius = 110 ^ 2 / (53.8-37) + (53.8-37)/4;
    !difference() {
        rotate([180, 0, 0]) intersection() {
            rotate_extrude() intersection() {
                translate([-radius+53.8/2, 0, 0]) difference() {
                    circle(radius);
                    circle(radius - 2);
                }
                square([53.8, 110]);
            }
        translate([1.5, 1.5, 0]) cube([27, 27, 110]);
        }   
        translate([0, 0, -110]) cylinder(d=36.4, h = 35);
    }
}

module godnutRing() {
    difference() {
        cylinder(d = 47.8, h = 20);
        cylinder(d = 31, h = 20);
        translate([19.5, 0, 0]) cylinder(d = 3, h = 20);
        translate([0, 0, 10]) for(i = [0:1:3]) {
            rotate([90, 0, 45 + 90 * i]) cylinder(d = 3, h = 60);
        }
    }
}

module retainer() {
    difference() {
        cylinder(d = 36, h = 35);
        cylinder(d = 31, h = 35);
    }
}

module motorTube() {
    difference() {
        cylinder(d = 30.7, h = 240);
        cylinder(d = 28.8, h = 240);
    }
}

module assembly() {
    retainer();
    translate([0, 0, 15]) motorTube();
    translate([0, 0, 3]) for(i = [0:1:3]) {
        rotate(90 * i) translate([0, 0, 110])boattailQuadrant();
        rotate(90 * i) translate([0, 53.8/2, 0]) fin();
    }
    translate([0, 0, 103]) thrustRing();
    translate([0, 0, 235]) godnutRing();
}

assembly();