//float theta = 0;
PVector instantVel;
PVector worldPos;

int c = 0;

void game() {
  background(0);

  worldPos = new PVector(width/2-prot.getX(), height/2-prot.getY());

  pushMatrix();
  translate(worldPos.x, worldPos.y);
  world.draw();
  world.step();
  popMatrix();
  
  
  lvlContacts();

  textSize(30);
  fill(150);
  text("LVL: " + currentLvl, 50, 50);


  keyAndMouseFunctions();
  
  println(c);
  c++;
  if (c > 200) {
    prot.attachImage(protImgs[floor(map(c, 200, 600, 0, 11))]);
    if (c >= 600) {
      c = 0;
      prot.setFill(100, 0, 40);
      prot.dettachImage();
    }
  }

  world.setGravity(gravity.x, gravity.y);
  
  for (int i = 0; i < switches.size(); i++) { // Actions of all switches
    if (switches.get(i) instanceof Switch) {
      ((Switch) switches.get(i)).act();
    }
    
    if (switches.get(i) instanceof SwitchBlock) {
      ((SwitchBlock) switches.get(i)).act();
    }
  }
}

void nextLvl() {
  currentLvl++;
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
    
    if (key == 'R' || key == 'r') restartLvl();
    
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


    /*
    
     if (key == 'Q' || key == 'q') {
     theta -= PI/200;
     gravity.rotate(PI/200);
     //worldPos.rotate(theta);
     }
     if (key == 'E' || key == 'e') {
     theta += PI/200;
     gravity.rotate(-PI/200);
     //worldPos.rotate(theta);
     }
     
     */
  }
}
