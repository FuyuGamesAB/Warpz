// Copyright (c) Fuyu Games AB, 2024

class Input {
  Game game;
  Ship ship;
  
  boolean inputEnabled = false;
  
  Input(Game game) {
    this.game = game;
    this.ship = game.getShip();
  }
  
  void setEnabled(boolean toggle) {
    this.inputEnabled = toggle;
  }
  
  boolean isEnabled() {
    return inputEnabled;
  }
  
  void mousePressed() {
    if (!inputEnabled) return;
    switch (game.getState()) {
      case Loading:
        break;
      case Intro:
        game.setState(GameState.Level);
        break;
      case Level:
        ship.fire();
        break;
      case Outro:
        game.setState(GameState.Level);
        break;
      case Gameover:
        game.setState(GameState.Level);
        break;
    }
  }
  
  void keyPressed() {
    if (!inputEnabled) return;
    switch (game.getState()) {
      case Loading:
      case Intro:
        break;
      case Level:
        switch (key) {
          case 'w':
          case UP:
            ship.isUp(true);
            break;
          case 's':
          case DOWN:
            ship.isDown(true);
            break;
          case 'a':
          case LEFT:
            ship.isLeft(true);
            break;
          case 'd':
          case RIGHT:
            ship.isRight(true);
            break;
        }
        break;
      case Outro:
        break;
      case Gameover:
        break;
    }
  }

  void keyReleased() {
    if (!inputEnabled) return;
    switch (game.getState()) {
      case Loading:
      case Intro:
        break;
      case Level:
        switch (key) {
          case 'w':
          case UP:
            ship.isUp(false);
            break;
          case 's':
          case DOWN:
            ship.isDown(false);
            break;
          case 'a':
          case LEFT:
            ship.isLeft(false);
            break;
          case 'd':
          case RIGHT:
            ship.isRight(false);
            break;
        }
        break;
      case Outro:
        break;
      case Gameover:
        break;
    }
  }
}
