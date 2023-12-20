// Copyright (c) Fuyu Games AB, 2024

enum LevelState {
  Loading,
  Intro,
  Ingame,
  Outro,
  Failed
}

class Level {
  Game game;
  ArrayList<Actor> actors;
  Actor current;

  Level(Game game) {
    this.game = game;
    this.actors = new ArrayList<>();
  }
  
  void load() {

  }
  
  void draw() {
    background(0);
    lights();
  }
  
  boolean isCleared() {
    return actors.size() < 1;
  }
  
  void kill(Actor actor) {
    actors.remove(actor);
    current = null;
  }
}
