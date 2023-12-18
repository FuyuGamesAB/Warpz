// Copyright (c) Fuyu Games AB, 2024

class Bullet extends Actor {
  PShape bullet;
  
  int speed = Settings.BULLET_SPEED;
  
  Bullet(Game game, PShape bullet, float x, float y) {
    super(game);
    this.bullet = bullet;
    this.location = new PVector(x, y);
  }
  
  void draw() {
    pushMatrix();
    location.x += speed;
    translate(location.x, location.y);
    shape(bullet);  
    if (Settings.DEBUG) {
      rect(-5, 0, 10, 5);
    }
    popMatrix();
  }
}
