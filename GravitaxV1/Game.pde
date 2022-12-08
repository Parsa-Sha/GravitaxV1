float theta = 0;
PVector instantVel;
PVector worldPos;

void game() {
  background(0);

  worldPos = new PVector(width/2-prot.getX(), height/2-prot.getY());


  pushMatrix();
  translate(worldPos.x, worldPos.y);
  rotate(theta);

  world.draw();
  world.step();

  popMatrix();


  keyAndMouseFunctions();
  //lines();

  world.setGravity(gravity.x, gravity.y);
}

void keyAndMouseFunctions() {
  if (keyPressed) {
    
    if (keyCode == UP) {
      gravity = new PVector(0, -980);
    }
    if (keyCode == DOWN) {
      gravity = new PVector(0, 980);
    }
    if (keyCode == LEFT) {
      gravity = new PVector(-980, 0);
    }
    if (keyCode == RIGHT) {
      gravity = new PVector(980, 0);
    }
    
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
  }

  pmr();
  pkr();

  if (keyPressed) {
    if (key == 'W' || key == 'w') {
      if (protContact(level[0]) || protContact(level[1]) || protContact(level[2]) || protContact(level[3])) {
        instantVel = new PVector(prot.getVelocityX(), -500);
        instantVel.rotate(-theta);
        prot.setVelocity(instantVel.x, instantVel.y);
      }
    }
    if (key == 'S' || key == 's') {
      
    }
    if (key == 'A' || key == 'a') {
      if (protContact(level[0]) || protContact(level[1]) || protContact(level[2]) || protContact(level[3])) {
        instantVel = new PVector(-300, prot.getVelocityY());
        instantVel.rotate(-theta);
        prot.setVelocity(instantVel.x, instantVel.y);
      }
    }
    if (key == 'D' || key == 'd') {
      if (protContact(level[0]) || protContact(level[1]) || protContact(level[2]) || protContact(level[3])) {
        instantVel = new PVector(300, prot.getVelocityY());
        instantVel.rotate(-theta);
        prot.setVelocity(instantVel.x, instantVel.y);
      }
    }
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
