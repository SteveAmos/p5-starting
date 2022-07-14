/* Video capture startup template- Setup capture and list available cameras*/

import processing.video.*;

int baseWidth = 640;
int baseHeight = 480;
color bgColor = #101010;

String myData = "../../myData/";
PImage img;
Capture myCam;

void settings(){
    size(baseWidth, baseHeight);
}

void setup() {
    background(bgColor);
    
    //placeholder for image files
    img = loadImage(myData +"test_img.png");

    String[] cameras = Capture.list();
  
    if (cameras.length == 0) {
      println("There are no cameras available for capture.");
      exit();
    } else {
        println("Available cameras:");
        for (int i = 0; i < cameras.length; i++) {
          println(cameras[i]);
        }
      
        // The camera can be initialized directly using an 
        // element from the array returned by list():
        myCam = new Capture(this, cameras[0]);
        myCam.start();     
    }  
}

void draw() {
  
  if (myCam.available() == true) {
    myCam.read();
  }
    image(myCam, 0, 0);
}

void keyPressed() {

  //type 'c' to clear screen
  if (key == 'c' || key == 'C') {
    background(bgColor);
  }

  //type 's' to save one frame
  if (key == 's' || key == 'S') {
    saveFrame("../output/render-#####.png");
  }
}
