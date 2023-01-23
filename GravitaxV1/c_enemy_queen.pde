class Queen extends Enemy {
  
  int c;
  PImage[] imgs = new PImage[2];
  
  Queen(PImage a, PImage b) {
    super();
    imgs[0] = a;
    imgs[1] = b;
  }
  
  void show() {
  
  }
  
  void act() {
    
    super.act();
    
    c++;
    
    
    if (c == 25) {
      this.attachImage(imgs[0]);
    }
    
    
    if (c == 50) {
      
      enemies.add(new Pawn(0, 1));
      enemies.add(new Pawn(0, -1));
      enemies.add(new Pawn(1, 0));
      enemies.add(new Pawn(-1, 0));
      
    } 
    
    if (c == 75) {
      this.attachImage(imgs[1]);
    }
    
    if (c == 100) {
      c = 0;
      enemies.add(new Pawn(sqrt(2), sqrt(2)));
      enemies.add(new Pawn(sqrt(2), -sqrt(2)));
      enemies.add(new Pawn(-sqrt(2), -sqrt(2)));
      enemies.add(new Pawn(-sqrt(2), sqrt(2)));
    }
    
    
  }
  
}
