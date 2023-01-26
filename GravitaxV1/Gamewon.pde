void gamewon() {
  image(bg, 0, -250);
  textSize(60);
  textLeading(60);
  text("Congrats, you've wasted\nyour time!", width/2, height/2);

  textSize(30);
  text("Click anywhere to restart", width/2, height/2 + 100);
  if (mousePressed) mode = INTRO;
}
