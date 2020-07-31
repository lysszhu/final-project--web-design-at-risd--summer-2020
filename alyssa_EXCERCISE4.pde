/*
Inspired by honeycomb pattern! I wanted the hexagons to rotate as you move your mouse
 around, and also for the color to shift based on where your mouse is!
 */

//variables
color bg = color(234, 184, 0);
color honeycomb = color(255, 230, 90);
color white = color(255);
color black = color(0);

void setup() {
  size(800, 800);
  background(bg);
}

void draw() {
  background(bg);
  //honeycomb pattern odd rows
  for (int j = 0; j <= width; j += 160) {
    for (int i = 0; i <= height; i += 100) {
      noStroke();
      //color change based on distance from mouse
      float distance = dist(mouseX, mouseY, j, i);
      float coordinate = map(distance, 0, 800, 0, 1);
      color hex = lerpColor(honeycomb, white, coordinate);
      fill(hex);
      //rotation based on mouseX
      float rotateangle = map(mouseX, 0, width, 0, 2*PI);
      pushMatrix();
      translate(j, i);
      rotate(rotateangle);
      drawHex(0, 0, 50);
      popMatrix();
    }
  }
  //honeycomb pattern even rows
  for (int j = 80; j <= width; j += 160) {
    for (int i = 50; i <= height; i += 100) {
      float distance = dist(mouseX, mouseY, j, i);
      float coordinate = map(distance, 0, 800, 0, 1);
      color hex = lerpColor(honeycomb, white, coordinate);
      fill(hex);
      float rotateangle = map(mouseX, 0, width, 0, 2*PI);
      pushMatrix();
      translate(j, i);
      rotate(rotateangle);
      drawHex(0, 0, 50);
      popMatrix();
    }
  }

  //bee cursor
  fill(black);
  rect(mouseX-12, mouseY-5, 24, 10);
  triangle(mouseX, mouseY-25, mouseX+12, mouseY-15, mouseX-12, mouseY-15);
  triangle(mouseX, mouseY+25, mouseX+12, mouseY+15, mouseX-12, mouseY+15);
  fill(bg);
  rect(mouseX-12, mouseY-15, 24, 10);
  rect(mouseX-12, mouseY+5, 24, 10);
  fill(white);
  quad(mouseX, mouseY, mouseX+25, mouseY-12, mouseX+50, mouseY, mouseX+25, mouseY+12);
  quad(mouseX, mouseY, mouseX-25, mouseY-12, mouseX-50, mouseY, mouseX-25, mouseY+12);
  stroke(black);
  line(mouseX, mouseY-20, mouseX-15, mouseY-30);
  line(mouseX, mouseY-20, mouseX+15, mouseY-30);
}


//hexagon drawing function i got from online
void drawHex(float x, float y, float gs) {
  beginShape(); 
  for (int i = 0; i < 6; i++) {
    float angle = i * 2 * PI / 6; 
    vertex(x + gs*cos(angle), y + gs*sin(angle));
  }
  endShape(CLOSE);
}
