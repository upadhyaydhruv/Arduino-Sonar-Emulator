import processing.serial.*;
Serial myPort;
String val;

void setup() {
  //String portName = Serial.list()[0];
  //myPort = new Serial(this, portName, 9600);
  size(1920, 1080);
  background(0);
  drawBack();

}

void draw() {
}

void drawBack(){
  pushMatrix();
  translate(960, 1000);
  noFill();
  strokeWeight(2);
  stroke(98, 245, 31);
  arc(0,0,1800,1800,PI,TWO_PI);
  arc(0,0,1400,1400,PI,TWO_PI);
  arc(0,0,1000,1000,PI,TWO_PI);
  arc(0,0,600,600,PI,TWO_PI);
  stroke(98, 245, 31);
  
  for (int i=0; i<=180; i+=30){
    line(0, 0, 960*cos(radians(i)), -960*sin(radians(i)));
  }
}
