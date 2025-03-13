//week04_10_earth_createShape_setTexture_shape
//google: processing sphere texture 可找到程式
size(400,400,P3D);
PShape earth = createShape(SPHERE, 100);
PImage img= loadImage("earth.jpg");
earth.setTexture(img);
shape(earth);
