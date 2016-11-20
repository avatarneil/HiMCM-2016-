PImage img;
int[] list = new int[252864];
PrintWriter output;
Table data;
//int[] data = loadStrings ("scribs.txt");
void setup() {
  data = loadTable("bestguess3.csv");
  //println(data.getRowCount());
  size(546,353);
  output = createWriter("popamerica2.csv");
  img = loadImage("popdensmap2.png");
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
      
      /*if ((r>=251 && r<=255) && (g>=251 && g<=255) && (b>=202 && b<=204)) {
        list[loc] = 1;
      } else if((r>=188 && r<=199) && (g>=213 && g<=233) && (b>=174 && b<=180)){
        list[loc] = 2;
      }else if((r>=127 && r<=134) && (g>=193 && g<=205) && (b>=180 && b<=187)){
        list[loc] = 3;
      }else if((r>=65 && r<=86) && (g>=176 && g<=182) && (b>=186 && b<=196)){
        list[loc] = 4;
      }else if((r>=40 && r<=48) && (g>=105 && g<=128) && (b>=150 && b<=184)){
        list[loc] = 5;
      }else if((r>=37 && r<=50) && (g>=52 && g<=64) && (b>=45 && b<=149)){
        list[loc] = 6;
      }
      else {
        list[loc]= 0;
      }

      if (list[loc]==1) {
        pixels[loc]= color(255, 255, 204);
      } else if (list[loc]==2){
        pixels[loc]= color(199, 233, 180);
      }else if (list[loc]==3){
        pixels[loc]= color(127, 205, 187);
      }else if (list[loc]==4){
        pixels[loc]= color(65, 182, 196);
      }else if (list[loc]==5){
        pixels[loc]= color(44, 127, 184);
      }else if (list[loc]==6){
        pixels[loc]= color(37, 52, 148);
      }else {
        pixels[loc] = color(255, 255, 255);
      }*/
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
  updatePixels();
}
void draw() {
}