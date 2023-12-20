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
  
  int loadingTime;
  
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
    loadingTime = Settings.LOADINGTIME;
    game.setLevel(LevelState.Loading);
  }
  
  void currentLoading() {
    loadingTime -= 1;
    if (loadingTime <= 0) {
      setState(GameState.Intro);
      return;
    }
  }
  
  void endLoading() {
    loadingTime = 0;
  }
  
  void beginIntro() {
    game.getSound().playIntroMusic();
    game.setLevel(LevelState.Intro);
  }
  
  void currentIntro() {
  }
  
  void endIntro() {
    game.getSound().stopMusic();
  }
  
  void beginLevel() {
    game.getSound().playLevelMusic();
    game.setLevel(LevelState.Ingame);
  }
  
  void currentLevel() {
  }
  
  void endLevel() {
    game.getSound().stopMusic();
  }
  
  void beginOutro() {
    game.getSound().playOutroMusic();
    game.setLevel(LevelState.Outro);
  }
  
  void currentOutro() {
  }
  
  void endOutro() {
    game.getSound().stopMusic();
  }
  
  void beginGameover() {
    game.getSound().playOutroMusic();
    game.setLevel(LevelState.Failed);
  }
  
  void currentGameover() {
  }
  
  void endGameover() {
    game.getSound().stopMusic();
  }
}
