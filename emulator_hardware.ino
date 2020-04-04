#include <Servo.h>
const int trig = 5;
const int echo = 6;
long duration;
int dis;

Servo servo1;

void setup()
{
	servo1.attach(8);
	Serial.begin(9600);
	pinMode(trig, OUTPUT);
	pinMode(echo, INPUT);
}

void loop()
{
	for (int i=2; i<160; i++){
		servo1.write(i);
		delay(30);
		dis = distance();
		Serial.print(i);
		Serial.print(",");
		Serial.print(dis);
		Serial.print(".");
	}
	for (int i=160; i>2; i--){
		servo1.write(i);
		delay(30);
		dis = distance();
		Serial.print(i);
		Serial.print(",");
		Serial.print(dis);
		Serial.print(".");
	}
	
}

int distance() {
	digitalWrite(trig, LOW);
	delayMicroseconds(2);
	digitalWrite(trig, HIGH);
	delayMicroseconds(10);
	digitalWrite(trig, LOW);
	duration = pulseIn(echo, HIGH);
	int dist = (duration*0.034)/2;
	return dist;
}
