enum GameState {
  Loading,
  Intro,
  Level,
  Outro
}

class State {
  GameState state = Settings.STARTSTATE;
  Game game;
  
  int loadingTime;
  
  State(Game game) {
    this.game = game;
    setState(Settings.STARTSTATE);
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
    }
  }
  
  void beginLoading() {
    loadingTime = Settings.LOADINGTIME;
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
  }
  
  void currentIntro() {
  }
  
  void endIntro() {
    game.getSound().stopMusic();
  }
  
  void beginLevel() {
    game.getSound().playLevelMusic();
    game.getLevel().loadLevel1();
  }
  
  void currentLevel() {
  }
  
  void endLevel() {
    game.getSound().stopMusic();
  }
  
  void beginOutro() {
    game.getSound().playOutroMusic();
  }
  
  void currentOutro() {
  }
  
  void endOutro() {
    game.getSound().stopMusic();
  }
}
