//week02_3_void_setup_void_draw_stroke_if_mousePressed_line
void setup(){
  size(400,400);
  background(255);
  fill(238);
  noStroke();
  float s=400/14; //計算 每個格子的大小
  for(int i=0; i<14; i++){ //左手i 對應y座標
    for(int j=0; j<14; j++){ //右手j 對應x座標
      //rect(j*s,i*s,s,s); //先試一下位置
      if( i+j%2==0) rect(j*s,i*s,s,s);
    }  //下面才是真的程式碼 開始執行程式
  }
}
void draw(){
  stroke(255,0,0); //每秒畫60次
  if(mousePressed) line(mouseX,mouseY,pmouseX,pmouseY);
  //如果mouse 按下去,就畫線,給兩個座標(現在的mouse和之前的mouse)
}
