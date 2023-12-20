// Copyright (c) Fuyu Games AB, 2024

class OutroLevel extends Level {
  OutroLevel(Game game) {
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
