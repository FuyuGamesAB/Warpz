// Copyright (c) Fuyu Games AB, 2024

class Space {
  Game game;
  ArrayList<Star> stars;
  
  Space(Game game) {
    this.game = game;
    this.stars = new ArrayList<>();
  }
  
  void load() {
    stars.clear();
    for (int i = 0; i < Settings.TOTAL_STARS; i++) {
      Star star = new Star(game,
        round(random(1, 3)), 
        round(random(0, width)),
        round(random(0, height)),
        round(random(5, 10))
      );
      stars.add(star);
    }
  }
  
  void draw() {
    for (int i = 0; i < Settings.TOTAL_STARS; i++) {
      Star star = stars.get(i);
      star.update();
      star.draw();
    }
  }
}
