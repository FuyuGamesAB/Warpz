// Copyright (c) Fuyu Games AB, 2024

class Level {
  Game game;
  
  ArrayList<Actor> actors = new ArrayList<>();
  
  Level(Game game) {
    this.game = game;
  }
  
  void load() {
  }
  
  void draw() {
    for (int i = 0; i < actors.size(); i++) {
      Actor actor = actors.get(i);
      actor.update();
      actor.draw();
    }
  }
  
  boolean isCleared() {
    return actors.size() < 1;
  }
  
  void kill(Actor actor) {
    actors.remove(actor);
  }
}
