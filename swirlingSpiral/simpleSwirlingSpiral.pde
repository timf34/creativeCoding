int numBalls = 200;
float angle = 0;
float angleIncrement = TWO_PI / numBalls;

void setup() {
  size(800, 800);
  smooth();
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  background(0);
  translate(width / 2, height / 2);

  for (int i = 0; i < numBalls; i++) {
    float ballRadius = map(i, 0, numBalls, 10, 250);
    float ballX = cos(angle) * ballRadius;
    float ballY = sin(angle) * ballRadius;

    float hue = map(i, 0, numBalls, 0, 360);
    fill(hue, 100, 100, 80);
    ellipse(ballX, ballY, 10, 10);

    angle += angleIncrement;
  }

  angle += 0.01;
}
