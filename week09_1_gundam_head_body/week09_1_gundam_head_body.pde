PShape body, head;
void setup() {
  size(400, 400, P3D);
  body = loadShape("body.obj");
  head = loadShape("head.obj");
}
void draw() {
  background(204);
  translate(200, 300);
  sphere(10); // 原點的球

  scale(10, -10, 10); // y要上下再反過來
  shape(body, 0, 0);
  shape(head, 0, 0);
}
