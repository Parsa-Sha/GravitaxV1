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
    
    
    if (c == 75) {
      this.attachImage(imgs[0]);
    }
    
    
    if (c == 150) {
      Pawn a = new Pawn(0, sqrt(2));
      Pawn b = new Pawn(0, -sqrt(2));
      Pawn c = new Pawn(sqrt(2), 0);
      Pawn d = new Pawn(-sqrt(2), 0);
      
      a.setPosition(this.getX(), this.getY());
      b.setPosition(this.getX(), this.getY());
      c.setPosition(this.getX(), this.getY());
      d.setPosition(this.getX(), this.getY());
      
      a.setSensor(true);
      b.setSensor(true);
      c.setSensor(true);
      d.setSensor(true);
      
      a.setStatic(true);
      b.setStatic(true);
      c.setStatic(true);
      d.setStatic(true);
      
      world.add(a);
      world.add(b);
      world.add(c);
      world.add(d);
      
      enemies.add(a);
      enemies.add(b);
      enemies.add(c);
      enemies.add(d);
      
    } 
    
    if (c == 225) {
      this.attachImage(imgs[1]);
    }
    
    if (c == 300) {
      c = 0;
      
      Pawn e = new Pawn(1, 1);
      Pawn f = new Pawn(1, -1);
      Pawn g = new Pawn(-1, -1);
      Pawn h = new Pawn(-1, 1);
      
      e.setPosition(this.getX(), this.getY());
      f.setPosition(this.getX(), this.getY());
      g.setPosition(this.getX(), this.getY());
      h.setPosition(this.getX(), this.getY());
      
      e.setSensor(true);
      f.setSensor(true);
      g.setSensor(true);
      h.setSensor(true);

      e.setStatic(true);
      f.setStatic(true);
      g.setStatic(true);
      h.setStatic(true);
      
      
      world.add(e);
      world.add(f);
      world.add(g);
      world.add(h);
      
      enemies.add(e);
      enemies.add(f);
      enemies.add(g);
      enemies.add(h);
    }
    
    
  }
  
}
