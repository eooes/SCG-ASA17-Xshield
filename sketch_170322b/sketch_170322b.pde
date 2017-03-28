

import processing.serial.*;

Serial myPort; 
void setup() {

  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[3], 57600 );
}
void draw() {
  while (myPort.available() > 0) {
    String inBuffer = trim(myPort.readString());
    //println(inBuffer+" - " +inBuffer.length());
    if (inBuffer != null) {
      if(inBuffer.length() == 5 && inBuffer.charAt(0) == 'R'){
        println(inBuffer);
        int myinBuffer = int(inBuffer.substring(1));
        println(myinBuffer);
      }
    }
  }
}

//void draw() {
//  while (myPort.available() > 0) {
//    char inByte = myPort.readChar();
//    d += inByte;
//    println(d + " - " + d.length());
    
    
//        if(d.length() == 5 && d.charAt(0) == 'R') {
//        println("alright");
//        println(d);
//        d="";
//        break;
//      }
    
//    if(d.length() >= 5) d="";
    
//  }
//  //if( the size is 5 and r is the first letter )
//  // else reset the d

//}