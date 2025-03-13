//week04_05_robot_arm_pushMatrix_T_R_T_box_popMatrix
void setup(){
  size(400,400,P3D);
}
void draw(){
  background(128);
  translate(width/2, height/2);
  pushMatrix();
    translate(0,100);
    box(50);
    pushMatrix();
      rotateZ(radians(mouseX));
      translate(0,-50);
      box(10,100,10);
      popMatrix();
    popMatrix();
}
