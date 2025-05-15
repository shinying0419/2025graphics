//week13_1_processing_video
//Sketch - Library - Manage Library...安裝video
//教學在https://processing.org/tutorials/video
import processing.video.*;  //Java使用外掛的[匯入]
Capture video;  //有視訊鏡頭的,用這個版本
Movie movie;  //沒有視訊鏡頭的,用這個版本
void setup(){
  size(640,960);  //常見的視訊
  video = new Capture(this,640,480);
  video.start();  //打開視訊
  movie = new Movie(this, "street.mov");
  movie.loop();
}
void draw(){
  if(video.available()) video.read();
  image(video,0,480);
  if(movie.available()) movie.read();
  image(movie,0,0);
}
