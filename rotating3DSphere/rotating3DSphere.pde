// Import the ArrayList class
import java.util.ArrayList;

// Create an ArrayList to hold the Particle objects
ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  // Set up the canvas
  size(800, 800);
  
  // Initialize the particles
  int numParticles = 50; // Change this to increase/decrease the number of particles
  for (int i = 0; i < numParticles; i++) {
    float angle = map(i, 0, numParticles, 0, TWO_PI); // Distribute the particles evenly along the circle
    float radius = 200; // Change this to increase/decrease the radius of the circle
    float speed = 0.01; // Change this to increase/decrease the speed of the particles
    float diameter = 10; // Change this to increase/decrease the size of the particles
    
    // Add the new Particle to the ArrayList
    particles.add(new Particle(angle, radius, speed, diameter));
  }
}

void draw() {
  // Clear the background
  background(0);
  
  // Move and display the particles
  translate(width/2, height/2); // Center the circle in the window
  for (Particle p : particles) {
    p.move();
    p.display();
  }
}

// Define the Particle class
class Particle {
  float angle; // The current angle of the particle
  float radius; // The radius of the circle
  float speed; // The speed of the particle
  float diameter; // The diameter of the particle
  
  // The Particle constructor
  Particle(float angle, float radius, float speed, float diameter) {
    this.angle = angle;
    this.radius = radius;
    this.speed = speed;
    this.diameter = diameter;
  }
  
  // The move method
  void move() {
    // Update the angle (this will cause the particle to move)
    angle += speed;
  }
  
  // The display method
  void display() {
    // Calculate the x and y coordinates of the particle
    float x = radius * cos(angle);
    float y = radius * sin(angle);
    
    // Display the particle
    ellipse(x, y, diameter, diameter);
  }
}
