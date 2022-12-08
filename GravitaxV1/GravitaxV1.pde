import fisica.*;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEWON = 3;
final int GAMEOVER = 4;
int mode = INTRO;

FWorld world;
FBox[] level;
FCircle prot;

PVector gravity = new PVector(0, 980);

void setup() {
  size(800, 800);
  Fisica.init(this);
  world = new FWorld();
  frameRate(30);
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
  case GAMEOVER:
    gameover();
    break;
  default:
    println("MODE ERROR. MODE = " + mode);
  }
}
