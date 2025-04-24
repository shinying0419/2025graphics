//week10_1_postman_head_body
size(560,560);
PImage postman = loadImage("postman.png");
PImage head = loadImage("head.png");
PImage body = loadImage("body.png");
background(#FFFFF2);
image(postman,0,0);   //基礎的郵差先生
fill(255,0,255,128);  //半透明的紫色
rect(0,0,560,560);  //蓋上去
image(head,0,0);  //再畫頭
image(body,0,0);  //再畫身體
