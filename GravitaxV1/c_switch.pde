class Switch extends FBox {

  int id;
  boolean state;
  PImage[] imgs = new PImage[2];

  Switch(int id, boolean defaultState, PImage off, PImage on) {
    super(50, 50);
    id = ID;
    state = defaultState;
    imgs[0] = off;
    imgs[1] = on;
  }

  void act() {
    process();
    display();
  }

  void process() {
    for (int i = 0; i < switches.size(); i++) {
      if (switches.get(i) instanceof SwitchBlock && ((SwitchBlock)switches.get(i)).id == id) {
        SwitchBlock a = ((SwitchBlock)switches.get(i));
        if (protContact(this)) {
          
        }
      }
    }
  }

  void display() {
    this.attachImage(imgs[int(state)]);
  }
}
