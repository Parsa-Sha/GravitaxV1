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
