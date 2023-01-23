class Enemy extends FBox {
  
  float x, y;
  
  
  Enemy() {
    super(50, 50);
  }
  
  void show() {
  
  }
  
  void act() {
    if (protContact(this)) {
      restartLvl();
    }
  }
}
