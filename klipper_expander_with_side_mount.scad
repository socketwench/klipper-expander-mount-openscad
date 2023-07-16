module mountFlangeOutline() {
    mount_points = [
        [0,0],
        [0,15],
        [15,15],
        [17,5],
        [68,5],
        [70,15],
        [85,15],
        [85,0],
    ];

    mount_lines = [
        [0,1,2,3,4,5,6,7]
    ];

    polygon(mount_points, mount_lines); 
}

module mountFlangeProfile() {
    difference() {
        mountFlangeOutline();
        
        translate([8,7.5,0]) {
            circle(d = 5.8, $fn = 50);
        }
        
        translate([85-8,7.5,0]) {
            circle(d = 5.8, $fn = 50);
        }
    }
}

module mountFlangeProfileRounded() {
    union() {
        difference() {
            mountFlangeProfile();
            
            translate([0,13]) {
                square(2);
            }
            
            translate([14,13]) {
                square(2);
            }
            
            translate([69,13]) {
                square(2);
            }

            translate([83,13]) {
                square(2);
            }
        }
        
        translate([2,13]) {
            circle(2, $fn = 50);
        }
        
        translate([13.3,13]) {
            circle(2, $fn = 50);
        }
        
        translate([71.7,13]) {
            circle(2, $fn = 50);
        }

        translate([83,13]) {
            circle(2, $fn = 50);
        }
    }
}

module mountFlange() {
    linear_extrude(4, false) {
        mountFlangeProfileRounded();
    }
}

module klipperBox(h = 10) {
    difference()  {
        // Base dimentions from https://www.printables.com/model/228244-klipper-expander-mount-for-aluminum-extrusions
        cube([105, 29, h+1]);
        
           
        union()  {
            // Interior empty space
            translate([2,2,1]) {
                cube([101, 22.6, h+1]);
            }
            
            translate([2, 2, h-0.4]) {
                // The Klipper Expander bounding box.
                cube([101, 24.6, 20]);
            }
            
            translate([15, 1.2, h-0.4]) {
                // USB cutout
                cube([11, 10, 2]);
            }
        };
    };
}

module klipperMountingPost(h = 10) {
    difference() {
        linear_extrude(h) {
            difference () {
                union() {
                    circle(d = 10, $fn = 50);
                    square(5);
                }
                
                circle(d = 4.8, $fn = 50);
            }
        }
        
        translate([0,0,h-0.4]) {
            cylinder(h = 1, d = 6, $fn = 50);
        }
    }
}

klipperBox(h = 10);

// mounting posts
translate([6.5, 6.5, 0]) {
    rotate([0, 0, 180]) {
        klipperMountingPost(h = 10);
    }
}

translate([105 - 6.5, 6.5, 0]) {
    rotate([0,0,270]) {
        klipperMountingPost(h = 10);
    }
}

translate([10,29,0]) {
    rotate([0,0,0]) {
        mountFlange();
    }
}