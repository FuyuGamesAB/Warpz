// Copyright (c) Fuyu Games AB, 2024

static class Collision {
  
  static final float TOLERANCE = 10;
  
  static boolean isColliding(Actor rectangleActor, Actor circleActor) {
    float distance = rectangleActor.location.dist(circleActor.location);
    if (distance <= TOLERANCE) {
      return true;
    }
    return false;
  }
 
}
