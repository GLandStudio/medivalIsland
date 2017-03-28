//number of window
int win = 0;
//size of window
PVector size = new PVector(800,600);
//Man image
PImage man;
//updates size of window
void updateSize(){
  surface.setSize(int(size.x),int(size.y));
}
//runs on start
void setup(){
  //fullScreen();
  updateSize();
  surface.setResizable(true);
  noStroke();
  initMenu();
  initGame();
  initImages();
}
//initializes images
void initImages(){
  man=loadImage(dataPath("res/textures/man.png"));
}
//returnes size for scailing
int size(){
  return min(height,width*3/4);
}
//runs every frame
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
//runs when mouse clicked
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
//runs when key pressed
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