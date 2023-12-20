// Copyright (c) Fuyu Games AB, 2024

class Actor {
  Game game;
  
  PVector location;
  boolean isDead = false;
  
  Actor(Game game) {
    this.game = game;
    this.location = new PVector();
  }
  
  void update() {
  }
  
  void draw() {
  }
}
