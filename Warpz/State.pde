// Copyright (c) Fuyu Games AB, 2024

enum GameState {
  Loading,
  Intro,
  Level,
  Outro,
  Gameover
}

class State {
  GameState state = Settings.STARTSTATE;
  Game game;
  
  int waitTime;
  
  State(Game game) {
    this.game = game;
  }
  
  GameState getState() {
    return state;
  }
  
  void setState(GameState newState) {
    switch (state) {
      case Loading:
        endLoading();
        break;
      case Intro:
        endIntro();
        break;
      case Level:
        endLevel();
        break;
      case Outro:
        endOutro();
        break;
      case Gameover:
        endGameover();
        break;
    }
    this.state = newState;
    switch (state) {
      case Loading:
        beginLoading();
        break;
      case Intro:
        beginIntro();
        break;
      case Level:
        beginLevel();
        break;
      case Outro:
        beginOutro();
        break;
      case Gameover:
        beginGameover();
        break;
    }
  }
  
  void update() {
    switch (state) {
      case Loading:
        currentLoading();
        break;
      case Intro:
        currentIntro();
        break;
      case Level:
        currentLevel();
        break;
      case Outro:
        currentOutro();
        break;
      case Gameover:
        currentGameover();
        break;
    }
  }
  
  void beginLoading() {
    waitTime = Settings.LOADINGTIME;
    game.setLevel(LevelState.Loading);
  }
  
  void currentLoading() {
    waitTime -= 1;
    if (waitTime <= 0) {
      setState(GameState.Intro);
      return;
    }
  }
  
  void endLoading() {
    waitTime = 0;
  }
  
  void beginIntro() {
    game.getSound().playIntroMusic();
    game.setLevel(LevelState.Intro);
    waitTime = Settings.WAITTIME;
  }
  
  void currentIntro() {
    waitTime -= 1;
    if (waitTime <= 0) {
      game.getInput().setEnabled(true);
    }
  }
  
  void endIntro() {
    game.getSound().stopMusic();
    game.getLevel().unload();
    waitTime = 0;
  }
  
  void beginLevel() {
    game.getSound().playLevelMusic();
    game.setLevel(LevelState.Ingame);
  }
  
  void currentLevel() {
  }
  
  void endLevel() {
    game.getSound().stopMusic();
    game.getLevel().unload();
    game.getInput().setEnabled(false);
  }
  
  void beginOutro() {
    game.getSound().playOutroMusic();
    game.setLevel(LevelState.Outro);
    waitTime = Settings.WAITTIME;
  }
  
  void currentOutro() {
    waitTime -= 1;
    if (waitTime <= 0) {
      game.getInput().setEnabled(true);
    }
  }
  
  void endOutro() {
    game.getSound().stopMusic();
    game.getLevel().unload();
    waitTime = 0;
  }
  
  void beginGameover() {
    game.getSound().playOutroMusic();
    game.setLevel(LevelState.Failed);
    waitTime = Settings.WAITTIME;
  }
  
  void currentGameover() {
    waitTime -= 1;
    if (waitTime <= 0) {
      game.getInput().setEnabled(true);
    }
  }
  
  void endGameover() {
    game.getSound().stopMusic();
    game.getLevel().unload();
    waitTime = 0;
  }
}
