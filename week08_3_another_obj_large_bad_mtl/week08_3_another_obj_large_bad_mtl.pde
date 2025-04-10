//week08_3_another_obj_large_bad_mtl
PShape gundam;  //要再把 Gundam.obj等檔案拉進來
void setup(){
  size(400,400,P3D);
  gundam = loadShape("FinalBaseMesh.obj");
}
void draw(){
  background(128);
  lights();
  translate(width/2,height/2+100);
  pushMatrix();
    scale(10,-10,10);
    rotateY(radians(frameCount));
    shape(gundam,0,0);
  popMatrix();
}
