// Configuration constants
final int NUM_PARTICLES = 50;
final int NUM_LAYERS = 30;
final float PARTICLE_RADIUS = 100;
final float PARTICLE_BASE_SPEED = 0.005;
final float PARTICLE_DIAMETER = 15;
final int CAMERA_ANGLE_DEGREES = 70;
final int AMBIENT_LIGHT_INTENSITY = 255;
final float LAYER_ANGLE_OFFSET = 0.03;
final float LAYER_SPEED_OFFSET = 0.0005;

ParticleManager particleManager;

void setup() {
    size(800, 800, P3D);
    particleManager = new ParticleManager();
    particleManager.createParticles(NUM_PARTICLES, NUM_LAYERS, PARTICLE_RADIUS, PARTICLE_BASE_SPEED, PARTICLE_DIAMETER);
}

void draw() {
    setCameraAndLighting();
    particleManager.updateParticles();
}

void setCameraAndLighting() {
    background(0);

    float cameraZ = (height / 2) / tan(PI / 6);
    float cameraX = width / 2;
    float cameraY = height / 2;
    float cameraAngle = radians(CAMERA_ANGLE_DEGREES);
    float cameraOffsetY = sin(cameraAngle) * cameraZ;
    
    camera(cameraX, cameraY - cameraOffsetY, cameraZ, cameraX, cameraY, 0, 0, -1, 0);
    translate(width / 2, height / 2);
    
    ambientLight(AMBIENT_LIGHT_INTENSITY, AMBIENT_LIGHT_INTENSITY, AMBIENT_LIGHT_INTENSITY);
    pointLight(AMBIENT_LIGHT_INTENSITY, AMBIENT_LIGHT_INTENSITY, AMBIENT_LIGHT_INTENSITY, width / 2, height / 2, -cameraZ);
}

class ParticleManager {
    ArrayList<Particle> particles = new ArrayList<Particle>();
    
    void createParticles(int numParticles, int numLayers, float radius, float baseSpeed, float diameter) {
        for (int layer = 0; layer < numLayers; layer++) {
            float layerZ = map(layer, 0, numLayers, -PARTICLE_DIAMETER * numLayers / 2, PARTICLE_DIAMETER * numLayers / 2);
            float speed = baseSpeed + (NUM_LAYERS - layer) * LAYER_SPEED_OFFSET;
            
            for (int i = 0; i < numParticles; i++) {
                float angle = map(i, 0, numParticles, 0, TWO_PI) + layer * LAYER_ANGLE_OFFSET;
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
        ellipse(x, y, diameter, diameter);
        popMatrix();
    }
}
