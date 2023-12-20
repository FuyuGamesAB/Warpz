// Copyright (c) Fuyu Games AB, 2024

class FailedLevel extends Level {
  FailedLevel(Game game) {
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
