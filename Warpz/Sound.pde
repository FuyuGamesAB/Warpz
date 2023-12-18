class Sound {
  Game game;
  
  SoundFile introMusic;
  SoundFile levelMusic;
  SoundFile outroMusic;

  SoundFile fire;
  
  Sound(Game game) {
    this.game = game;
    
    this.introMusic = new SoundFile(Warpz.this, "intro.wav");
    this.levelMusic = new SoundFile(Warpz.this, "music.wav");
    this.outroMusic = new SoundFile(Warpz.this, "intro.wav");

    this.fire = new SoundFile(Warpz.this, "laser.wav");
    fire.amp(0.25);
  }
  
  void playIntroMusic() {
    if (!Settings.MUSIC) return;
    introMusic.loop();
  }
  
  void playLevelMusic() {
    if (!Settings.MUSIC) return;
    levelMusic.loop();
  }
  
  void playOutroMusic() {
    if (!Settings.MUSIC) return;
    outroMusic.loop();
  }

  void stopMusic() {
    if (!Settings.MUSIC) return;
    introMusic.stop();
    levelMusic.stop();
    outroMusic.stop();
  }

  void playFire() {
    if (!Settings.SOUND) return;
    fire.play();
  }
}
