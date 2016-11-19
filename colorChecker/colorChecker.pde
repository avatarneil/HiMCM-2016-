PImage img;
int[] list = new int[192738];
PrintWriter output;
Table data;
//int[] data = loadStrings ("scribs.txt");
void setup() {
  data = loadTable("whichpixel.csv");
  //println(data.getRowCount());
  size(546, 353);
  output = createWriter("america.csv");
  img = loadImage("map_0032yellow.gif");
  loadPixels(); 
  // Since we are going to access the image's pixels too  
  img.loadPixels(); 
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;

      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      // Image Processing would go here
      // If we were to change the RGB values, we would do it here, 
      // before setting the pixel in the display window.

      // Set the display pixel to the image pixel
      //pixels[loc] =  color(r,g,b); 

      if (r==254 && g==208 && b==35) {
        list[loc] = 1;
      } else {
        list[loc]= 0;
      }
      output.print(list[loc]);
      output.print(",");
    }
  }
  for (int i=0; i<=192737; i++) {
    if (data.getFloat(0, i)==1) {
      pixels[i] = color(0, 0, 0);
    } else {
      pixels[i] = color(255, 255, 255);
    }
    println(i);
    updatePixels();
  }
}

void draw() {
}