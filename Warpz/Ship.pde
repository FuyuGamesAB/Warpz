// Copyright (c) Fuyu Games AB, 2024

import processing.sound.*;

class Ship extends Actor {
  
  float MIN_X = 75;
  float MAX_X = width / 2;
  float MIN_Y = 50;
  float MAX_Y = height - 50;
  float MOVE_SPEED = Settings.MOVE_SPEED;
  
  PShape model;
  PShape bullet;
  
  boolean isUp = false;
  boolean isDown = false;
  boolean isLeft = false;
  boolean isRight = false;
  
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  boolean fireWarmup = false;
  float fireSpeed = Settings.FIRE_SPEED;
  float fireMillis = fireSpeed;
  
  int lives = Settings.LIVES;

  Ship(Game game) {
    super(game);
    this.model = loadShape(Settings.MODEL_SHIP);
    this.bullet = loadShape(Settings.MODEL_BULLET);
    this.location = new PVector(100.0, height * 0.5);
  }
  
  ArrayList<Bullet> getBullets() {
    return bullets;
  }
  
  void draw() {
    switch (game.getState()) {
      case Level:
        if (isUp) {
          location.y -= MOVE_SPEED;
        } else if (isDown) {
          location.y += MOVE_SPEED;
        }
        
        if (isLeft) {
          location.x -= MOVE_SPEED;
        } else if (isRight) {
          location.x += MOVE_SPEED;
        }
        
        if (location.x < MIN_X) location.x = MIN_X;
        if (location.x > MAX_X) location.x = MAX_X;
        if (location.y < MIN_Y) location.y = MIN_Y;
        if (location.y > MAX_Y) location.y = MAX_Y;
        
        pushMatrix();
        translate(location.x, location.y);
        shape(model);
        if (Settings.DEBUG) {
          rect(-25, -10, 50, 15);
        }
        popMatrix();
        
        if (fireWarmup) {
          fireMillis -= 1;
          if (fireMillis < 1) {
            fireMillis = fireSpeed;
            fireWarmup = false;
          }
        }
        
        for (int i = 0; i < bullets.size(); i++) {
          Bullet b = bullets.get(i);
          b.draw();
          if (b.location.x >= width) {
            bullets.remove(b);
          }
        }
        break;
    }
  }
  
  void hit(Actor actor) {
    lives--;
    if (lives <= 0) {
      game.setState(GameState.Gameover);
    }
  }
  
  void fire() {
    if (fireWarmup) return;
    
    Bullet b = new Bullet(game, bullet, location.x + 25, location.y);
    bullets.add(b);
    fireWarmup = true;
    game.getSound().playFire();
  }
  
  void isUp(boolean toggle) {
    isUp = toggle;
  }
  
  void isDown(boolean toggle) {
    isDown = toggle;
  }
  
  void isLeft(boolean toggle) {
    isLeft = toggle;
  }
  
  void isRight(boolean toggle) {
    isRight = toggle;
  }
}
