PImage img;
PrintWriter output;
String imageURL = "friendscentral.org";
StringList jList;
int[][] yellowPixels = new int[192738][692];
String j;
void setup() {
  output = createWriter("jlist.csv");
  jList = new StringList();
  size(546, 353);
  for (int i=1; i<=691; i++) {
    if (i<10) {
      imageURL = "https://www.ups.com/using/services/servicemaps/maps25/map_" + "000"+ str(i) + ".gif";
      j = "000" + str(i);
      jList.append(j);
    } else if (i<100) {
      imageURL = "https://www.ups.com/using/services/servicemaps/maps25/map_" + "00" +str(i) + ".gif";
      j = "00" + str(i);
      jList.append(j);
    } else if (i<1000) {
      imageURL = "https://www.ups.com/using/services/servicemaps/maps25/map_" + "0" + str(i) + ".gif";
      j = "0" + str(i);
      jList.append(j);
    }
    img = loadImage(imageURL);
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

        // If pixel is yellow    
        if ((r==255) && (g==209) && (b==36)) {
          yellowPixels[loc][i] = 1;
          //print(yellowPixels[i][loc]);
        } else {
          yellowPixels[loc][i] = 0;
          //print(yellowPixels[i][loc]);
        }
        /*output.print(yellowPixels[loc][i]);
        output.print(",");*/
      }
    } 
    print(jList.get(i-1));
    output.print(jList.get(i-1));
    output.print(",");
    /*output.print("\n");
    updatePixels();
    print(i);
    print("------");*/
  }  print("done");
}

void draw() {
}