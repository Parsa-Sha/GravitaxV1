//float theta = 0;
PVector instantVel;
PVector worldPos;

void game() {
  background(0);

  worldPos = new PVector(width/2-prot.getX(), height/2-prot.getY());

  pushMatrix();
  translate(worldPos.x, worldPos.y);
  //rotate(theta);

  world.draw();
  world.step();
  
  /*
  rectMode(CENTER);
  stroke(255, 50);
  fill(0, 200, 0, 50);
  rect(width/2-75, height/2-75, 50, 50);
  
  if (dist(width/2-75, height/2-75, prot.getX(), prot.getY()) < 2) {
    currentLvl++;
    prot.setPosition(0, 0);
    prot.setVelocity(0, 0);
  }
  
  */
  
  if (goal.isTouchingBody(prot)) {
    currentLvl++;
    prot.setPosition(0, 0);
    prot.setVelocity(0, 0);
  }

  popMatrix();

  textSize(30);
  fill(150);
  text("LVL: " + currentLvl, 50, 50);


  keyAndMouseFunctions();
  //lines();

  world.setGravity(gravity.x, gravity.y);
}

void keyAndMouseFunctions() {

  pmr();
  pkr();

  if (keyPressed) {
    if (keyCode == UP && !levelContact()) { // Gravity Switch, only works when Protagonist isnt touching ground
      gravity = new PVector(0, -980);
    }
    if (keyCode == DOWN && !levelContact()) {
      gravity = new PVector(0, 980);
    }
    if (keyCode == LEFT && !levelContact()) {
      gravity = new PVector(-980, 0);
    }
    if (keyCode == RIGHT && !levelContact()) {
      gravity = new PVector(980, 0);
    }

    if (key == 'W' || key == 'w') {
      if (levelContact()) {
        instantVel = new PVector(prot.getVelocityX(), -500);
        //instantVel.rotate(-theta);
        prot.setVelocity(instantVel.x, instantVel.y);
      }
    }
    if (key == 'S' || key == 's') {
      if (levelContact()) {
        instantVel = new PVector(prot.getVelocityX(), 500);
        //instantVel.rotate(-theta);
        prot.setVelocity(instantVel.x, instantVel.y);
      }
    }
    if (key == 'A' || key == 'a') {
      if (levelContact()) {
        instantVel = new PVector(-500, prot.getVelocityY());
        //instantVel.rotate(-theta);
        prot.setVelocity(instantVel.x, instantVel.y);
      }
    }
    if (key == 'D' || key == 'd') {
      if (levelContact()) {
        instantVel = new PVector(500, prot.getVelocityY());
        //instantVel.rotate(-theta);
        prot.setVelocity(instantVel.x, instantVel.y);
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
