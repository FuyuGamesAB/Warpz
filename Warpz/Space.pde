// Copyright (c) Fuyu Games AB, 2024

class Space {
  Game game;
  
  int TOTAL_STARS = Settings.TOTAL_STARS;
  
  Star[] stars;
 
  Space(Game game) {
    this.game = game;
    
    stars = new Star[TOTAL_STARS];
    for (int i = 0; i < TOTAL_STARS; i++) {
      Star star = new Star(game,
        round(random(1, 3)), 
        round(random(0, width)),
        round(random(0, height)),
        round(random(5, 10))
      );
      stars[i] = star;
    }
  }
  
  void draw() {
    switch (game.getState()) {
      case Loading:
        break;
      case Intro:
      case Level:
        background(0);
        lights();
        for (int i = 0; i < TOTAL_STARS; i++) {
          stars[i].draw();
        }
        break;
      case Outro:
        break;
    }
  }
}
