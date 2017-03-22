

import processing.serial.*;

Serial myPort; 
String d;
void setup() {

  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 57600 );
}

void draw() {
  while (myPort.available() > 0 && true) {
    char inByte = myPort.readChar();
    d += inByte;
  }
  //if( the size is 5 and r is the first letter )
  // else reset the d
  if(d.length() == 5 && d.charAt(0) == 'R') {
    println(d);
  } else d="";
}