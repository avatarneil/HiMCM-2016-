PImage img;
String imageURL = "friendscentral.org";
IntList yellowPixels;
void setup() {
  size(546,353);
  yellowPixels = new IntList();
    imageURL = "map_0032.gif";
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
          yellowPixels.append(loc);
        }
      }
    }
    updatePixels();
    print(yellowPixels);
}

void draw() {
}