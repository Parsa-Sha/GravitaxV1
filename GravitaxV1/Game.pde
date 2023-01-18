//float theta = 0;
PVector instantVel;
PVector worldPos;

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
  //lines();

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
  gravity = new PVector(0, 980);
  currentLvl++;
  updateMap();
  prot.setPosition(home.getX(), home.getY());
  prot.setVelocity(0, 0);
  prot.setAngularVelocity(0);
}

void restartLvl() {
  gravity = new PVector(0, 980);
  prot.setPosition(home.getX(), home.getY());
  prot.setVelocity(0, 0);
  prot.setAngularVelocity(0);
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
    
    if (key == 'h' || key == 'H') updateMap(); // Remove this once finished
    
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

void lines() {

  //line(prot.getX(), prot.getY(), gravity.x, gravity.y);
  //line(prot.getX()-50, prot.getY(), gravity.x-50, gravity.y);
  //line(prot.getX()+50, prot.getY(), gravity.x+50, gravity.y);

  //line(prot.getY(), prot.getX(), gravity.y, gravity.x);
  //line(prot.getY()-50, prot.getX(), gravity.y-50, gravity.x);
  //line(prot.getY()+50, prot.getX(), gravity.y+50, gravity.x);


  strokeWeight(5);
  stroke(255, 0, 0);

  line(abs(prot.getX()), abs(prot.getY()), abs(gravity.x), abs(gravity.y));
  line(abs(prot.getX()-50), abs(prot.getY()), abs(gravity.x-50), abs(gravity.y));
  line(abs(prot.getX()+50), abs(prot.getY()), abs(gravity.x+50), abs(gravity.y));


  line(abs(prot.getY()), abs(prot.getX()), abs(gravity.y), abs(gravity.x));
  line(abs(prot.getY()), abs(prot.getX()-50), abs(gravity.y-50), abs(gravity.x));
  line(abs(prot.getY()), abs(prot.getX()+50), abs(gravity.y+50), abs(gravity.x));
}
