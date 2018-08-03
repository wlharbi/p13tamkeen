
// Front Ultrasonic sensor
const int FRONT = 11;
// Front side sensors
const int FRONTRIGHT = 12;
const int FRONTLEFT  = 6;
// Back side sensors
const int BACKRIGHT  = 13;
const int BACKLEFT   = 7;
const int SOUNDSPEED_CM_MICROSECOND = 29;

void setup() {
 // initialize serial communication:
 Serial.begin(9600);
}

void loop() {
 // establish variables for duration of the ping, and the distance result
 // in inches and centimeters:
 long durationFront, durationFrontRight, durationFrontLeft, durationBackRight, durationBackLeft;
 int frontSignal , frontrightSignal, frontleftSignal, backrightSignal, backleftSignal;

 // The PING))) is triggered by a HIGH pulse of 2 or more microseconds.
 // Give a short LOW pulse beforehand to ensure a clean HIGH pulse:
 pinMode(FRONT, OUTPUT);
 digitalWrite(FRONT, LOW);
 delayMicroseconds(2);
 digitalWrite(FRONT, HIGH);
 delayMicroseconds(5);
 digitalWrite(FRONT, LOW);
/*
 pinMode(FRONTRIGHT, OUTPUT);
 digitalWrite(FRONTRIGHT, LOW);
 delayMicroseconds(2);
 digitalWrite(FRONTRIGHT, HIGH);
 delayMicroseconds(5);
 digitalWrite(FRONTRIGHT, LOW);

 pinMode(FRONTLEFT, OUTPUT);
 digitalWrite(FRONTLEFT, LOW);
 delayMicroseconds(2);
 digitalWrite(FRONTLEFT, HIGH);
 delayMicroseconds(5);
 digitalWrite(FRONTLEFT, LOW);

 pinMode(BACKRIGHT, OUTPUT);
 digitalWrite(BACKRIGHT, LOW);
 delayMicroseconds(2);
 digitalWrite(BACKRIGHT, HIGH);
 delayMicroseconds(5);
 digitalWrite(BACKRIGHT, LOW);

 pinMode(BACKLEFT, OUTPUT);
 digitalWrite(BACKLEFT, LOW);
 delayMicroseconds(2);
 digitalWrite(BACKLEFT, HIGH);
 delayMicroseconds(5);
 digitalWrite(BACKLEFT, LOW);
 */



 // The same pin is used to read the signal from the PING))): a HIGH pulse
 // whose duration is the time (in microseconds) from the sending of the ping
 // to the reception of its echo off of an object.
 pinMode(FRONT, INPUT);
 durationFront = pulseIn(FRONT, HIGH);
/*
 pinMode(FRONTRIGHT, INPUT);
 durationFrontRight = pulseIn(FRONTRIGHT, HIGH);

 pinMode(FRONTLEFT, INPUT);
 durationFrontLeft = pulseIn(FRONTLEFT, HIGH);

 pinMode(BACKRIGHT, INPUT);
 durationBackRight = pulseIn(BACKRIGHT, HIGH);

 pinMode(BACKLEFT, INPUT);
 durationBackLeft  = pulseIn(BACKLEFT, HIGH);
 */
 // convert the time into a distance
 frontSignal	  = microsecondsToCentimeters(durationFront);
 /*
 frontrightCM = microsecondsToCentimeters(durationFrontRight);
 frontleftCM  = microsecondsToCentimeters(durationFrontLeft);
 backrightCM  = microsecondsToCentimeters(durationBackRight);
 backleftCM   = microsecondsToCentimeters(durationBackLeft);
 */
 Serial.print("F: ");
 Serial.print(frontSignal);
 /*
 Serial.print(" FR: ");
 Serial.print(frontrightCM);
 Serial.print(" FL: ");
 Serial.print(frontleftCM);
 Serial.print(" BR: ");
 Serial.print(backrightCM);
 Serial.print(" BL: ");
 Serial.print(backleftCM);
 */


 Serial.println();

 delay(100);
 
 
 if (frontSignal == 0)
 {
    // stop the motor from moving forward
  }
  else if (frontrightSignal == 0 && frontleftSignal == 0)
  {
    // slow down until minimum speed
    /*
    if (minimumSpeed > MIN_SPEED ){
     // decrease speed
    }
    */
  }
  else if (frontrightSignal == 0 && backrightSignal == 0)
  {
    // turn router to steer onto the left
  }
  else if (frontleftSignal == 0 && backleftSignal == 0)
  {
    // turn router to steer onto the right
  }
  
}

int microsecondsToCentimeters(long microseconds) {

// We take half the distance travelled.
microseconds = microseconds / SOUNDSPEED_CM_MICROSECOND / 2;

if (microseconds <= 140)
{
  return 1;
}
else
{
  return 0;
}
}