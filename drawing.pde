//size of map in tiles
final int MAP_WIDTH = 16,MAP_HEIGHT=12;
//x pos of camera
float cameraPos = 0;
//y pos of camera
float cameraUD = 0;
//tile class
class Tile{
  int x,y,type;
  Tile(int x,int y,int type){
    this.x=x;
    this.y=y;
    this.type=type;
  }
  void draw(){
    //print("hello"+x+" "+y);
    //if(type==0)
    //  return;
    int s = size()/13;
    switch(type){
      case 0:
        fill(28,107,160);
        break;
      case 1:
        fill(53, 173, 53);
        break;
      case 2:
        fill(97, 114, 114);
        break;
    }
    rect(width/2-s*MAP_WIDTH/2+s*x,height/2-s*MAP_HEIGHT/2+s*y,s+2,s+2);
  }
}
//parses map
Tile[] parseMap(int[][] m){
  Tile[] ret = new Tile[m.length*m[0].length];
  int a = 0;
  for(int i = 0;i<m.length;i++){
    for(int j = 0;j<m[i].length;j++){
      ret[a]=new Tile(j,i,m[i][j]);
      a++;
    }
  }
  return ret;
}
//extracts map data from loaded file
int[][] extractMap(String[] s){
  int[][] ret = new int[s.length][];
  for(int i = 0;i<s.length;i++){
    String[] a = s[i].replaceAll("\\s+", " ").split(" ");
    ret[i]=new int[a.length];
    for(int j = 0;j<a.length;j++){
      ret[i][j]=int(a[j]);
    }
  }
  return ret;
}
//map class
class Map{
  Tile[] tiles;
  String name;
  Map(Tile[] tiles,String name){
    this.tiles=tiles;
    this.name=name;
  }
  Map(int[][] tiles,String name){
    this.tiles=parseMap(tiles);
    this.name=name;
  }
  Map(String map,String name){
    this.tiles=parseMap(extractMap(loadStrings(map)));
    this.name=name;
  }
  void draw(){
    for(Tile t:tiles){
      t.draw();
    }
  }
}
//world class
class World{
  int x=0;
  Map[] maps;
  int playerMap,playerX,playerY;
  World(Map[] maps){
    this.maps=maps;
    
  }
  void draw(){
    pushMatrix();
    translate(cameraPos/100f*size(),cameraUD/100f*size());
    maps[x].draw();
    if(playerMap==x){
      int s = size()/13;
      image(man,width/2-s*MAP_WIDTH/2+s*playerX,height/2-s*MAP_HEIGHT/2+s*playerY,s,s);
    }
    popMatrix();
    pushMatrix();
    translate(size()/13*MAP_WIDTH+cameraPos/100f*size(),cameraUD/100f*size());
    int y = (x+1)==maps.length?0:(x+1);
    maps[y].draw();
    if(playerMap==y){
      int s = size()/13;
      image(man,width/2-s*MAP_WIDTH/2+s*playerX,height/2-s*MAP_HEIGHT/2+s*playerY,s,s);
    }
    popMatrix();
    pushMatrix();
    translate(size()/13*(-MAP_WIDTH)+cameraPos/100f*size(),cameraUD/100f*size());
    y = (x-1)==-1?(maps.length-1):(x-1);
    maps[y].draw();
    if(playerMap==y){
      int s = size()/13;
      image(man,width/2-s*MAP_WIDTH/2+s*playerX,height/2-s*MAP_HEIGHT/2+s*playerY,s,s);
    }
    popMatrix();
  }
  void nextMap(){
    x=(x+1)==maps.length?0:(x+1);
  }
  void prevMap(){
    x=(x-1)==-1?(maps.length-1):(x-1);
  }
}
//main world
World w;
//runs on start to initialize game
void initGame(){
  Map Gregland = new Map(dataPath("res/maps/Gregland.txt"),"Gregland");
  w = new World(new Map[]{Gregland});
  w.playerMap=0;
  w.playerX=7;
  w.playerY=5;
}
//draws game
void drawGame(){
  background(225, 226, 201);
  w.draw();
}