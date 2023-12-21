// Copyright (c) Fuyu Games AB, 2024

class Actor {
  Game game;
  
  PVector location;
  PVector rotation;
  boolean isDead = false;
  
  Actor(Game game) {
    this.game = game;
    this.location = new PVector();
    this.rotation = new PVector();
  }
  
  void update() {
  }
  
  void draw() {
  }
}
