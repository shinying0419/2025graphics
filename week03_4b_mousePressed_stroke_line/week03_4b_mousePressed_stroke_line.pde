//week03_4b_mousePressed_stroke_line
void setup(){
  size(500,500);
}
void draw(){
  //background(255);
  stroke(0);
  fill(255,0,0); //紅色
  rect(0,0,50,50);
  fill(255,255,0); //黃色
  rect(0,50,50,50);
  fill(0,255,0); //綠色
  rect(0,100,50,50);
  fill(0,0,255); //藍色
  rect(0,150,50,50);
  stroke(myStroke);
  if(mousePressed)line(mouseX,mouseY,pmouseX,pmouseY);
}
color myStroke;
void mousePressed(){
  if(mouseX<50){
    if(mouseY<50) myStroke=color(255,0,0);
    else if(mouseY<100) myStroke=color(255,255,0);
    else if(mouseY<150) myStroke=color(0,255,0);
    else if(mouseY<200) myStroke=color(0,0,255);
  }
}
