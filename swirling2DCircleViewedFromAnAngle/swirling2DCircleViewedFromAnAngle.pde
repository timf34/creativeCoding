// Configuration constants
final int NUM_PARTICLES = 50;
final float PARTICLE_RADIUS = 200;
final float PARTICLE_SPEED = 0.01;
final float PARTICLE_DIAMETER = 10;

ParticleManager particleManager;

void setup() {
    size(800, 800, P3D);
    particleManager = new ParticleManager();
    particleManager.createParticles(NUM_PARTICLES, PARTICLE_RADIUS, PARTICLE_SPEED, PARTICLE_DIAMETER);
}

void draw() {
    background(0);
    float cameraZ = (height / 2) / tan(PI / 6); // Distance from the camera to the origin
    
    float cameraX = width / 2; // X-coordinate of the camera (centered)
    float cameraY = height / 2; // Y-coordinate of the camera (centered)
    float cameraAngle = radians(60); // Angle of the camera in radians
    
    // float cameraOffsetX = cos(cameraAngle) * cameraZ; // Offset the camera's X-coordinate
    float cameraOffsetY = sin(cameraAngle) * cameraZ; // Offset the camera's Y-coordinate
    
    camera(cameraX, cameraY - cameraOffsetY, cameraZ, cameraX, cameraY, 0, 0, -1, 0);
    
    translate(width / 2, height / 2);
    particleManager.updateParticles();
}

class ParticleManager {
    ArrayList<Particle> particles = new ArrayList<Particle>();
    
    void createParticles(int numParticles, float radius, float speed, float diameter) {
        for (int i = 0; i < numParticles; i++) {
            float angle = map(i, 0, numParticles, 0, TWO_PI);
            particles.add(new Particle(angle, radius, speed, diameter));
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
    
    Particle(float angle, float radius, float speed, float diameter) {
        this.angle = angle;
        this.radius = radius;
        this.speed = speed;
        this.diameter = diameter;
}
    
    void move() {
        angle += speed;
}
    
    void display() {
        float x = radius * cos(angle);
        float y = radius * sin(angle);
        ellipse(x, y, diameter, diameter);
}
}
