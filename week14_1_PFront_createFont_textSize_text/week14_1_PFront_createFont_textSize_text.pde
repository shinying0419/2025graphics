//week14_1_PFront_createFont_textSize_text
//學過了PImage PVector PFont ...
size(300,300);
textSize(50);  //50號字
text("Hello",10,50);  //預設的字型
PFont font = createFont("Times New Roman",50);
textFont(font);  //換字型
text("Hello",10,100);  //放下面一點點
//print(PFont.list());  //列出現在所有可用的字型
//改用for迴圈,把全部的字型,分行印出來
for(String name:PFont.list()) println(name);
