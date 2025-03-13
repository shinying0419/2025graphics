//week04_02_atan2_dy_dx_cos_sin
void setup(){
  size(600,300);
}
void draw(){
  background(#C0FFEE);
  for(int x=150;x<=450;x+=300){
    ellipse(x,150,100,100);
    float dx =mouseX-x, dy=mouseY-150;
    float a=atan2(dy,dx);
    ellipse(x+cos(a)*25, 150+sin(a)*25,50,50);
  }

}
