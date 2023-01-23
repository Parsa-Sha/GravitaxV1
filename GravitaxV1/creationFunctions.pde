void createStuff() {
  setWorld();
  setBoxes();
  setProt();
}

void setWorld() {
  world.setGravity(gravity.x, gravity.y);
}

void setProt() {
  prot = new FCircle(50);
  prot.setVelocity(0, 0);
  prot.setFillColor(0);
  prot.setFriction(4);
  prot.setFill(100, 0, 40);
  prot.setRestitution(0.3);
  prot.setPosition(home.getX(), home.getY());
  prot.setStatic(false);
  prot.setGrabbable(false);
  world.add(prot);
}

int bw = 800;
int bh = 50;

void setBoxes() {
  level = new FBox[4];
  level[0] = new FBox(850, 50);
  level[1] = new FBox(50, 850);
  level[2] = new FBox(850, 50);
  level[3] = new FBox(50, 850);
    
  level[0].setPosition(0, -height/2);
  level[1].setPosition(-width/2, 0);
  level[2].setPosition(0, height/2);
  level[3].setPosition(width/2, 0);
  
  for (int i = 0; i < 4; i++) {
    FBox b = level[i];
    b.setStatic(true);
    b.setGrabbable(false);
    b.setVelocity(0, 0);
    b.setFriction(6);
    b.setFill(255);
    world.add(b);
  } 
  
  lava = new FBox[20];
  for (int i = 0; i < 20; i++) {
    lava[i] = new FBox(50, 50);
    lava[i].setSensor(true);
    lava[i].setGrabbable(false);
    lava[i].setStatic(true);
    lava[i].setFillColor(color(200, 0, 0, 50));
    lava[i].setPosition(-2000, -2000);
    world.add(lava[i]);
  }
  
  //lava[0].setPosition(-200, 200);
  
  block = new FBox[20];
  for (int i = 0; i < 20; i++) {
    block[i] = new FBox(50, 50);
    block[i].setGrabbable(false);
    block[i].setStatic(true);
    block[i].setFill(255);
    block[i].setPosition(-2000, -2000);
    block[i].setStrokeColor(255);
    world.add(block[i]);
  }
  
  switches = new ArrayList<FBox>();
  
  for (int i = 0; i < 2; i++) {
    Switch a = new Switch(i, true, imgs[4 + i*2], imgs[5 + i*2]);
    switches.add(a);
    world.add(a);
  }
  
  
  
  //switches.add(new Switch(0, true, imgs[4], imgs[5])); // Red Switch
  //switches.add(new Switch(1, true, imgs[6], imgs[7])); // Blue Switch
  
  for (int i = 0; i < 20; i++) {
    SwitchBlock b = new SwitchBlock(0, true, imgs[0], imgs[1]);
    SwitchBlock c = new SwitchBlock(1, true, imgs[2], imgs[3]);
    
    switches.add(b);
    switches.add(c);
    
    world.add(b);
    world.add(c);
    
    //switches.add(new SwitchBlock(0, true, imgs[0], imgs[1])); 
    //switches.add(new SwitchBlock(1, true, imgs[2], imgs[3]));
    
  }
  
  enemies = new ArrayList<Enemy>();
  
  Pawn a = new Pawn(pawnImg);
  

  a.setPosition(-2000, 2000);
  a.setStatic(true);

    enemies.add(a);
  world.add(a);

  
  home = new FBox(50, 50);
  home.setSensor(true);
  home.setStatic(true);
  home.setGrabbable(false);
  home.setPosition(0, 0);
  home.setFillColor(color(200, 200, 0, 50));
  world.add(home);

  
  goal = new FBox(50, 50);
  goal.setSensor(true);
  goal.setStatic(true);
  goal.setGrabbable(false);
  goal.setPosition(width/2-75, height/2-75);
  goal.setFillColor(color(0, 200, 0, 50));
  world.add(goal);
}
