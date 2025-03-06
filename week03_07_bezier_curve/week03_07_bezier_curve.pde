//week03_07_bezier_curve
int x1=340, x2=40, x3=360, x4=60;
int y1=80, y2=40, y3=360, y4=320;
line(x1,y1,x2,y2);
line(x3,y3,x4,y4);
bezier(x1,y1,x2,y2,x3,y3,x4,y4); //貝氏曲線
