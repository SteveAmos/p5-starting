/* Create P5 Video Capture startup template */

int baseWidth = 900;
int baseHeight = 900;
color bgColor = #101010;

String myData = "../myData/";
PImage img;

void settings(){
    size(baseWidth, baseHeight);

}

void setup() {
    background(bgColor);
    
    //placeholder for image files
    img = loadImage(myData +"test_img.png");

}

void draw() {
    fill(#f1f1f1);
    ellipse(mouseX, mouseY, 100, 100);
}

void keyPressed() {

  //type 'c' to clear screen
  if (key == 'c' || key == 'C') {
    background(bgColor);
  }

  //type 's' to save one frame
  if (key == 's' || key == 'S') {
    saveFrame("output/render-#####.png");
  }
}
