boolean mouseReleased;
boolean wasPressed;

void pmr() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && mousePressed == false) {
    mouseReleased = true;
    wasPressed = false;
  }
}

boolean keyReleased;
boolean keyWasPressed;

void pkr() {
  keyReleased = false;
  if (keyPressed) keyWasPressed = true;
  if (keyWasPressed && keyPressed == false) {
    keyReleased = true;
    keyWasPressed = false;
  }
}

boolean protContact(FBody deBody) {
  ArrayList<FContact> contactList = prot.getContacts();
  for (int i = 0; i < contactList.size(); i++) {
    FContact myContact = contactList.get(i);
    if (myContact.contains(deBody)) return true;
  }
  return false;
}

boolean levelContact() {
  
  for (int i = 0; i < level.length; i++) {
    if (protContact(level[i])) return true;
  }
  
  for (int i = 0; i < block.length; i++) {
    if (protContact(block[i])) return true;
  }
  
  for (int i = 0; i < switches.size(); i++) {
    if (switches.get(i) instanceof SwitchBlock) {
      if (((SwitchBlock) switches.get(i)).state) {
        if (protContact(((SwitchBlock) switches.get(i)))) return true;
      }
    }
    
    if (switches.get(i) instanceof Switch) {
      if (protContact(switches.get(i))) return true;
    }
    
  }
  
  return false;
}

void updateMap() {

  int lavaI = 0;
  int blockI = 0;
  int redI = 0;
  int blueI = 0;

  PImage lvlImg = lvls.get(currentLvl-1); // Get current lvl img
  for (int i = 0; i < 20; i++) {
    lava[i].setPosition(-2000, 2000);
    block[i].setPosition(-2000, 2000);
  }
  
  for (int i = 0; i < switches.size(); i++) switches.get(i).setPosition(-2000, 2000);
  
  // Maybe create when needed, set to position when created. Destroy all blocks before new lvl
  
  
  for (int i = 0; i < 15; i++) { // Loop through imported image and find location
    for (int j = 0; j < 15; j++) {
      color c = lvlImg.get(i, j);

      if (c == color(255, 0, 0)) { // Lava
        lava[lavaI].setPosition(50*i-width/2 + 50 - 1, 50*j-height/2 + 50);
        lavaI++;
      }

      if (c == color(255)) { // Blocks
        block[blockI].setPosition(50*i-width/2 + 50, 50*j-height/2 + 50);
        blockI++;
      }

      if (c == color(0, 255, 0)) { // Goal
        goal.setPosition(50*i-width/2 + 50, 50*j-height/2 + 50);
      }

      if (c == color(0, 0, 255)) { // Home
        home.setPosition(50*i-width/2 + 50, 50*j-height/2 + 50 - 1);
      }
      
      if (c == color(100, 0, 0)) { // Red Switch Block
        switches.get(2 + 2*redI).setPosition(50*i-width/2 + 50 - 1, 50*j-height/2 + 50);
        redI++;
      }
      
      if (c == color(200, 0, 0)) { // Red Switch
        switches.get(0).setPosition(50*i-width/2 + 50 - 1, 50*j-height/2 + 50);
      }
      
      if (c == color(0, 0, 100)) { // Blue Switch Block
        switches.get(3 + 2*blueI).setPosition(50*i-width/2 + 50 - 1, 50*j-height/2 + 50);  
        blueI++;
      }
      
      if (c == color(0, 0, 200)) { // Blue Switch
        switches.get(1).setPosition(50*i-width/2 + 50 - 1, 50*j-height/2 + 50);
      }
    }
  }
  
  prot.setPosition(home.getX(), home.getY());
}
