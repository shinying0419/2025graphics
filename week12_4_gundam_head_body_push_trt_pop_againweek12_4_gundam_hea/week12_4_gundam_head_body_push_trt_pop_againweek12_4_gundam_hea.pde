// week12_4_gundam_head_body_push_trt_pop_again
// 修改自 week12_2_gundam_head_body_uparm_upuparm_hand
PShape body, head;
PShape uparm1, upuparm1, hand1; // week09_5
void setup() {
  size(400, 400, P3D);
  body = loadShape("body.obj");
  head = loadShape("head.obj");
  uparm1 = loadShape("uparm1.obj"); // week09_5
  upuparm1 = loadShape("upuparm1.obj"); // week09_5
  hand1 = loadShape("hand1.obj"); // week09_5
}
float [] angleX = new float[10];
float [] angleY = new float[10];
int ID = 0; // 0:頭, 1:上上手臂, 2:上手臂 3: 手
void mouseDragged(){
  angleX[ID] += radians(mouseX - pmouseX); // 左右拖曳
  angleY[ID] += radians(mouseY - pmouseY); // 上下拖曳
}
void keyPressed(){  //小心注音輸入法
  if(key=='1') ID=1;
  if(key=='2') ID=2;
  if(key=='3') ID=3;
  if(key=='4') ID=4;
  if(key=='5') ID=5;
  if(key=='6') ID=6;
  if(key=='7') ID=7;
  if(key=='8') ID=8;
  if(key=='9') ID=9;
  if(key=='0') ID=0;
}
void draw() {
  background(204);
  translate(200, 300);
  sphere(10); // 原點的球

  scale(10, -10, 10);
  
  shape(body, 0, 0);
  pushMatrix();
    translate(0, 22.5);
    rotateY(angleX[0]); // week12_2 x方向 左右拖曳, 是對Y軸轉
    rotateX(angleY[0]); // week12_2 y方向 上下拖曳, 是對X軸轉
    translate(0, -22.5);
    shape(head, 0, 0);
  popMatrix();
  
  pushMatrix(); // 左邊的手臂系列
    translate(-2.9, 20.8);
    rotateY(angleX[1]);
    rotateX(angleY[1]);
    translate(2.9, -20.8);
    //translate(mouseX/10.0,-mouseY/10.0);
    //println(mouseX/10.0,-mouseY/10.0);
    shape(upuparm1,0,0);
    pushMatrix();
      translate(-4.1, 19.6); // 把剛剛印出來的數值拿來用
      rotateY(angleX[1]); // week12_2 y方向 上下拖曳, 是對Z軸轉
      rotateX(angleY[1]); // week12_2 x方向 上下拖曳, 是對Y軸轉
      translate(4.2, -19.6); // 把物體的旋轉中心, 放到座標中心
      shape(uparm1, 0, 0); // 上手臂
      pushMatrix();
        translate(-4.5, +16.9);
        //rotateX(radians(mouseY));
        rotateX(angleY[3]); // week12_2 y方向 上下拖曳, 是對X軸轉
        rotateY(angleX[3]); // week12_2 x方向 上下拖曳, 是對Y軸轉
        translate(4.5, -16.9); // 剛剛把手移到座標中心的移動量
        shape(hand1, 0, 0);
      popMatrix();
    popMatrix();
  popMatrix();
}
