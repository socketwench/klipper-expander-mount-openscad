

difference()  {
    // Base dimentions from https://www.printables.com/model/228244-klipper-expander-mount-for-aluminum-extrusions
    cube([105, 29, 11]);
    
       
    union()  {
        // Interior empty space
        translate([2.4,2.4,1]) {
            cube([100, 22.6, 11]);
        }
        
        translate([2.4, 2.4, 10]) {
            // The Klipper Expander bounding box.
            cube([100, 24, 20]);
        }
        
        translate([18, 1.2, 10]) {
            // USB cutout
            cube([6, 10, 2]);
        }
    };
};

// mounting posts
translate([6.5, 6.5, 0]) {
    union() {
        difference() {
            cylinder(h = 10, d = 10, $fn = 50);
            cylinder(h = 11, d = 4, $fn = 50);
        }
        
        translate([-6, -6, 0]) {
            cube([3,3,10]);
        }
    }
}

translate([105 - 6.5, 6.5, 0]) {
    union() {
        difference() {
            cylinder(h = 10, d = 10, $fn = 50);
            cylinder(h = 11, d = 4, $fn = 50);
        }
        
        translate([2, -6, 0]) {
            cube([3,3,10]);
        }
    }
}