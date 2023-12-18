// Copyright (c) Fuyu Games AB, 2024

class Alien extends Actor {
  PShape model;
  int health = 1;
  int speed = 1;
  int damage = 1;
  
  Alien(Game game, PShape model) {
    super(game);
    this.model = model;
  }
  
  void update() {
    Ship ship = game.getShip();
    if (Collision.isColliding(ship, this)) {
      exit();  // @TODO
    }
  }
  
  void draw() {
    update();
    
    pushMatrix();
    translate(location.x, location.y);
    shape(model);
    if (Settings.DEBUG) {
      ellipse(0, 0, 30, 30);
    }
    popMatrix();
  }
  
  void hit() {
    health--;
    if (health < 1) {
      die();
    }
  }
      
  void die() {
    game.getLevel().kill(this);
  }
}
