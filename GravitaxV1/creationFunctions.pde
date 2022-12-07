void createStuff() {
  
  setWorld();
  setProt();
  setBoxes();

}

void setWorld() {
  world.setGravity(gravity.x, gravity.y);
}

void setProt() {
  prot = new FCircle(50);
  prot.setVelocity(0, 0);
  prot.setFillColor(0);
  prot.setFriction(1);
  prot.setFill(100, 0, 40);
  prot.setRestitution(0.3);
  prot.setPosition(0, 0);
  prot.setStatic(false);
  prot.setGrabbable(false);
  world.add(prot);
}

void setBoxes() {
  level = new FBox[4];
  level[0] = new FBox(800, 50);
  level[1] = new FBox(50, 800);
  level[2] = new FBox(800, 50);
  level[3] = new FBox(50, 800);
  
  level[0].setPosition(width/2 - width/2, height/8 - height/2);
  level[1].setPosition(width/8 - width/2, height/2 - height/2);
  level[2].setPosition(width/2 - width/2, height*7/8 - height/2);
  level[3].setPosition(width*7/8 - width/2, height/2 - height/2);
  
  
  
  for (int i = 0; i < 4; i++) {
    FBox b = level[i];
    b.setStatic(true);
    b.setGrabbable(false);
    b.setVelocity(0, 0);
    b.setFriction(4);
    b.setFill(255);
    world.add(b);
  }
}
