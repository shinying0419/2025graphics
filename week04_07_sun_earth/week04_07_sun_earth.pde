//week04_07_sun_earth
void setup(){
  size(400,400,P3D);
}
void draw(){
  background(128);
  translate(width/2, height/2);
  sphere(100);
  rotateY(radians(frameCount));
  pushMatrix();
      translate(150,0); 
      rotateY(radians(frameCount)); 
      sphere(30);
   popMatrix();
}
