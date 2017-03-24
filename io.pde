
void mousePressedMainMenu(){
  mainMenu.onMousePressed();
}

void mousePressedGame(){
  
}

void keyPressedMainMenu(){
  
}

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