// Copyright (c) Fuyu Games AB, 2024

class LoadingLevel extends Level {
  Font font;
  int lines = 20;
  
  LoadingLevel(Game game) {
    super(game);
    this.font = new Font();
  }
  
  void draw() { 
    background(0xFFFFFF);
    
    for (int line = 0; line < lines; line++) {
      stroke(color(random(0, 255), random(0, 255), random(0, 255)));
      strokeWeight(75);
      int lineX = round(random(0, width));
      line(lineX, 0, lineX, height);
    }
    
    font.draw("LOADING...", 10, 10);
  }
}
