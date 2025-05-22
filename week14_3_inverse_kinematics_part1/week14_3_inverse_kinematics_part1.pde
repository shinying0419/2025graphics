//week14_3_inverse_kinematics_part1
void setup(){
  size(400,400);  //先用2D
}
float [] angle = new float[5];  //有5個關節
void draw(){
  background(255);
  translate(200,350);  //放下面一點
  ellipse(0,0,12,12);  //(0,0)放圓
  pushMatrix();
    rotate(radians(angle[0]));  //2D對Z軸轉
    rect(0,-5,50,10);  //直的棒子
  popMatrix();
}
void mouseDragged(){
  angle[0] += mouseX - pmouseX;
}
