// Copyright (c) Fuyu Games AB, 2024

class IntroLevel extends Level {
  IntroLevel(Game game) {
    super(game);
  }
  
  void load() {
    super.load();
    game.getSpace().load();
  }
  
  void draw() {
    super.draw();
    game.getSpace().draw();
  }
}
