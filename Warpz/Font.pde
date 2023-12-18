// Copyright (c) Fuyu Games AB, 2024

class Font {
  PImage image;
  PImage[] glyphs;
  
  int spacing = 0;
  int rows = 16;
  int columns = 16;
  int glyphSize = 8;
  int fontSize = 8;
  
  Font() {
    this.image = loadImage(Settings.IMAGE_FONT);
    this.glyphs = new PImage[rows * columns];
    for (int g = 0; g < glyphs.length; g++) {
      int c = g % columns * glyphSize;
      int r = g / columns * glyphSize;
      glyphs[g] = image.get(c, r, glyphSize, glyphSize);
    }
  }
  
  void draw(int text, float x, float y) {
    draw(text + "", x, y);
  }
  
  void draw(String text, float x, float y) {
    char[] chars = text.toCharArray();
    for (int i = 0; i < chars.length; i++) {
      int charIndex = chars[i];
      pushMatrix();
      translate(x + (glyphSize * i) + spacing, y);
      image(glyphs[charIndex], glyphSize, glyphSize);
      popMatrix();
    }
  }
}
