float theta = 0;
PVector instantVel;

void game() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  rotate(theta);
  world.draw();
  world.step();
  popMatrix();

  strokeWeight(5);
  stroke(255, 0, 0);

  lines();

  world.setGravity(gravity.x, gravity.y);

  if (keyPressed) {
    if (key == 'Q' || key == 'q') {
      theta -= PI/200;
      gravity.rotate(PI/200);
    }
    if (key == 'E' || key == 'e') {
      theta += PI/200;
      gravity.rotate(-PI/200);
    }
  }

  println(prot.getContacts());

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

  line(abs(prot.getX()), abs(prot.getY()), abs(gravity.x), abs(gravity.y));
  line(abs(prot.getX()-50), abs(prot.getY()), abs(gravity.x-50), abs(gravity.y));
  line(abs(prot.getX()+50), abs(prot.getY()), abs(gravity.x+50), abs(gravity.y));


  line(abs(prot.getY()), abs(prot.getX()), abs(gravity.y), abs(gravity.x));
  line(abs(prot.getY()), abs(prot.getX()-50), abs(gravity.y-50), abs(gravity.x));
  line(abs(prot.getY()), abs(prot.getX()+50), abs(gravity.y+50), abs(gravity.x));
}
