class Enemy extends FBox {
  
  float x, y, vx, vy;
  int hp;
  
  Enemy() {
    super(50, 50);
    hp = 1;
  }
  
  void show() {
    
  }
  
  void act() {
    x = this.getX();
    y = this.getY();
    
    if (protContact(this)) {
      restartLvl();
    }
    
    if (x > 400 || x < -400 || y > 200 || y < -400) {
      hp = 0;
    }  
  }
}
