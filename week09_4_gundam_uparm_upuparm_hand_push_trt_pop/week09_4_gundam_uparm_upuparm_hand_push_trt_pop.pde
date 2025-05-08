// week09_4_gundam_uparm_upuparm_hand_push_trt_pop
PShape uparm1, upuparm1, hand1;
void setup(){
  size(400, 400, P3D);
  uparm1 = loadShape("uparm1.obj");
  upuparm1 = loadShape("upuparm1.obj");
  hand1 = loadShape("hand1.obj");
}
void draw(){
  background(204);
  translate(200, 300);
  sphere(3); // 小一點, 比較清楚
  
  scale(10, -10, 10);
  
  shape(upuparm1, 0, 0); // 上上手臂
  pushMatrix();
    translate(-4.1, 19.9); // 再掛回去原本的位置
    rotateZ(radians(mouseX));
    translate(4.1, -19.9); // 把物體的旋轉中心, 放到座標中心
    shape(uparm1, 0, 0); // 上手臂
    pushMatrix();
      translate(-4.5, +16.9);
      rotateX(radians(mouseY));
      translate(4.5, -16.9); // 剛剛把手移到座標中心的移動量
      //translate(mouseX/10.0, -mouseY/10.0); // 一邊移動、一邊找到數值
      //println(mouseX/10.0, -mouseY/10.0); // 印出適合的數值 ex. 4.5, -16.9
      shape(hand1, 0, 0);
    popMatrix();
  popMatrix();
}
