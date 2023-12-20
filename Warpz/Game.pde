// Copyright (c) Fuyu Games AB, 2024

class Game {
  Ship ship;
  HUD hud;
  Input input;
  State state;
  Sound sound;
  Space space;
  ArrayList<Level> levels;
  Level level;
  
  Game() {
    this.state = new State(this);
    this.ship = new Ship(this);
    this.input = new Input(this);
    this.hud = new HUD(this);
    this.sound = new Sound(this);
    this.space = new Space(this);
    this.levels = createLevels();
    setState(Settings.STARTSTATE);
  }
  
  ArrayList<Level> createLevels() {
    ArrayList<Level> levels = new ArrayList<>(); 
    levels.add(new LoadingLevel(this));
    levels.add(new IntroLevel(this));
    levels.add(new IngameLevel(this));
    levels.add(new OutroLevel(this));
    levels.add(new FailedLevel(this));
    return levels;
  }
  
  void setLevel(LevelState levelState) {
    Level current;
    switch (levelState) {
      case Loading:
        current = levels.get(0);
        break;
      case Intro:
        current = levels.get(1);
        break;
      default:
      case Ingame:
        current = levels.get(2);
        break;
      case Outro:
        current = levels.get(3);
        break;
      case Failed:
        current = levels.get(4);
        break;
    }
    current.load();
    this.level = current;
  }
  
  GameState getState() {
    return state.getState();
  }
  
  void setState(GameState state) {
    this.state.setState(state);
  }
  
  Space getSpace() {
    return space;
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
    level.draw();
    ship.draw();
    hud.draw();
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
