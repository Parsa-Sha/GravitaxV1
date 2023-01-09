void intro() {
  background(50, 50, 100);
  if (mousePressed){
    mode = GAME;
    updateMap();
  }
  
  textSize(70);
  fill(100, 0, 255);
  textAlign(CENTER, CENTER);
  text("Gravitax!", width/2, height/3);
}
