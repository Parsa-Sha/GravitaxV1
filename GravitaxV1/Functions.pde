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
  
  return false;
}

void updateMap() {

  int lavaI = 0;
  int blockI = 0;

  PImage lvlImg = lvls.get(currentLvl-1); // Get current lvl img
  for (int i = 0; i < 20; i++) {
    lava[i].setPosition(-2000, 2000);
    block[i].setPosition(-2000, 2000);
    
  }
  
  for (int i = 0; i < 15; i++) {
    for (int j = 0; j < 15; j++) {
      color c = lvlImg.get(i, j);

      if (c == color(255, 0, 0)) {
        lava[lavaI].setPosition(50*i-width/2 + 50 - 1, 50*j-height/2 + 50);
        lavaI++;
      }

      if (c == color(255)) {
        block[blockI].setPosition(50*i-width/2 + 50, 50*j-height/2 + 50);
        //if (lvlImg.get(i, j+1))
        blockI++;
      }

      if (c == color(0, 255, 0)) {
        goal.setPosition(50*i-width/2 + 50, 50*j-height/2 + 50);
      }

      if (c == color(0, 0, 255)) {
        home.setPosition(50*i-width/2 + 50, 50*j-height/2 + 50 - 1);
      }
    }
  }
  
  prot.setPosition(home.getX(), home.getY());
}
