//week02_7
//想要把畫出來的座標,變成我們的程式碼!!!
ArrayList<Integer>x, y; //先有兩個還沒準備好的資料結構
ArrayList<ArrayList<Integer>> xx=new ArrayList<ArrayList<Integer>>();
ArrayList<ArrayList<Integer>> yy=new ArrayList<ArrayList<Integer>>();
PImage img;
void setup() {
  size(400, 400);
  img=loadImage("cute.png");
}//記得把圖檔,(像上週一樣)拉到程式碼裡
void draw() {
  background(img);
  fill(255, 200);//半透明的色彩 白色, alpha值是128
  rect(0, 0, 400, 400); //畫超大四邊形,全部蓋住
  //上面是week02_4,下面是week02_3
  for (int I=0; I<xx.size(); I++) { //大寫I對應大的資料結構
    ArrayList<Integer> x=xx.get(I); //取出裡面小的資料結構
    ArrayList<Integer> y=yy.get(I);
    for (int i=1; i<x.size(); i++) { //小的,再照舊畫
      line(x.get(i), y.get(i), x.get(i-1), y.get(i-1));
    }
  }
}
void keyPressed() {  //小心,注音輸入法,會卡住按鍵,要換英文輸入
  if (key=='s'||key=='S') { //如果按下英文的小寫or大寫 想save存檔的話
    for (int I=0; I<xx.size(); I++) { //大寫I對應大的資料結構
      ArrayList<Integer> x=xx.get(I); //取出裡面小的資料結構
      ArrayList<Integer> y=yy.get(I);
      println("beginShape();"); //beginShape();
      for (int i=1; i<x.size(); i++) { //小的,再照舊畫
        println("vertex("+x.get(i)+ ","+ y.get(i) + ");" );
      }//改在keyPressed()按下s或
      println("endShape();"); //endShape();
    }
  }
}
void mouseDragged() {
  //println("vertex(mouseX,mouseY);");
  //println("vertex("+mouseX+ ","+ mouseY + ");" ); //不要在這裡印
  x.add(mouseX);
  y.add(mouseY);
}
void mousePressed() { //滑鼠按下去,建「新的」資料結構
  x=new ArrayList<Integer>();
  xx.add(x);
  y=new ArrayList<Integer>();
  yy.add(y);
}
