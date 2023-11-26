include <screw_holes.scad>

/* main option */
hole_diameter = 35;      // Diameter of the center hole

/* other options */
disk_diameter = 111.25;  // Diameter of the circular disk
disk_height = 3.2;       // Height of the circular disk
screw_hole_distance = 5; // Distance from the edge to the center of screw holes

difference() {
    // Create the circular disk
    cylinder(h = disk_height, d = disk_diameter, $fn=100);

    // Create the center hole
    translate([0, 0, -1])
        cylinder(h = disk_height + 2, d = hole_diameter, $fn=100);

    // Create the three screw holes
    for (angle = [0:120:240]) {

        x = (((disk_diameter / 2) - screw_hole_distance) * cos(angle));
        y = (((disk_diameter / 2) - screw_hole_distance) * sin(angle));

        translate([x,y,0])
            screw_hole([8.2,2,90], M3_5, disk_height);
    }
}