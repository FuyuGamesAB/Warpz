// Copyright (c) Fuyu Games AB, 2024

class Virus extends Alien {
  float theta = 0;
  float amplitude = height / 2.5;
  
  Virus(Game game) {
    super(game, loadShape(Settings.MODEL_VIRUS));
    health = 1;
    speed = 2;
    damage = 1;
  }
  
  void update() {
    super.update();
    theta += 0.025;
    location.y = height / 2 + sin(theta) * amplitude;
    location.x -= speed;
    
    if (location.x < 0) {
      location.x = width;
    }
  }
}
