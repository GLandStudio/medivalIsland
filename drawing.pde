
Menu mainMenu;
class Menu{
  String name;
  int link=-1;
  int type = 0;
  int id = 0;
  ArrayList<Menu> menus = new ArrayList<Menu>();
  public Menu(String name,int type,int id){
    this.name=name;
    this.type=type;
    this.id=id;
  }
  public Menu(String name,int link,int type,int id){
    this.name=name;
    this.link=link;
    this.type=type;
    this.id=id;
  }
  void draw(){
    fill(0);
    textAlign(CENTER);
    switch(type){
      case 0:
        textSize(height/15);
        text(name,width/2,height/7*3+height/8*id);
        break;
      case 1:
        textSize(height/6);
        text(name,width/2,height/3);
        break;
    }
    for(Menu m:menus){
      m.draw();
    }
  }
}

void initMenu(){
  mainMenu = new Menu("Medival Island",1,0);
  Menu play = new Menu("Play",1,0,0);
  mainMenu.menus.add(play);
}

void drawMainMenu(){
  background(255);
  mainMenu.draw();
}

void drawGame(){
  
}