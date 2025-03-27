//week06_6_push_box_push_T_R_T_box_pop_pop
//慢慢組合出機器手臂
void setup(){
  size(500,500,P3D);
}
void draw(){
  background(255);
  translate(width/2, height/2);
  sphere(10);
  
  fill(252,131,77);
  pushMatrix();  //Step04 push
    //Step05 裡面要往右縮一個TAB
    box(50,200,25);  //Step03:手臂
    
    pushMatrix();
      translate(x,y);  //Step03 掛到手臂上面, 觀察到0,-100
      if(mousePressed) rotateZ(radians(frameCount));  //Step02: 把旋轉放入
      translate(100,0);  //Step01:把手肘的移動量100,0放入
      box(200, 50, 25);  //手肘
      
      pushMatrix();
        translate(100,0);
        rotateZ(radians(frameCount));
        translate(25, 0, 0);
        box(50,25,50);  //Step01 小手腕
      popMatrix();
    popMatrix();
  popMatrix();  //Step04 pop
}
float x=0, y=0;  //Step06 會動的位置
void mouseDragged(){ //Step06
  x+=mouseX- pmouseX;
  y+=mouseY - pmouseY;
  println("x:"+x+"y:"+y); //Step07印出來
}
