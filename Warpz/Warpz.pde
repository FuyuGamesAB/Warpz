// Copyright (c) Fuyu Games AB, 2024

// Warpz
// v1, 20231217 - First version (~24h)
// v2, 20231220 - Some additional polish (~6h)

Game game;

void setup() {
  size(1280, 720, P3D);
  frameRate(Settings.FRAMERATE);
  
  game = new Game();
}

void draw() {
  game.update();
  game.draw();
}

void mousePressed() {
  game.mousePressed();
}

void keyPressed() {
  game.keyPressed();
}

void keyReleased() {
  game.keyReleased();
}
