//week05_3b_atan2_dy_dx_text_radians_degrees
//degress vs. radians 結合 week04_01 和 week05_2
void setup(){
  size(400,400);
}
void draw(){
  background(128);
  line(200,200,400,200);
  line(200,200,mouseX,mouseY);
  float dx=mouseX-200, dy=mouseY-200;
  float a= atan2(dy,dx); //神奇的三角函數, 可找到arc弧的radians
  // atan2() 出來的值, 介於 -P1...+PI 中間
  if(a<0) arc(200, 200, 200, 200, a, 0, PIE); //把算出來的arc radians 拿來用
  else arc(200, 200, 200, 200, 0, a,IE);
  textSize(30);
  text( "radians:" +a , 100,100); //radians弧度/經度
  text(" degrees "+degrees(a),100,130); //degrees度
}
