//week01_5_Java_background_translate_rotate_vertex
void setup(){
  size(400,400,P3D);
}
float angle=0;
void draw(){
  background(0); //背景清掉,才能正確畫新的內容
  translate(200,200); //把東西,200,200移動
  rotate(angle); //在座標 0,0 移動
  angle += 0.01;
  beginShape(TRIANGLES);
  fill(255,0,0); vertex(0,100*2);
  fill(0,255,0); vertex(87*2,-50*2);
  fill(0,0,255); vertex(-87*2,-50*2);
  endShape();
}
