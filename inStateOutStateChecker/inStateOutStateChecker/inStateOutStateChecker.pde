PImage img;
int[] list = new int[252864];
PrintWriter output;
Table instate;
Table outstate;
//int[] data = loadStrings ("scribs.txt");
void setup() {
  instate = loadTable("instate.csv");
  outstate = loadTable("outstate.csv");
  //println(data.getRowCount());
  size(546,353);
  output = createWriter("popamerica2.csv");
  loadPixels(); 
  // Since we are going to access the image's pixels too  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      for (int i=0; i<instate.getColumnCount(); i++) {
        if (instate.getFloat(0, i) == loc){
          pixels[loc] = color(255,0,0);
        }
      } for (int i=0; i<outstate.getColumnCount();i++){
        if (outstate.getFloat(0,i) == loc){
          pixels[loc] = color(0,0,255);
        }
      }
    }
    println(y);
  }

      updatePixels();
    }
    void draw() {
    }