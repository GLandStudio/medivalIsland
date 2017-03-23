
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
    //if(type==0)
    //  return;
    int s = height/13;
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
  Map Gregland = new Map(dataPath("res/maps/Gregland.txt"),"Gregland");
  w = new World(new Map[]{Gregland});
}

void drawGame(){
  background(225, 226, 201);
  w.draw();
}