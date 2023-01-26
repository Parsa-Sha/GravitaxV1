void intro() {
  background(50, 50, 100);
  intro.play();
  game.pause();
  game.rewind();
  
  pmr();
  introButton.show();
  
  if (introButton.press()) {
    mode = GAME;
    currentLvl = 1;
    prot.setVelocity(0, 0);
    prot.setAngularVelocity(0);
    gravity = new PVector(0, 980);
    updateMap();
  }
  
  textSize(70);
  fill(100, 0, 255);
  textAlign(CENTER, CENTER);
  text("Gravitax!", width/2, height/3);
}
