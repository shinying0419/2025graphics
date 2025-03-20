//week05_2_for_for_ellipse_arc_arc_radians_360
//角度 degress 度 vs. radians 弧度/弳度
size(600,600);
background(0);
for(int i=0; i<6; i++){
  for(int j=0;j<6;j++){
    int now= i*6 +j;
    ellipse( 50+j*100, 50+i*100, 80, 80);
    arc( 50+j*100, 50+i*100, 60,60,0,now, PIE);
    arc( 50+j*100, 50+i*100, 40,40,0,radians(now*10), PIE);
    text( now, j*100, i*100+30);
  }
}
