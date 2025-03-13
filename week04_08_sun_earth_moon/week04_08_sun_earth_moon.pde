//week04_08_sun_earth_moon
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
      sphere(30); //地球
      pushMatrix();
        translate(50,0); 
        rotateY(radians(frameCount)); 
        sphere(10); //月球
      popMatrix();
   popMatrix();
}
