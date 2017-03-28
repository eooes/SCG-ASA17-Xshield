import oscP5.*;
import netP5.*;

import processing.serial.*;
/*portToListenTo, port we are listening on, this should be the same as
the outgoing port of TouchOsc on your iphone
*/
int portToListenTo = 7001; 
/*portToSendTo, port we are sending to, this should be the same as
the incomning port of Resolume 3, default it is set to 7000, so you wouldn't need to change it.
*/
int portToSendTo = 7000;
/*ipAddressToSendTo, ip address of the computer we are sending messages to (where Resolume 3 runs)
*/
String ipAddressToSendTo = "localhost";

OscP5 oscP5;
NetAddress myRemoteLocation;
OscBundle myBundle;
OscMessage myMessage;
//end OSC config

Serial myPort; 
void setup() {
  frameRate(25);
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[3], 57600 );
  
  oscP5 = new OscP5(this,portToListenTo);
  myRemoteLocation = new NetAddress(ipAddressToSendTo, portToSendTo);  
  myBundle = new OscBundle();
  myMessage = new OscMessage("/");
  
  
}
void draw() {
  while (myPort.available() > 0) {
    String inBuffer = trim(myPort.readString());
    //println(inBuffer+" - " +inBuffer.length());
    if (inBuffer != null) {
      if(inBuffer.length() == 5 && inBuffer.charAt(0) == 'R'){
        int myinBuffer = int(inBuffer.substring(1));
        
        if(myinBuffer < 5000 && myinBuffer > 300)
        {
        println(myinBuffer);
        float sentbuffer = map(myinBuffer,300,5000,0.0,1.0);
        myMessage.setAddrPattern("/activeclip/video/anchorx/values");
        myMessage.add(sentbuffer);
        myBundle.add(myMessage);
        myMessage.clear();
        oscP5.send(myBundle, myRemoteLocation); 
        myBundle.clear();
    
  
}

      }
    }
  }
}