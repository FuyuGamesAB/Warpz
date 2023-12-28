// Copyright (c) Fuyu Games AB, 2024

class HUD {
  Game game;
  Font font;
  Font font2;
  PImage logo;
  
  int lives = Settings.LIVES;
  int level = 1;
  
  HUD(Game game) {
    this.game = game;
    this.font = new Font(FontType.Black);
    this.font2 = new Font(FontType.White);
    this.logo = loadImage(Settings.IMAGE_LOGO); 
  }
  
  void draw() {
    int x = width / 4;
    int y = height / 4;
    boolean even = millis() % 4 == 1;
    switch (game.getState()) {
      case Loading:
        break;
      case Intro:
        image(logo, x, 10);
        
        font.draw("DURING A WARP-JUMP THE ENERGY CELLS STARTED MISBEHAVE DUE TO MISCALCULATIONS", x, y+20);
        font.draw("THIS LEAD TO AN UNSTABLE ENERGY FIELD BEING CREATED IN SUBSPACE", x, y+40);
        font.draw("WITH CREATURES FLOODING THE GALAXY WE MUST ACT QUICKLY", x, y+60);
        
        font.draw("ELIMINATE THE THREAT AND SEAL THE SUBSPACE BREACH", x, y+1000);
        
        font.draw("THE UNITED MILKYWAY FEDERATION IS COUNTING ON YOU!!", x, y+130);
        
        font.draw("W IS UP", x, y+200);
        font.draw("S IS DOWN", x, y+220);
        font.draw("A IS LEFT", x, y+240);
        font.draw("D IS RIGHT", x, y+260);
        font.draw("MOUSE CLICK TO SHOOT", x, y+280);
        
        if (game.getInput().isEnabled()) {
          if (!even) font.draw("MOUSE CLICK TO CONTINUE", x, y+400);
          if (even) font2.draw("MOUSE CLICK TO CONTINUE", x, y+400);
        }
        
        font.draw(Settings.VERSION, 10, height - 20);
        break;
      case Level:
        pushMatrix();
        translate(0, 10);
        font.draw("LIVES:", 10, 10);
        font.draw("0" + lives, 65, 10);
        font.draw("LEVEL:", width / 2 - 50, 10);
        font.draw("0" + level, width / 2 + 5, 10);
        font.draw("ALIENS:", width - 120, 10);
        font.draw("0" + game.getLevel().actors.size(), width - 60, 10);
        popMatrix();
        break;
      case Outro:
        pushMatrix();
        translate(0, 0);
        image(logo, x, 10);
        
        font.draw("THE SUBSPACE ANOMALY HAS NOW BEEN REVERTED BACK TO NORMAL SPACE", x, y+20);
        font.draw("NOW THAT THE THREAT HAS BEEN ELIMITED WE CAN SAFELY RETURN TO EARTH", x, y+40);
        
        font.draw("OR CAN WE..", x, y+100);
        
        font.draw("THANK YOU FOR PLAYING!", x, y+200);
        if (game.getInput().isEnabled()) {
          if (!even) font.draw("MOUSE CLICK TO CONTINUE", x, y+400);
          if (even) font2.draw("MOUSE CLICK TO CONTINUE", x, y+400);
        }
        popMatrix();
        break;
      case Gameover:
        pushMatrix();
        translate(0, 0);
        image(logo, x, 10);
        font.draw("GAME OVER!", x, y+100);
        if (game.getInput().isEnabled()) {
          if (!even) font.draw("MOUSE CLICK TO TRY AGAIN", x, y+400);
          if (even) font2.draw("MOUSE CLICK TO TRY AGAIN", x, y+400);
        }
        popMatrix();
        break;
    }
  }
}
