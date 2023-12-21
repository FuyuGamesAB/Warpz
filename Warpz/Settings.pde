// Copyright (c) Fuyu Games AB, 2024

static class Settings {
  static final String VERSION = "V2 20231220";  
  static final int FRAMERATE = 60;
  static final int LOADINGTIME = 75;
  static final int WAITTIME = 75;
  static final int TOTAL_STARS = 50;
  static final GameState STARTSTATE = GameState.Loading;
  
  static final boolean DEBUG = false;
  static final boolean SOUND = true;
  static final boolean MUSIC = true;

  static final int LIVES = 1;
  static final int FIRE_SPEED = 10;
  static final int BULLET_SPEED = 10;
  static final int MOVE_SPEED = 10;
  static final int COLLISION_TOLERANCE = 10;
  
  static final String MODEL_SHIP = "ship.obj";
  static final String MODEL_BULLET = "bullet.obj";
  static final String MODEL_VIRUS = "virus.obj";
  
  static final String IMAGE_FONT_WHITE = "ascii_white.bmp";
  static final String IMAGE_FONT_BLACK = "ascii_black.bmp";
  static final String IMAGE_LOGO = "logo.png";
  
  static final String SOUND_INTRO = "intro.wav";
  static final String SOUND_MUSIC = "music.wav";
  static final String SOUND_OUTRO = "outro.mp3";
  static final String SOUND_FIRE = "laser.wav";
  static final String SOUND_DIE = "die.wav";
  static final String SOUND_HIT = "hit.wav";
  
}
