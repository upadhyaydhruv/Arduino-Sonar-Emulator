import processing.serial.*;
Serial myPort;
String val;

void setup() {
  //String portName = Serial.list()[0];
  //myPort = new Serial(this, portName, 9600);
  size(1920, 1080);
  background(0);
  drawBack();

import processing.serial.*;
import java.awt.event.KeyEvent;
import java.io.IOException;

Serial myPort;
int iAngle, iDistance;
String data = "";
int index1;

void setup() {
  //String portName = Serial.list()[0];
  //myPort = new Serial(this, portName, 9600);
  size(1920, 1080);
  background(0);
  translate(960, 1000);
  drawBackground();
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('.');
}

void draw() {
  drawLine();
}

void serialEvent(Serial myPort){
  data = myPort.readStringUntil('.');
  data = data.substring(0);
  index1 = data.indexOf(',');
  iAngle = int(data.substring(0, index1));
  iDistance = int(data.substring(index1+1, data.length()));
}

void drawBackground(){
  pushMatrix();
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
  popMatrix();
}

void drawLine() {
  pushMatrix();
  strokeWeight(9);
  stroke(30, 250, 60);
  translate(960, 1000);
  line(0, 0, 960*cos(radians(iAngle)), -960*sin(radians(iAngle)));
  popMatrix();  
}
