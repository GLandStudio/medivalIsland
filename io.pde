//runs when mouse pressed in menu
void mousePressedMainMenu(){
  mainMenu.onMousePressed();
}
//runs when mouse pressed in game
void mousePressedGame(){
  
}
//runs when key pressed in menu
void keyPressedMainMenu(){
  
}
//runs when key pressed in game
void keyPressedGame(){
  if (key == ESC) {
    key = 0;
    win=0;
  }
  if(keyCode == RIGHT){
    cameraPos-=0.4f;
    if(cameraPos<-MAP_WIDTH/2f*100f/13f){
      cameraPos=-cameraPos;
      w.nextMap();
      
    }
  }
  if(keyCode == LEFT){
    cameraPos+=0.4f;
    if(cameraPos>MAP_WIDTH/2f*100f/13f){
      cameraPos=-cameraPos;
      w.prevMap();
      
    }
  }
}