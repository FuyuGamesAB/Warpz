// Copyright (c) Fuyu Games AB, 2024

class IngameLevel extends Level {
  
  int elapsed = 0;
  Actor current;
  
  IngameLevel(Game game) {
    super(game);
  }
  
  void load() {
    super.load();
    Ship ship = game.getShip();
    ship.reset();

    game.getSpace().load();
    actors.clear();
    actors.add(new Virus(game));
    actors.add(new Virus(game));
    actors.add(new Virus(game));
    actors.add(new Virus(game));
    actors.add(new Virus(game));
  }
  
  void unload() {
    super.unload();
    for (int i = 0; i < actors.size(); i++) {
      Actor actor = actors.get(i);
      actor = null;
    }
    actors.clear();
  }
  
  void draw() {
    super.draw();
    game.getSpace().draw();

    if (isCleared()) {
      game.setState(GameState.Outro);
      return;
    }

    if (current == null) {
      current = actors.get(0);
    }
    if (current != null) {
      current.draw();
    }
    
    Ship ship = game.getShip();
    if (Collision.isColliding(ship, current)) {
      game.getSound().playDie();
      ship.hit(current);
    }
    
    ArrayList<Bullet> bullets = ship.getBullets();
    for (int i = 0; i < bullets.size(); i++) {
      Bullet bullet = bullets.get(i);
      if (Collision.isColliding(bullet, current)) {
        game.getSound().playHit();
        actors.remove(current);
        current = null;
        break;
      }
    }
  }
  
}
