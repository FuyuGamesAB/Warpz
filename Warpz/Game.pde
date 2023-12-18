// Copyright (c) Fuyu Games AB, 2024

class Game {
  Loading loading;
  Space space;
  Ship ship;
  HUD hud;
  Input input;
  State state;
  Sound sound;
  Level level;
  
  Game() {
    this.state = new State(this);
    this.loading = new Loading(this);
    this.space = new Space(this);
    this.ship = new Ship(this);
    this.input = new Input(this);
    this.hud = new HUD(this);
    this.sound = new Sound(this);
    this.level = new Level(this);
  }
  
  GameState getState() {
    return state.getState();
  }
  
  void setState(GameState state) {
    this.state.setState(state);
  }
  
  Ship getShip() {
    return ship;
  }
  
  Sound getSound() {
    return sound;
  }
  
  Level getLevel() {
    return level;
  }
  
  void update() {
    state.update();
  }
  
  void draw() {
    switch (state.getState()) {
      case Loading:
        loading.draw();
        break;
      case Intro:
        space.draw();
        hud.draw();
        break;
      case Level:
        space.draw();
        ship.draw();
        level.draw();
        hud.draw();        
        input.draw();
        break;
      case Outro:
        break;
    }
  }
  
  void mousePressed() {
    input.mousePressed();
  }
  
  void keyPressed() {
    input.keyPressed();
  }
  
  void keyReleased() {
    input.keyReleased();
  }
}
