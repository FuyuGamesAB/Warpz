// Copyright (c) Fuyu Games AB, 2024

class IngameLevel extends Level {
  
  int elapsed = 0;
  Actor current;
  
  IngameLevel(Game game) {
    super(game);
  }
  
  void load() {
    actors.add(new Virus(game));
    actors.add(new Virus(game));
    actors.add(new Virus(game));
  }
  
  void draw() {
    if (current == null) {
      if (isCleared()) {
        game.setLevel(3);
        return;
      }
      current = actors.get(0);
    }
    current.draw();
  }
  
}
