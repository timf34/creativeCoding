void setup() {
  size(800, 800, P3D);
}

void draw() {
  background(0);
  translate(width/2, height/2, 0);
  rotateX(frameCount * 0.01);
  rotateY(frameCount * 0.01);
  sphere(100); // Let's try a larger radius
}