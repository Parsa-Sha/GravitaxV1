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
  
  
  //if ((protContact(level[0]) || protContact(level[1]) || protContact(level[2]) || protContact(level[3]))) return true;
  return false;
}

void updateMap() {

  int lavaI = 0;
  int blockI = 0;

  PImage lvlImg = lvls.get(currentLvl-1); // Get current lvl img
  for (int i = 0; i < 14; i++) {
    for (int j = 0; j < 14; j++) {



      color c = lvlImg.get(i, j);


      if (c == color(0)) {
      
      }

      if (c == color(255, 0, 0)) {
        lava[lavaI].setPosition(50*i-width/2 + 75, 50*j-height/2 + 75);
        lavaI++;
      }

      if (c == color(255)) {
        block[blockI].setPosition(50*i-width/2 + 75, 50*j-height/2 + 75);
        blockI++;
      }

      if (c == color(0, 255, 0)) {
        goal.setPosition(50*i-width/2 + 75, 50*j-height/2 + 75);
      }

      if (c == color(0, 0, 255)) {
        home.setPosition(50*i-width/2 + 75, 50*j-height/2 + 75);
      }
    }
  }
}
