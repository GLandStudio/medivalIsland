//runs when mouse pressed in menu
void mousePressedMainMenu(){
  mainMenu.onMousePressed();
}
//runs when mouse pressed in game
void mousePressedGame(){
  float mxp;
  int tw = w.x;
  if(mouseX>cameraPos/100f*size()+width/2-size()/13*MAP_WIDTH/2&&mouseX<cameraPos/100f*size()+width/2-size()/13*MAP_WIDTH/2+size()/13*MAP_WIDTH){
    mxp = mouseX-cameraPos/100f*size();
  }
  else if(mouseX>(size()/13*MAP_WIDTH+cameraPos/100f*size())+width/2-size()/13*MAP_WIDTH/2&&mouseX<(size()/13*MAP_WIDTH+cameraPos/100f*size())+width/2-size()/13*MAP_WIDTH/2+size()/13*MAP_WIDTH){
    mxp = mouseX-(size()/13*MAP_WIDTH+cameraPos/100f*size());
    tw=(tw+1)==w.maps.length?0:(tw+1);
  }
  else if(mouseX>(size()/13*(-MAP_WIDTH)+cameraPos/100f*size())+width/2-size()/13*MAP_WIDTH/2&&mouseX<(size()/13*(-MAP_WIDTH)+cameraPos/100f*size())+width/2-size()/13*MAP_WIDTH/2+size()/13*MAP_WIDTH){
    mxp = mouseX-(size()/13*(-MAP_WIDTH)+cameraPos/100f*size());
    tw=(tw-1)==-1?(w.maps.length-1):(tw-1);
  }else{
    mxp = 0;
  }
  int tx = floor((mxp-width/2+MAP_WIDTH/2*size()/13)*13/size());
  int ty = floor((mouseY-height/2+MAP_HEIGHT/2*size()/13)*13/size());
  println(tx+" "+ty);
  if(tx == w.playerX) {
    if(ty == w.playerY) {
      println("");
      println("=========");
      println("Samurais");
      println("2 legions");
      println("HP: 100%");
      println("MOVE: 3");
      println("ATACK: 1");
      println("=========");
      println("");
    }
  }
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
  
  if(keyCode == UP) {
    cameraUD+=0.4f;
  }
  
  if(keyCode == DOWN) {
    cameraUD-=0.4f;
  }
}