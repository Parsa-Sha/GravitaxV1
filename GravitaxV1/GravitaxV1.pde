import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer intro, game;

import fisica.*;

final int INTRO = 0;
final int GAME = 1;
final int GAMEWON = 2;
int mode = INTRO;

Button introButton;

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
PImage[] queenImgs = new PImage[2];
String lvlTip[] = new String[10];
PImage bg;

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
  
  minim = new Minim(this);
  intro = minim.loadFile("data/intro.mp3");
  game = minim.loadFile("data/game.mp3");
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
  
  queenImgs[0] = loadImage("data/queen0.png");
  queenImgs[1] = loadImage("data/queen1.png");
  
  introButton = new Button("PRESS START", width/2, height/3*2, 150, 100, color(100), color(200), color(100, 0, 255), color(50, 50, 100), 3, 1);
  
  lvlTip[0] = "A and D to move around!";
  lvlTip[1] = "W to jump!";
  lvlTip[2] = "Avoid lava!";
  lvlTip[3] = "In mid-air, change gravity with arrow keys!";
  lvlTip[4] = "You can only change gravity once per jump!";
  lvlTip[5] = "I think you know how switches work";
  lvlTip[6] = "Two switches and a moving enemy.";
  lvlTip[7] = "Precise Precision time (DGR would be proud)";
  lvlTip[8] = "Hey, don't ask me";
  
  bg = loadImage("data/bg.png");
}
