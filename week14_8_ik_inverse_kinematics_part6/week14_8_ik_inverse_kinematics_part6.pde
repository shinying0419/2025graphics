//week14_8_ik_inverse_kinematics_part6
//用簡單的運算,來解真的ID運算
void setup(){
  size(400,400);
  for(int i=0; i<6; i++){  //把頂點從上到下放好
    p[i] = new PVector(200, 350-50*i);
  }
}
PVector [] p =new PVector[6];  //有6個頂點
void draw(){
  background(255);
  for(int i=0; i<6; i++){  //用迴圈,畫點、畫字
    if(i>0) line(p[i-1].x, p[i-1].y, p[i].x, p[i].y);
    fill(255,0,0);  //紅色的圈圈
    ellipse(p[i].x, p[i].y, 8, 8);
    fill(0);
    text("p:"+i, p[i].x+10, p[i].y);  //字往右一點點
  }
  PVector now = new PVector(mouseX, mouseY);
  for(int i=5;i>=0;i--){
    PVector v = PVector.sub(now, p[i]).normalize().mult(50);  //短向量
    //因為長度限制為50,所以長向量 先長度變成1 再乘上50
    p[i].x = now.x - v.x;  //新的位置, 是中心,再加長度50的這1小段
    p[i].y = now.y - v.y;  //新的位置, 是中心,再加長度50的這1小段
    now=p[i];
  }
  ellipse(mouseX,mouseY,6,6);  //滑鼠也有1個小點,要控制座標移動
  line(p[4].x, p[4].y, mouseX, mouseY);
}
