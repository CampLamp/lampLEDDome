void setup(){
  size(800,600);
}

void draw(){
    drawRandomCircles();
}

void drawRandomCircles(){
  ellipse(random(width),
          random(height),
          random(20,20),
          random(30,20));
}
          
  