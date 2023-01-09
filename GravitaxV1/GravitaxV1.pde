import fisica.*;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEWON = 3;
final int GAMEOVER = 4;
int mode = INTRO;

FWorld world;
FBox[] level;
FBox goal;
FBox home;
FBox[] lava;
FBox[] block;
FCircle prot;

PVector gravity = new PVector(0, 980);

ArrayList<PImage> lvls = new ArrayList<PImage>();

int currentLvl = 1;
int gravLimit = 1;
int gravSwitches = 0;

void setup() {
  size(800, 800);
  Fisica.init(this);
  world = new FWorld(-4000, -4000, 4000, 4000);
  frameRate(30);
  createStuff();
  loadImgs();
}

void draw() {
  gamemode();
}

void gamemode() {
  switch (mode) {
  case INTRO:
    intro();
    break;
  case GAME:
    game();
    break;
  case PAUSE:
    pause();
    break;
  case GAMEWON:
    gamewon();
    break;
  case GAMEOVER:
    gameover();
    break;
  default:
    println("MODE ERROR. MODE = " + mode);
  }
}

void loadImgs(){
  for (int i = 0; i < 1; i++) {
    PImage img = loadImage("/levels/lvl" + (i+1) + ".png");
    lvls.add(img);
  }
}
