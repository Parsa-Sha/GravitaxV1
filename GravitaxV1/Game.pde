float theta = 0;

void game() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  rotate(theta);
  world.draw();
  world.step();
  popMatrix();
  
  if (keyPressed) {
    if (keyCode == LEFT) theta -= PI/200;
    if (keyCode == RIGHT) theta += PI/200;
  }
  
}
