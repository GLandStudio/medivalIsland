int win = 0;


void setup(){
  size(800,600);
  surface.setResizable(true);
  initMenu();
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