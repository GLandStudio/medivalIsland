

int win = 0;
PVector size = new PVector(800,600);

void updateSize(){
  surface.setSize(int(size.x),int(size.y));
}

void setup(){
  fullScreen();
  //updateSize();
  //surface.setResizable(true);
  initMenu();
  initGame();
}

void draw(){
  switch(win){
    case 0:
      drawMainMenu();
      break;
    case 1:
      updateGame();
      drawGame();
      break;
  }
}

void mousePressed(){
  switch(win){
    case 0:
      mousePressedMainMenu();
      break;
    case 1:
      mousePressedGame();
      break;
  }
}

void keyPressed(){
  switch(win){
    case 0:
      keyPressedMainMenu();
      break;
    case 1:
      keyPressedGame();
      break;
  }
}