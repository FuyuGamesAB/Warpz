// Copyright (c) Fuyu Games AB, 2024

class Game {
  Space space;
  Ship ship;
  HUD hud;
  Input input;
  State state;
  Sound sound;
  ArrayList<Level> levels;
  Level level;
  
  Game() {
    this.state = new State(this);
    this.space = new Space(this);
    this.ship = new Ship(this);
    this.input = new Input(this);
    this.hud = new HUD(this);
    this.sound = new Sound(this);
    this.levels = createLevels();
    setState(Settings.STARTSTATE);
  }
  
  ArrayList<Level> createLevels() {
    ArrayList<Level> levels = new ArrayList<>(); 
    levels.add(new LoadingLevel(this));
    levels.add(new IntroLevel(this));
    levels.add(new IngameLevel(this));
    return levels;
  }
  
  void setLevel(int index) {
    Level current = levels.get(index);
    current.load();
    this.level = current;
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
        levels.get(0).draw();
        break;
      case Intro:
        levels.get(1).draw();
        space.draw();
        hud.draw();
        break;
      case Level:
        space.draw();
        ship.draw();
        levels.get(2).draw();
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
