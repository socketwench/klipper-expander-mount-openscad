difference()  {
    // Base dimentions from https://www.printables.com/model/228244-klipper-expander-mount-for-aluminum-extrusions
    cube([105, 29, 11]);
    
    // 2020 mounting hole
    translate([15,29-5,5.5]) {
        rotate([90,0,180]) {
            union() {
                cylinder(h = 6, d = 3.2, $fn = 50);
                cylinder(h = 2.5, d = 5.8, $fn = 50);
            }
        }
    }
    
    // 2020 mounting hole
    translate([105-15,29-5,5.5]) {
        rotate([90,0,180]) {
            union() {
                cylinder(h = 6, d = 3.2, $fn = 50);
                cylinder(h = 2.5, d = 5.8, $fn = 50);
            }
        }
    }
    
    union()  {
        // Interior empty space
        translate([2,2,1]) {
            cube([101, 22.6, 11]);
        }
        
        // The Klipper Expander bounding box.
        translate([2, 2, 9.6]) {
            cube([101, 24.6, 20]);
        }
        
        // USB cutout
        translate([15, 1.2, 9.6]) {
            cube([11, 10, 2]);
        }
    };
};

// mounting posts
translate([6.5, 6.5, 0]) {
    union() {
        difference() {
            cylinder(h = 9.6, d = 10, $fn = 50);
            cylinder(h = 11, d = 4.8, $fn = 50);
        }
        
        translate([-6, -6, 0]) {
            cube([4,4,9.6]);
        }
    }
}

translate([105 - 6.5, 6.5, 0]) {
    union() {
        difference() {
            cylinder(h = 9.6, d = 10, $fn = 50);
            cylinder(h = 11, d = 4.8, $fn = 50);
        }
        
        translate([2, -6, 0]) {
            cube([4,4,9.6]);
        }
    }
}