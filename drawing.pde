
final int MAP_WIDTH = 16,MAP_HEIGHT=12;
class Tile{
  int x,y,type;
  Tile(int x,int y,int type){
    this.x=x;
    this.y=y;
    this.type=type;
  }
  void draw(){
    //print("hello"+x+" "+y);
    int s = height/13;
    rect(width/2-s*MAP_WIDTH/2+s*x,height/2-s*MAP_HEIGHT/2+s*y,s,s);
  }
}

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
  void draw(){
    for(Tile t:tiles){
      t.draw();
    }
  }
}
class World{
  int x=0;
  Map[] maps;
  World(Map[] maps){
    this.maps=maps;
  }
  void draw(){
    maps[x].draw();
  }
}

World w;

void initGame(){
  Map Gregland = new Map(new int[][]{{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
                                     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},},"Gregland");
  w = new World(new Map[]{Gregland});
}

void drawGame(){
  background(28,107,160);
  w.draw();
}