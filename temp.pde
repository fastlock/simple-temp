

import processing.serial.*;

Serial myPort;  // Create object from Serial class
char val ;      // Data received from the serial port
float x;
float y;
PFont f;
void setup() 
{
  size(200, 200);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName ="/dev/ttyACM0";
  myPort = new Serial(this, portName, 9600);
  x=80.0;
  y=100.0;
  printArray(PFont.list());
   f = createFont("URW Palladio L Bold Italic", 24);
  textFont(f);
}

void draw()
{
  
  String copy = new String();
  byte[] inBuffer = new byte[7];
  while (myPort.available() > 0) {
    inBuffer = myPort.readBytes();
    myPort.readBytes(inBuffer);
    if (inBuffer != null) {
      String myString = new String(inBuffer);
      println(myString);
      fill(255);
      background(0);
      copy=myString;
      
    }
  }
  text(copy,x,y);
  

  

}




