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
  if ((protContact(level[0]) || protContact(level[1]) || protContact(level[2]) || protContact(level[3]))) return true;
  return false;
}

void updateMap() {
  PImage lvlImg = lvls.get(currentLvl-1); // Get current lvl img
  for (int i = 0; i < 14; i++) {
    for (int j = 0; j < 14; j++) {
      
      
      
      color c = lvlImg.get(i, j);
      
      println(c);
      
      if (c == color(0)) {
      
      }
      
      if (c == color(255, 0, 0)) {
        
      }
      
      if (c == color(255)) {
        
      }
      
      if (c == color(0, 255, 0)) {
        goal.setPosition(50*i-200, 50*j-400);
        println(50*i-200, 50*j-400);
      }
      
      if (c == color(0, 0, 255)) {
        home.setPosition(50*i-200, 50*j-400);
      }
      
      
      
      
      
    }
  }
}
