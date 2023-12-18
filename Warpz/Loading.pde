class Loading {
  Game game;
  Font font;
  int lines = 20;
  
  Loading(Game game) {
    this.game = game;
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
