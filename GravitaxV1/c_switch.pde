class Switch extends FBox {

  int id;
  boolean state;
  PImage[] imgs = new PImage[2];

  Switch(int ID, boolean defaultState, PImage off, PImage on) {
    super(50, 50);
    id = ID;
    state = defaultState;
    imgs[0] = off;
    imgs[1] = on;
    this.setStatic(true);
    this.setSensor(true);
  }

  void act() {
    process();
    display();
  }

  boolean c;
  boolean b = false;
  int s;

  void process() {

    s = 0;
    c = false;
    if (protContact(this)) b = true;
    if (b && !protContact(this)) {
      c = true;
      b = false;
    }

    for (int i = 0; i < switches.size(); i++) {
      if (switches.get(i) instanceof SwitchBlock && ((SwitchBlock)switches.get(i)).id == id) {
        SwitchBlock a = ((SwitchBlock)switches.get(i));


        if (c) { // Switch state of any switchblocks
          a.state = !a.state;
          s++;
        }
        
      }
    }
    
    if (s > 0) { // Switch state of self
      s = 0;
      state = !state;
    }
  }


  void display() {
    this.attachImage(imgs[ int(state) ]);
    
    //this.setFill(0, 0, 100);
  }
}
