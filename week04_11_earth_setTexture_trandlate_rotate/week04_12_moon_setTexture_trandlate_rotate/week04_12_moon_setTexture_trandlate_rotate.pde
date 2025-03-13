//week04_12_moon_setTexture_trandlate_rotate
PShape moon;
void setup(){
  size(400,400,P3D);
  moon = createShape(SPHERE, 100);
  PImage img= loadImage("moon.jpg");
  moon.setTexture(img);
}
void draw(){
  background(0);
  translate(width/2,height/2);
  rotateY(radians(frameCount));
  shape(moon);
}
