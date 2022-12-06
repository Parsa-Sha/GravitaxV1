float theta = 0;

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
    if (keyCode == LEFT){
      theta -= PI/200;
      gravity.rotate(PI/200);
    }
    if (keyCode == RIGHT) {
      theta += PI/200;
      gravity.rotate(-PI/200);
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
  line(abs(prot.getY()-50), abs(prot.getX()), abs(gravity.y-50), abs(gravity.x));
  line(abs(prot.getY()+50), abs(prot.getX()), abs(gravity.y+50), abs(gravity.x));
}
