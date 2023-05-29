final int RADIUS = 200; // the radius of the circle

CircularPlaneManager planeManager;

void setup() {
    size(800, 800, P3D); // set the size of the window
    background(0); // set the background color to black
    
    planeManager = new CircularPlaneManager();
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
    // ellipse(width / 2, height / 2, RADIUS, RADIUS); // draw a circle at the center of the window
    planeManager.updatePlane();
}

// Note, we need to move our circular plan in the z direction, just to fill out an imaginary
// semi sphere. 

class CircularPlaneManager {
    CircularPlane plane = new CircularPlane(RADIUS, 0, 100); // We are setting y to be 100 for now.
    
    void updatePlane() {
        plane.move();
        plane.display();
    }
}

class CircularPlane {
    float radius;
    float x;  // This is equivalent to x in 3D space - the x in pythagon theorem
    float y;  // This is equivalen to z in 3D space 

    CircularPlane(float radius, float x, float y) {
        this.radius = radius;
        this.x = x;
        this.y = y;
    }

    void move() {
        if (this.y > 0 ) {
            this.y -= 1;
        }
        else {
            this.y = 100;
        }
    }

    void display() {
        // Use pythagorean theorem to calculate the x coordinate
        float x = sqrt(pow(this.radius, 2) - pow(this.y, 2));
        ellipse(width / 2, height / 2, x, x);
    }
}