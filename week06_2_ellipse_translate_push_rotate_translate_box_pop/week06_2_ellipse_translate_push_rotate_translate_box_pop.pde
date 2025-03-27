//week06_2_ellipse_translate_push_rotate_translate_box_pop
//再加一個移動,把物體放到「轉盤的中心」
void setup(){
  size(500,500,P3D);
}
void draw(){
  background(142);
  ellipse(width/2, height/2,200 ,200);
  
  translate(width/2, height/2); //把東西,放到畫面中心
  pushMatrix();  //第5週教過的 Matrix保護
    if(mousePressed) rotateZ(radians(frameCount)); //對著下面中心旋轉
    translate(-50,0,0);
    box(100,30,30);  //橫的棒子
  popMatrix();  //第5週教過的 Matrix保護
}
