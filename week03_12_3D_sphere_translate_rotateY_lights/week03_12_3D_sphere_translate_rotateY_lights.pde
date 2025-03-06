//week03_12_3D_sphere_translate_rotateY_lights
void setup(){
  size(400,400,P3D);
}
void draw(){
  background(128);
  lights();
  translate(mouseX, mouseY);
  rotateY(radians(frameCount));
  sphere(200);
}
