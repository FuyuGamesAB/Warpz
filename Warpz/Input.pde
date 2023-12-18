// Copyright (c) Fuyu Games AB, 2024

class Input {
  Game game;
  Ship ship;
  
  Input(Game game) {
    this.game = game;
    this.ship = game.getShip();
  }
  
  void draw() {
  }
  
  void mousePressed() {
    switch (game.getState()) {
      case Intro:
        game.setState(GameState.Level);
        break;
      case Level:
        ship.fire();
        break;
      case Outro:
        exit();
        break;
    }
  }
  
  void keyPressed() {
    switch (game.getState()) {
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
    }
  }

  void keyReleased() {
    switch (game.getState()) {
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
    }
  }
}