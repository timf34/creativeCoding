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
    setCamera();
    planeManager.updatePlane();
}

void setCamera() {
    float cameraZ = (height / 2) / tan(PI / 6); // Distance from the camera to the origin
    float cameraX = width / 2; // X-coordinate of the camera (centered)
    float cameraY = height / 2; // Y-coordinate of the camera (centered)

    // float cameraAngle = map(mouseX, 0, width, 0, 2 * PI); // The angle of the camera
    float cameraAngle = radians(60); // The angle of the camera

    float cameraOffsetY = sin(cameraAngle) * cameraZ; // The offset of the camera in the y direction

    camera(cameraX, cameraY - cameraOffsetY, cameraZ, cameraX, cameraY, 0, 0, 1, 0);
}

class CircularPlaneManager {
    CircularPlane plane = new CircularPlane(RADIUS, 0, 100); // We are setting y to be 100 for now.
    
    void updatePlane() {
        plane.move();
        plane.display();
    }
}

class CircularPlane {
    float radius;
    float planeX;  // This is equivalent to x in 3D space - the x in Pythagorean theorem
    float y;  // This is equivalent to z in 3D space 

    CircularPlane(float radius, float planeX, float y) {
        this.radius = radius;
        this.planeX = planeX;
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
        // Use Pythagorean theorem to calculate the x coordinate
        float calculatedRadius = sqrt(pow(this.radius, 2) - pow(this.y, 2));
        ellipse(width / 2, height / 2, calculatedRadius * 2, calculatedRadius * 2);
    }
}
