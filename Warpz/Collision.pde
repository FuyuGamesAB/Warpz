// Copyright (c) Fuyu Games AB, 2024

static class Collision {

  static boolean isColliding(Actor actor, Actor otherActor) {
    float distance = actor.location.dist(otherActor.location);
    if (distance <= Settings.COLLISION_TOLERANCE) {
      return true;
    }
    return false;
  }
 
}
