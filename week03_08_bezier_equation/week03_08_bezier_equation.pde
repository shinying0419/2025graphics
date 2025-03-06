//week03_08_bezier_equation
void setup(){
  size(400,400);
}
int x1=340, x2=40, x3=360, x4=60;
int y1=80, y2=40, y3=360, y4=320;

void draw(){
  background(255);
  line(x1,y1,x2,y2);
  line(x3,y3,x4,y4);
  bezier(x1,y1,x2,y2,x3,y3,x4,y4); //貝氏曲線
  float t=frameCount /200.0;
  float t2=1-t;
  float x= x1*t2*t2*t2 +3*x2*t2*t2*t2 +3*x3*t2*t2*t2 +3*x4*t2*t2*t2;
  float y= y1*t2*t2*t2 +3*y2*t2*t2*t2 +3*y3*t2*t2*t2 +3*y4*t2*t2*t2;
  ellipse(x,y,10,10);
}
