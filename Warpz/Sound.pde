// Copyright (c) Fuyu Games AB, 2024

class Sound {
  Game game;
  
  SoundFile introMusic;
  SoundFile levelMusic;
  SoundFile outroMusic;

  SoundFile fire;
  SoundFile die;
  
  Sound(Game game) {
    this.game = game;
    
    this.introMusic = new SoundFile(Warpz.this, Settings.SOUND_INTRO);
    this.levelMusic = new SoundFile(Warpz.this, Settings.SOUND_MUSIC);
    this.outroMusic = new SoundFile(Warpz.this, Settings.SOUND_OUTRO);

    this.fire = new SoundFile(Warpz.this, Settings.SOUND_FIRE);
    fire.amp(0.25);
    this.die = new SoundFile(Warpz.this, Settings.SOUND_DIE);
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
  
  void playDie() {
    if (!Settings.SOUND) return;
    die.play();
  }
}
