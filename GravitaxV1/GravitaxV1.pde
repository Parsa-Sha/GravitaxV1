import fisica.*;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEWON = 3;
int mode = INTRO;

FWorld world;
FBox[] level;
FBox goal;
FBox home;
FBox[] lava;
FBox[] block;

ArrayList<FBox> switches;
ArrayList<Enemy> enemies;

FCircle prot;

PVector gravity = new PVector(0, 980);

ArrayList<PImage> lvls = new ArrayList<PImage>();

PImage[] imgs = new PImage[8];
PImage[] protImgs = new PImage[12];
PImage pawnImg;

int currentLvl = 1;
int gravLimit = 1;
int gravSwitches = 0;

void setup() {
  size(800, 800);
  Fisica.init(this);
  world = new FWorld(-4000, -4000, 4000, 4000);
  frameRate(30);
  loadImgs();
  createStuff();
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
  default:
    println("MODE ERROR. MODE = " + mode);
  }
}

void loadImgs(){
  for (int i = 0; i < 9; i++) {
    PImage img = loadImage("/levels/lvl" + (i+1) + ".png");
    lvls.add(img);
  }
  
  imgs[0] = loadImage("/data/redBlockOff.png");
  imgs[1] = loadImage("/data/redBlockOn.png");
  imgs[2] = loadImage("/data/blueBlockOff.png");
  imgs[3] = loadImage("/data/blueBlockOn.png");
  
  imgs[4] = loadImage("data/redSwitchOff.png");
  imgs[5] = loadImage("data/redSwitchOn.png");
  imgs[6] = loadImage("data/blueSwitchOff.png");
  imgs[7] = loadImage("data/blueSwitchOn.png");
  
  for (int i = 0; i < 7; i++) protImgs[i] = loadImage("data/prot" + i + ".png");
  for (int i = 0; i < 6; i++) protImgs[5+i] = loadImage("data/prot" + (6-i) + ".png");
  
  pawnImg = loadImage("data/pawn.png");
  
}
