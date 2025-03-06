//week03_01_P3D_translate_rotateY_radians_box
void setup(){
  size(400,400,P3D); //開啟3D模式
}
void draw(){
  background(128);
  translate(mouseX,mouseY);
  rotateY(radians(frameCount)); //對Y旋轉
  box(200); //大小200的3D Box盒子
}
