//week08_1_loadShape_shape
size(400,400,P3D);  //(3) 要有P3D的OpenGL 3D 功能
PShape gundam = loadShape("Gundam.obj");  //(1) 讀入3D模型
translate(width/2, height/2);  //放到畫面中心
pushMatrix();  //備份矩陣
  translate(0,100);  //(5)再往下移一點點
  scale(10,-10,10);  //(4)把模型放大 shape(10) 上下要再倒過來
  shape(gundam,0,0);  //(2)畫出3D模型
popMatrix();  //還原矩陣
