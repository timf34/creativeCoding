final int RADIUS = 200; // the radius of the circle

void setup() {
    size(800, 800, P3D); // set the size of the window
    background(0); // set the background color to black
}

void draw() {
    background(0); // refresh the background
    fill(255); // set the fill color to white
    float cameraZ = (height / 2) / tan(PI / 6); // Distance from the camera to the origin
    
    float cameraX = width / 2; // X-coordinate of the camera (centered)
    float cameraY = height / 2; // Y-coordinate of the camera (centered)
    float cameraAngle = 180;
    
    // float cameraOffsetX = cos(cameraAngle) * cameraZ; // Offset the camera's X-coordinate
    float cameraOffsetY = sin(cameraAngle) * cameraZ; // Offset the camera's Y-coordinate
    
    camera(cameraX, cameraY - cameraOffsetY, cameraZ, cameraX, cameraY, 0, 0, -1, 0);
    ellipse(width / 2, height / 2, RADIUS, RADIUS); // draw a circle at the center of the window
}

