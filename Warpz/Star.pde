// Copyright (c) Fuyu Games AB, 2024

class Star extends Actor {
  int size;
  int speed;
  
  Star(Game game, int size, float x, float y, int speed) {
    super(game);
    this.size = size;
    this.speed = speed;
    this.location = new PVector(x, y);
  }
  
  void draw() {
    switch (game.getState()) {
      case Loading:
        break;
      case Intro:
        pushMatrix();
        noStroke();
        fill(255);
        location.y -= speed;
        if (location.y < 0) {
          location.x = random(0, width);
          location.y = height;
        }
        translate(location.x, location.y);
        ellipse(size, size, size, size);
        popMatrix();
        break;
      case Level:
        pushMatrix();
        noStroke();
        fill(255);
        location.x -= speed;
        if (location.x < 0) {
          location.x = width;
          location.y = random(0, height);
        }
        translate(location.x, location.y);
        ellipse(size, size, size, size);
        popMatrix();
        break;
      case Outro:
        break;
    }
  }
}
