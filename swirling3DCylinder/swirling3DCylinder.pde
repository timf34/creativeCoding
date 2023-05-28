// Configuration constants
final int NUM_PARTICLES = 50;
final int NUM_LAYERS = 30;
final float PARTICLE_RADIUS = 100;
final float PARTICLE_BASE_SPEED = 0.005;
final float PARTICLE_DIAMETER = 15;

ParticleManager particleManager;

void setup() {
    size(800, 800, P3D);
    particleManager = new ParticleManager();
    particleManager.createParticles(NUM_PARTICLES, NUM_LAYERS, PARTICLE_RADIUS, PARTICLE_BASE_SPEED, PARTICLE_DIAMETER);
}

void draw() {
    background(0);
    float cameraZ = (height / 2) / tan(PI / 6); // Distance from the camera to the origin
    
    float cameraX = width / 2; // X-coordinate of the camera (centered)
    float cameraY = height / 2; // Y-coordinate of the camera (centered)
    float cameraAngle = radians(70); // Angle of the camera in radians
    
    // float cameraOffsetX = cos(cameraAngle) * cameraZ; // Offset the camera's X-coordinate
    float cameraOffsetY = sin(cameraAngle) * cameraZ; // Offset the camera's Y-coordinate
    
    camera(cameraX, cameraY - cameraOffsetY, cameraZ, cameraX, cameraY, 0, 0, -1, 0);
    translate(width / 2, height / 2);
    
    // ambientLight(0, 255, 200);
    // directionalLight(255, 255, 255, 0, 1, -1);
    
    ambientLight(255, 255, 255); // Ambient light
    pointLight(255, 255, 255, width / 2, height / 2, -cameraZ); // Point light
    
    
    particleManager.updateParticles();
}

class ParticleManager {
    ArrayList<Particle> particles = new ArrayList<Particle>();
    
    void createParticles(int numParticles, int numLayers, float radius, float baseSpeed, float diameter) {
        for (int layer = 0; layer < numLayers; layer++) {
            float layerZ = map(layer, 0, numLayers, -PARTICLE_DIAMETER * numLayers / 2, PARTICLE_DIAMETER * numLayers / 2);
            float speed = baseSpeed + (NUM_LAYERS- layer) * 0.0005; // adjust the speed based on layer number here
            // speed += layer * 0.00002; // adjust the speed based on layer number here
            for (int i = 0; i < numParticles; i++) {
                float angle = map(i, 0, numParticles, 0, TWO_PI);
                angle += layer * 0.03; // adjust the angle based on layer number here
                particles.add(new Particle(angle, radius, layerZ, speed, diameter));
            }
        }
    }
    
    void updateParticles() {
        for (Particle p : particles) {
            p.move();
            p.display();
        }
    }
}

class Particle {
    float angle;
    float radius;
    float speed;
    float diameter;
    float z;
    
    Particle(float angle, float radius, float z, float speed, float diameter) {
        this.angle = angle;
        this.radius = radius;
        this.speed = speed;
        this.diameter = diameter;
        this.z = z;
    }
    
    void move() {
        angle += speed;
    }
    
    void display() {
        float x = radius * cos(angle);
        float y = radius * sin(angle);
        pushMatrix();
        translate(x, y, z);
        ellipse(x, y,diameter, diameter);
        popMatrix();
    }
}
