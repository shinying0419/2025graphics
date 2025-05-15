//week13_2_camera_movie_eye_center_up
//電腦圖學在繪圖時,會設定camera的相關係數
import processing.video.*;  //要使用影片的外掛
Movie movie;  //要放影片的變數
void setup(){
  size(720,480,P3D);//要記得加上P3D才能有Op
  movie = new Movie(this,"street.mov");//要把street.mov拉進來
  movie.loop();//迴圈播放 影片解析度720 480
}
void draw(){
  background(128);
  camera(mouseX,mouseY,120, 300,200,0,0,1,0);
  //很多參數eyeX,eyeY,eyeZ,centerX,centerY,centerZ,upX,upY,upZ
  //現在把影片中心點,幫主角
  if(movie.available()) movie.read();//放影片在0,0
  image(movie,0,0);
}
