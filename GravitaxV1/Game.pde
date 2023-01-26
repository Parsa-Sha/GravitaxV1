PVector instantVel;
PVector worldPos;
boolean tips;

int c = 0;

void game() {
  background(0);
  image(bg, 0, -250);
  
  intro.pause();
  intro.rewind();
  game.play();

  worldPos = new PVector(width/2-prot.getX(), height/2-prot.getY());

  pushMatrix();
  translate(worldPos.x, worldPos.y);
  world.draw();
  world.step();
  if (tips) {
    textSize(12);
    fill(255, 150);
    text(lvlTip[currentLvl-1], prot.getX(), prot.getY() - 50);
  }
  popMatrix();
  
  textSize(30);
  fill(150);
  text("LVL: " + currentLvl, 50, 50);
  
  c++;
  if (c > 200) { /// "Blinking"
    prot.attachImage(protImgs[floor(map(c, 200, 600, 0, 11))]);
    if (c >= 600) {
      c = 0;
      prot.setFill(100, 0, 40);
      prot.dettachImage();
    }
  }

  world.setGravity(gravity.x, gravity.y);
  lvlContacts();
  keyAndMouseFunctions();
  switchesAndEnemiesList();
  enemiesSettings();
}

void nextLvl() { // Restart Level and next level functions
  currentLvl++;
  if (currentLvl == 10) {
    mode = GAMEWON;
  }
  updateMap();
  restartLvl();
}

void restartLvl() {
  gravity = new PVector(0, 980);
  prot.setPosition(home.getX(), home.getY());
  prot.setVelocity(0, 0);
  prot.setAngularVelocity(0);
  if (!((Switch) switches.get(0)).state) ((Switch) switches.get(0)).changeState();
  if (!((Switch) switches.get(1)).state) ((Switch) switches.get(1)).changeState();
  tips = false;
  for (int i = 3; i < enemies.size(); i++) {
    world.remove(enemies.get(i));
    enemies.remove(i);
    i--;
  }
  
}

void switchesAndEnemiesList() {
    for (int i = 0; i < switches.size(); i++) { // Actions of all switches
    if (switches.get(i) instanceof Switch) {
      ((Switch) switches.get(i)).act();
    }
    
    if (switches.get(i) instanceof SwitchBlock) {
      ((SwitchBlock) switches.get(i)).act();
    }
  }
  
  for (int i = 0; i < enemies.size(); i++) {
    enemies.get(i).show();
    enemies.get(i).act();
    // This ran restartLvl() in the middle, which caused it issues.
    if (i < enemies.size() && enemies.get(i).hp <= 0 && (abs(enemies.get(i).vx) + abs(enemies.get(i).vy)) != 0) {
      world.remove(enemies.get(i));
      enemies.remove(i);
      i--;
    }
  }
}

void enemiesSettings() {
    
  if (currentLvl == 7) {
    enemies.get(0).setPosition(   abs(map((2 * c) % 600, 0, 600, -600, 600)) - 300   , 150);
  }
  
  if (currentLvl == 8) {
    enemies.get(0).setPosition(  abs(map((5 * c) % 600, 0, 600, -200, 200)) - 100  , 100);
    enemies.get(1).setPosition(  abs(map((5 * c) % 600, 0, 600, -200, 200)) - 100  , -100);
    
  }
  
  if (currentLvl == 9) {
    enemies.get(0).setPosition(-2000, 2000);
    enemies.get(1).setPosition(-2000, 2000);
    enemies.get(2).setPosition(0, 0);
  }
}

void lvlContacts() {
    
  // If hit goal
  if (goal.isTouchingBody(prot)) {
    nextLvl();
  }

  for (int i = 0; i < lava.length; i++) {
    if (lava[i].isTouchingBody(prot)) {
      restartLvl();
      break;
    }
  }
}

void keyAndMouseFunctions() {

  pmr();
  pkr();
  
  if (levelContact()) {
    gravSwitches = gravLimit;
  }
  
  if (keyPressed) {
    if (keyCode == UP && !levelContact() && gravSwitches != 0) { // Gravity Switch, only works when Protagonist is in the air
      gravity = new PVector(0, -980);
      gravSwitches--;
    }
    if (keyCode == DOWN && !levelContact() && gravSwitches != 0) {
      gravity = new PVector(0, 980);
      gravSwitches--;
    }
    if (keyCode == LEFT && !levelContact() && gravSwitches != 0) {
      gravity = new PVector(-980, 0);
      gravSwitches--;
    }
    if (keyCode == RIGHT && !levelContact() && gravSwitches != 0) {
      gravity = new PVector(980, 0);
      gravSwitches--;
    }
    
    if (key == 'R' || key == 'r') {
      mode = GAMEWON;
    }
    
    if (key == 'T' || key == 't') {
      tips = true;
    }
    
    if (key == 'W' || key == 'w') {
      if (levelContact()) {
        instantVel = new PVector(prot.getVelocityX(), -450);
        prot.setVelocity(instantVel.x, instantVel.y);
        //prot.addImpulse(0, -100);
      }
    }
    if (key == 'S' || key == 's') {
      if (levelContact()) {
        instantVel = new PVector(prot.getVelocityX(), 450);
        prot.setVelocity(instantVel.x, instantVel.y);
        //prot.addImpulse(0, 100);
      }
    }
    if (key == 'A' || key == 'a') {
      if (levelContact()) {
        instantVel = new PVector(-450, prot.getVelocityY());
        prot.setVelocity(instantVel.x, instantVel.y);
        //prot.addImpulse(-100, 0);
      }
    }
    if (key == 'D' || key == 'd') {
      if (levelContact()) {
        instantVel = new PVector(450, prot.getVelocityY());
        prot.setVelocity(instantVel.x, instantVel.y);
        //prot.addImpulse(100, 0);
      }
    }
  }
}
