//week05_7_many_pushMatrix_popMatrix
void setup(){
  size(500,500);
}
void draw(){
  background(204);
  for(int x=50;x<500;x+=100){
    for(int y=50;y<500;y+=100){
      pushMatrix();
        translate(x,y);
        rotate(radians(frameCount));
        rect(-50,-5,100,10);
      popMatrix();
    }
  }
}
