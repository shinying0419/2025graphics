//week04_05a_rotateZ_translate_box
void setup(){
  size(400,400,P3D);
}
void draw(){
  background(128);
  translate(width/2, height/2); //移至畫面中心
  
      //以下兩行，分別註解，排列組合觀察
      rotateZ(radians(frameCount)); //對Z軸旋轉
      //translate(0,-50); //把下端，移到中心
      box(10,100,10); //可轉動的長條
}
