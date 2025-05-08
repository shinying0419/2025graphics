//week12_6_sound
//要有聲音,需要聲音的Library函式庫
//Sketch - Library - Managed Libraries 找 sound
//會看到 Sound | Provides a simple way to work with audio
// 選它, 右下角 Intall下載安裝(會有小勾勾出來)
//安裝好Sound後, 會有File - Examples 點開 Libraries核心函式庫
//Soundfile 那堆範例 看 SimplePlayback 簡單播放音樂的範例
import processing.sound.*;  //抄範例
SoundFile mySound;  //抄範例,改變數名
void setup(){
  size(400,400);
  mySound = new SoundFile(this, "music.mp3");
  mySound.play();
}
void draw(){

}
