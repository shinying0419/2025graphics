#include <stdio.h>
#include <GL/glut.h>
#include <opencv/highgui.h>
#include <opencv/cv.h>
#include "glm.h"
int show[30]={0,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1};
float angle=0;
int oldX, oldY;
float dx=0, dy=0, dz=0;
int mode=0;///0:select, 1:translate, 2:rotate
float angleX[30], angleY[30], angleZ[30];
float posX[30], posY[30], posZ[30];
int nowID=13;
void resize(int width, int height);
void timer(int t);
void display();
void keyboard(unsigned char key, int x, int y);
void special(int key, int x, int y);
int myTexture(char *filename);
void loadGundamAll();
void showAxis();
void myDrawPart(GLMmodel* part, int id);
GLMmodel * head=NULL;
GLMmodel * shoulder1=NULL, * shoulder2=NULL;
GLMmodel * upuparm1=NULL, * upuparm2=NULL;
GLMmodel * uparm1=NULL, * uparm2=NULL;
GLMmodel * elbow1=NULL, * elbow2=NULL;
GLMmodel * hand1=NULL, * hand2=NULL;

GLMmodel * body=NULL;
GLMmodel * hip=NULL;
GLMmodel * leg1=NULL, * leg2=NULL;
GLMmodel * knee1=NULL, * knee2=NULL;
GLMmodel * calf1=NULL, * calf2=NULL;
GLMmodel * foot1=NULL, * foot2=NULL;
void loadGundamAll()
{
    float dimensions[3];
    head=glmReadOBJ("head.obj");
    shoulder1=glmReadOBJ("shoulder1.obj");
    shoulder2=glmReadOBJ("shoulder2.obj");
    upuparm1=glmReadOBJ("upuparm1.obj");
    upuparm2=glmReadOBJ("upuparm2.obj");
    uparm1=glmReadOBJ("uparm1.obj");
    uparm2=glmReadOBJ("uparm2.obj");
    elbow1=glmReadOBJ("elbow1.obj");
    elbow2=glmReadOBJ("elbow2.obj");
    hand1=glmReadOBJ("hand1.obj");
    hand2=glmReadOBJ("hand2.obj");
    body=glmReadOBJ("body.obj");
    hip=glmReadOBJ("hip.obj");
    leg1=glmReadOBJ("leg1.obj");
    leg2=glmReadOBJ("leg2.obj");
    knee1 = glmReadOBJ("knee1.obj");
    knee2 = glmReadOBJ("knee2.obj");
    calf1 = glmReadOBJ("calf1.obj");
    calf2 = glmReadOBJ("calf2.obj");
    foot1 = glmReadOBJ("foot1.obj");
    foot2 = glmReadOBJ("foot2.obj");

    glmScale(head, 2.0/27);
    glmScale(shoulder1, 2.0/27);
    glmScale(shoulder2, 2.0/27);
    glmScale(upuparm1, 2.0/27);
    glmScale(upuparm2, 2.0/27);
    glmScale(uparm1, 2.0/27);
    glmScale(uparm2, 2.0/27);
    glmScale(elbow1, 2.0/27);
    glmScale(elbow2, 2.0/27);
    glmScale(hand1, 2.0/27);
    glmScale(hand2, 2.0/27);

    glmScale(body, 2.0/27);
    glmScale(hip, 2.0/27);

    glmScale(leg1, 2.0/27);
    glmScale(leg2, 2.0/27);
    glmScale(knee1, 2.0/27);
    glmScale(knee2, 2.0/27);
    glmScale(calf1, 2.0/27);
    glmScale(calf2, 2.0/27);
    glmScale(foot1, 2.0/27);
    glmScale(foot2, 2.0/27);

    myTexture("Diffuse.jpg");
}
void myDrawPart(GLMmodel* part, int id)
{
    if(nowID==id) glColor3f(1,0,0);
    if(show[id]>0) glmDraw(part, GLM_SMOOTH | GLM_TEXTURE);
    if(nowID==id) glColor3f(1,1,1);
}
void display()
{
    glClearColor(0.5,0.5,0.5, 1);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glPushMatrix();
        glTranslatef(0, -1, 0);
        showAxis();

        ///現在要讓 hip(13)來帶動整個身體
        glTranslatef(0.00, +1.03, 0.00);
        glRotatef(angleY[13], 1,0,0);
        glRotatef(angleX[13], 0,1,0);
        glTranslatef(0.00, -1.03, 0.00);

        glPushMatrix();///以下是身體 (腰的上面)
            glTranslatef(+0.01, +1.30, 0.00);///身體的部分
            glRotatef(angleX[2], 0,1,0);
            glRotatef(angleY[2], 1,0,0);
            glTranslatef(-0.01, -1.30, 0.00);
            glTranslatef(posX[2], posY[2], posZ[2]);
            myDrawPart(body, 2);

            glPushMatrix();
                glTranslatef(0.00, 1.63, 0.00);
                glRotatef(angleX[1], 0,1,0);
                glRotatef(angleY[1], 1,0,0);
                glTranslatef(-0.00, -1.63, 0.00);
                myDrawPart(head, 1);
            glPopMatrix();

            glPushMatrix();///左手
                glTranslatef(-0.21, 1.53, 0.00);
                glRotatef(angleX[3], 0,0,1);
                glRotatef(angleY[3], 1,0,0);
                glTranslatef(0.21, -1.53, 0.00);
                myDrawPart(shoulder1, 3);

                glTranslatef(-0.30, +1.55, 0.00);
                glRotatef(angleY[4], 0,0,1);
                glTranslatef(0.30, -1.55, 0.00);
                myDrawPart(upuparm1, 4);

                glTranslatef(-0.30, +1.55, 0.00);
                glRotatef(angleY[4], 0,0,1);
                glRotatef(angleX[5], 0.1,1,0);
                glTranslatef(0.30, -1.55, 0.00);
                myDrawPart(uparm1, 5);

                glTranslatef(-0.31, 1.36, 0.00);
                glRotatef(angleY[6], 1,0,0);
                glTranslatef(0.31, -1.36, 0.00);
                myDrawPart(elbow1, 6);

                glTranslatef(-0.33, 1.27, 0.00);
                glRotatef(angleX[7], 0.1,1,0);
                glRotatef(angleY[6], 1,0,0);
                glTranslatef(0.33, -1.27, 0.00);
                myDrawPart(hand1, 7);
            glPopMatrix();

            glPushMatrix();///右手
                glTranslatef(+0.21, 1.53, 0.00);
                glRotatef(angleX[8], 0,0,1);
                glRotatef(angleY[8], 1,0,0);
                glTranslatef(-0.21, -1.53, 0.00);
                myDrawPart(shoulder2, 8);

                glTranslatef(+0.30, +1.55, 0.00);
                glRotatef(angleY[9], 0,0,1);
                glTranslatef(-0.30, -1.55, 0.00);
                myDrawPart(upuparm2, 9);

                glTranslatef(+0.30, +1.55, 0.00);
                glRotatef(angleY[9], 0,0,1);
                glRotatef(angleX[10], -0.1,1,0);
                glTranslatef(-0.30, -1.55, 0.00);
                myDrawPart(uparm2, 10);

                glTranslatef(+0.31, 1.36, 0.00);
                glRotatef(angleY[11], 1,0,0);
                glTranslatef(-0.31, -1.36, 0.00);
                myDrawPart(elbow2, 11);

                glTranslatef(+0.33, 1.27, 0.00);
                glRotatef(angleX[12], 0.1,1,0);
                glRotatef(angleY[11], 1,0,0);
                glTranslatef(-0.33, -1.27, 0.00);
                myDrawPart(hand2, 12);
            glPopMatrix();
        glPopMatrix();///以上是身體 (腰的上面)

        myDrawPart(hip, 13);///身體的中心,hip 13

        glPushMatrix();///左腳
            glTranslatef(-0.15, +1.09, 0.00);
            glRotatef(angleX[14], 0,0,1);
            glRotatef(angleY[14], 1,0,0);
            glTranslatef(0.15, -1.09, 0.00);
            myDrawPart(leg1, 14);

            glTranslatef(-0.14, +0.85, 0.00);
            glRotatef(angleY[15], 1,0,0);
            glTranslatef(0.14, -0.85, 0.00);
            myDrawPart(knee1, 15);

            glTranslatef(-0.13, +0.76, 0.00);
            glRotatef(angleY[16], 1,0,0);
            glTranslatef(0.13, -0.76, 0.00);
            myDrawPart(calf1, 16);

            glTranslatef(-0.15, +0.18, 0.00);
            glRotatef(angleY[17], 1,0,0);
            glRotatef(angleX[17], 0,1,0);
            glTranslatef(0.15, -0.18, 0.00);
            myDrawPart(foot1, 17);
        glPopMatrix();///左腳

        glPushMatrix();///右腳
            glTranslatef(+0.15, +1.09, 0.00);
            glRotatef(angleX[18], 0,0,1);
            glRotatef(angleY[18], 1,0,0);
            glTranslatef(-0.15, -1.09, 0.00);
            myDrawPart(leg2, 18);

            glTranslatef(+0.14, +0.85, 0.00);
            glRotatef(angleY[19], 1,0,0);
            glTranslatef(-0.14, -0.85, 0.00);
            myDrawPart(knee2, 19);

            glTranslatef(+0.13, +0.76, 0.00);
            glRotatef(angleY[20], 1,0,0);
            glTranslatef(-0.13, -0.76, 0.00);
            myDrawPart(calf2, 20);

            glTranslatef(+0.15, +0.18, 0.00);
            glRotatef(angleY[21], 1,0,0);
            glRotatef(angleX[21], 0,1,0);
            glTranslatef(-0.15, -0.18, 0.00);
            myDrawPart(foot2, 21);

        glPopMatrix();///右腳
    glPopMatrix();
    glutSwapBuffers();
}

void resize(int width, int height)
{
    const float ar = (float) width / (float) height;

    glViewport(0, 0, width, height);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(60, ar, 0.001, 100);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity() ;
    gluLookAt(0,0,2, 0,0,0, 0,1,0);
}
void timer(int t)
{
    glutTimerFunc(30, timer, t+1);
    angle++;
    glutPostRedisplay();
}
char strMode[3][20]={"select","translate","Rotate"};
void special(int key, int x, int y)
{
    if(key==GLUT_KEY_UP) nowID--;
    if(key==GLUT_KEY_DOWN) nowID++;
    if(nowID<0) nowID=0;
    if(nowID>29) nowID=29;
}
void keyboard(unsigned char key, int x, int y)
{
    int now;
    if(isdigit(key)) nowID=key-'0';
    if(mode==0 && isdigit(key)) show[nowID]=!show[nowID];
    if(key=='q' || key=='Q') mode=0;///select
    if(key=='w' || key=='W') mode=1;///translate
    if(key=='e' || key=='E') mode=2;///rotate
    if(key=='a' || key=='A'){///reset
        angleX[nowID]=0; angleY[nowID]=0;
    }
    if(mode==0){
        for(int i=0;i<10;i++){
            printf("[%d]:%d ", i,show[i]);
        }
        printf("\n");
    }
    printf("Mode: %s, nowID:%d\n", strMode[mode], nowID);
}
void mouse(int button, int state, int x, int y)
{
    oldX=x; oldY=y;
}
void motion(int x, int y)
{
    if(mode==1){///translate
        posX[nowID]+=(x-oldX)/300.0;
        posY[nowID]-=(y-oldY)/300.0;
        printf("glTranslatef(%.2f, %.2f, %.2f);\n", posX[nowID], posY[nowID], 0);
    }else if(mode==2){
        angleX[nowID]+= x-oldX;
        angleY[nowID]+= y-oldY;
        printf("angleX:%.0f, angleY:%.0f\n", angleX[nowID], angleY[nowID]);
    }
    oldX=x; oldY=y;
    glutPostRedisplay();
}
void showAxis()
{
    glutSolidSphere(0.02, 10,10);
    glColor3f(1,0,0);
    glBegin(GL_LINES);
        glVertex3f(0,0,0); glVertex3f( 0.5, 0,0);
        glVertex3f(0,0,0); glVertex3f(-0.5, 0,0);
        glVertex3f(0,0,0); glVertex3f(0, 0.5, 0);
        glVertex3f(0,0,0); glVertex3f(0,-0.5, 0);
        glVertex3f(0,0,0); glVertex3f(0,0, 0.5);
        glVertex3f(0,0,0); glVertex3f(0,0,-0.5);
    glEnd();
    glColor3f(1,1,1);
}
int myTexture(char *filename)
{
    IplImage * img = cvLoadImage(filename); ///OpenCV讀圖
    cvCvtColor(img,img, CV_BGR2RGB); ///OpenCV轉色彩 (需要cv.h)
    glEnable(GL_TEXTURE_2D); ///1. 開啟貼圖功能
    GLuint id; ///準備一個 unsigned int 整數, 叫 貼圖ID
    glGenTextures(1, &id); /// 產生Generate 貼圖ID
    glBindTexture(GL_TEXTURE_2D, id); ///綁定bind 貼圖ID
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT); /// 貼圖參數, 超過包裝的範圖T, 就重覆貼圖
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT); /// 貼圖參數, 超過包裝的範圖S, 就重覆貼圖
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST); /// 貼圖參數, 放大時的內插, 用最近點
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST); /// 貼圖參數, 縮小時的內插, 用最近點
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, img->width, img->height, 0, GL_RGB, GL_UNSIGNED_BYTE, img->imageData);
    return id;
}
const GLfloat light_ambient[]  = { 0.0f, 0.0f, 0.0f, 1.0f };
const GLfloat light_diffuse[]  = { 1.0f, 1.0f, 1.0f, 1.0f };
const GLfloat light_specular[] = { 1.0f, 1.0f, 1.0f, 1.0f };
const GLfloat light_position[] = { 2.0f, 5.0f, 5.0f, 0.0f };

const GLfloat mat_ambient[]    = { 0.7f, 0.7f, 0.7f, 1.0f };
const GLfloat mat_diffuse[]    = { 0.8f, 0.8f, 0.8f, 1.0f };
const GLfloat mat_specular[]   = { 1.0f, 1.0f, 1.0f, 1.0f };
const GLfloat high_shininess[] = { 100.0f };
int main(int argc, char *argv[])
{
    glutInit(&argc, argv);
    //glutInitWindowSize(400,600);
    glutInitWindowPosition(10,10);
    glutInitDisplayMode(GLUT_RGB | GLUT_DOUBLE | GLUT_DEPTH);

    glutCreateWindow("GLUT Shapes");

    glutReshapeFunc(resize);
    glutDisplayFunc(display);
    glutTimerFunc(0, timer, 0);
    glutMouseFunc(mouse);
    glutMotionFunc(motion);
    glutKeyboardFunc(keyboard);
    glutSpecialFunc(special);


    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_LESS);

    glEnable(GL_LIGHT0);
    glEnable(GL_NORMALIZE);
    glEnable(GL_COLOR_MATERIAL);
    glEnable(GL_LIGHTING);

    glLightfv(GL_LIGHT0, GL_AMBIENT,  light_ambient);
    glLightfv(GL_LIGHT0, GL_DIFFUSE,  light_diffuse);
    glLightfv(GL_LIGHT0, GL_SPECULAR, light_specular);
    glLightfv(GL_LIGHT0, GL_POSITION, light_position);

    glMaterialfv(GL_FRONT, GL_AMBIENT,   mat_ambient);
    glMaterialfv(GL_FRONT, GL_DIFFUSE,   mat_diffuse);
    glMaterialfv(GL_FRONT, GL_SPECULAR,  mat_specular);
    glMaterialfv(GL_FRONT, GL_SHININESS, high_shininess);

    loadGundamAll();
    glutMainLoop();

    return EXIT_SUCCESS;
}
