//week06_5_push_box_push_T_R_T_box_pop_pop
//慢慢組合出機器手臂
void setup(){
  size(500,500,P3D);
}
void draw(){
  background(255);  //Step00
  translate(width/2, height/2);  //Step00
  sphere(10);  //Step04 放個圓球, 當世界中心的參考
  
  fill(252,131,77);
  pushMatrix();  //Step04 新的一組
    translate(x,y);  //Steop05 新的轉動
    //Step03 把程式往右縮排
    box(200, 50, 25);  //Step05 手肘(剛剛放錯位置)
    
    pushMatrix();  //Step03 把程式往右縮排
      translate(100,0);  //Step06 把前一步發現放100,0放好
      //if(mousePressed) rotateZ(radians(frameCount));  //Step02把剛剛的if(mousePressed) 刪掉
      rotateZ(radians(frameCount));  //Step02 只轉動
      translate(25, 0, 0);  //Step02 往右推,讓左端放中心
      box(50,25,50);  //Step01 小手腕
    popMatrix();  //Step03 把程式往右縮排
  popMatrix();  //新的一組
}
float x=0, y=0;  //Step06 會動的位置
void mouseDragged(){ //Step06
  x+=mouseX- pmouseX;
  y+=mouseY - pmouseY;
  println("x:"+x+"y:"+y); //Step07印出來
}
