class Pawn extends Enemy {
  
  Pawn(PImage img) {
    super();
    this.attachImage(img);
    vx = 0;
    vy = 0;
  }
  
  Pawn(float VX, float VY) {
    this.setFill(255, 0, 0, 150);
    vx = VX;
    vy = VY;
  }
  
  void show() {
    
  }
  
  void act() {
    super.act();
    this.setPosition(this.getX() + vx, this.getY() + vy);
    
  }
  
}
