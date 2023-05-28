// Configuration constants
final int NUM_PARTICLES = 50;
final float PARTICLE_RADIUS = 200;
final float PARTICLE_SPEED = 0.01;
final float PARTICLE_DIAMETER = 10;

ParticleManager particleManager;

void setup() {
  size(800, 800);
  particleManager = new ParticleManager();
  particleManager.createParticles(NUM_PARTICLES, PARTICLE_RADIUS, PARTICLE_SPEED, PARTICLE_DIAMETER);
}

void draw() {
  background(0);
  translate(width/2, height/2);
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
