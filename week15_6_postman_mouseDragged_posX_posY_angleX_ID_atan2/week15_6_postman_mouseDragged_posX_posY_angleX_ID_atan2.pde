// week15_6_postman_mouseDragged_posX_posY_angleX_ID_atan2
// 修改自week15_5_postman_mouseDragged_head_angleX_0_atan2
PImage postman, head, body, uparm1, hand1, uparm2, hand2, foot1, foot2;
void setup(){ // 把上面的圖, 都拉近新專案裡
  size(560, 560);
  postman = loadImage("postman.png");
  head = loadImage("head.png");
  body = loadImage("body.png");
  uparm1 = loadImage("uparm1.png");
  uparm2 = loadImage("uparm2.png");
  hand1 = loadImage("hand1.png");
  hand2 = loadImage("hand2.png");
  foot1 = loadImage("foot1.png"); // 增加腳 旋轉中心 220,375
  foot2 = loadImage("foot2.png"); // 增加腳 旋轉中心 260,372
}
float [] angleX = new float[10]; // 在 3D 的世界裡, 我們的旋轉
float [] angleY = new float[10];
int ID = 0; // 一開始是頭的關節
ArrayList<String> lines = new ArrayList<String>();
void keyPressed(){
  if(key=='s'){ // 現在動作的所有關節,都存起來
    String now = ""; // 空字串
    for(int i=0; i<10; i++){
      now += angleX[i] + " "; // 後面有空格
      now += angleY[i] + " "; // 後面有空格
    }
    lines.add(now); // 把現在的動作的這行, 加到 lines 裡
    String [] arr = new String[lines.size()];
    lines.toArray(arr);
    saveStrings("angles.txt", arr);
    println("現在存檔:" + now);
  }
  if(key=='r'){
    String [] file = loadStrings("angles.txt");
    if(file != null){
      for(int i=0; i<file.length; i++){
        lines.add(file[i]);
        println("現在讀檔:" + file[i]);
      }
    }
  }
  if(key=='p') playing = !playing; // 播動畫 <=> 不播動畫
  
  if(key=='1') ID = 1; // 左邊臂
  if(key=='2') ID = 2; // 左邊手
  if(key=='3') ID = 3; // 右邊臂
  if(key=='4') ID = 4; // 右邊手
  if(key=='5') ID = 5; // 左邊腳
  if(key=='6') ID = 6; // 右邊腳
  if(key=='0') ID = 0; // 頭
}
boolean playing = false; // 一開始,不播放動畫, 按下 'p'可切換
float [] posX={+236, +185, +116, 290, 357, 220, 260};  //從void draw()
float [] posY={+231, +261, +265, 262, 259, 375, 372};
float [] posAngle={90, 180, 180, 0, 0, -90, -90};
void mouseDragged(){
  //從void draw()找到頭[掛的位置]+236,+231
  float dx = mouseX - posX[ID],dy=mouseY-posY[ID];  //減掉座標
  angleX[0] = degrees(atan2(dy,dx))+posAngle[ID];  //頭的角度
  
  //angleX[ID] += mouseX - pmouseX;
  //angleY[ID] += mouseY - pmouseY; // 多了這一行
}
int R = 0;
void myInterpolate(){ // 請不要剪貼, 老師重寫
  if(lines.size()>=2){ // 要有2行以上, 才能做內插
    float alpha = (frameCount%30)/30.0; // 介於 0.0~1.0中間的值
    if(alpha==0.0) R = (R+1)%lines.size(); // 如果變到0.0就換下一組
    int R2 = (R+1)%lines.size();
    float [] oldAngle = float(split( lines.get( R ), ' '));
    float [] newAngle = float(split( lines.get( R2 ), ' '));
    for(int i=0; i<10; i++){
      angleX[i] = oldAngle[i*2+0]*(1-alpha) + newAngle[i*2+0]*alpha;
      angleY[i] = oldAngle[i*2+1]*(1-alpha) + newAngle[i*2+1]*alpha;
    }
  }
}
void draw(){
  background(#FFFFF2);
  if(playing) myInterpolate();
  image(body, 0, 0); // 先畫身體
  
  pushMatrix();
    translate(+236, +231); // 再放回去正確的位置
    rotate(radians(angleX[0]));
    translate(-236, -231); // 把頭的旋轉中心, 放到(0,0)
    image(head, 0, 0); // 再畫頭
  popMatrix();

  pushMatrix(); // 腳 foot1
    translate(220, 375);
    rotate(radians(angleX[5]));
    translate(-220, -375);
    image(foot1, 0, 0);
  popMatrix();

  pushMatrix(); // 腳 foot2
    translate(260, 372);
    rotate(radians(angleX[6]));
    translate(-260, -372);
    image(foot2, 0, 0);
  popMatrix();
  
  pushMatrix(); // 要畫左邊的上手臂、手肘
    translate(+185, +261);
    rotate(radians(angleX[1]));
    translate(-185, -261);
    image(uparm1, 0, 0); // 上手臂
    pushMatrix();
      translate(+116, +265);
      rotate(radians(angleX[2]));
      translate(-116, -265);
      image(hand1, 0, 0); // 手肘
    popMatrix();
  popMatrix();  
  
  pushMatrix(); // 要畫右邊的上手臂、手肘
    translate(290, 262);
    rotate(radians(angleX[3]));
    translate(-290, -262);
    image(uparm2, 0, 0);
    pushMatrix();
      translate(357, 259);
      rotate(radians(angleX[4]));
      translate(-357, -259);
      image(hand2, 0, 0);
    popMatrix();
  popMatrix();
}
