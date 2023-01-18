class SwitchBlock extends FBox {
  
  int id;
  boolean state;
  PImage[] imgs = new PImage[2];
  
  SwitchBlock(int ID, boolean defaultState, PImage off, PImage on) {
    super(50, 50);
    id = ID;
    state = defaultState;
    imgs[0] = off;
    imgs[1] = on;
    this.setStatic(true);
  }
  
  void act() {
    process();
    display(); 
  }
  
  void process() { }
  
  void display() {
    this.attachImage(imgs[ int(state) ]);
    println(int(state));
    //this.setFill(0, 0, 255);
  }
}
