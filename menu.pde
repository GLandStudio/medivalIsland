
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
        textSize(size()/15);
        if(isMouseOver()){
          textSize(size()/14);
        }
        text(name,width/2,height/7*4+height/8*id);
        
        break;
      case 1:
        textSize(size()/10);
        text(name,width/2,height/3);
        break;
      case 2:
        textSize(size()/6);
        text(name,width/2,height/3);
        break;
    }
    for(Menu m:menus){
      m.draw();
    }
  }
  boolean isMouseOver(){
    if(mouseX>width/4){
      if(mouseX<width/4+width/2){
        if(mouseY>height/7*4+height/8*id-height/15){
          if(mouseY<height/7*4+height/8*id-height/15+height/10){
            return true;
          }
        }
      }
    }
    return false;
  }
  void onMousePressed(){
    for(Menu m:menus){
      m.onMousePressed();
    }
    if(!isMouseOver())
      return;
    if(link==-2){
      exit();
    }
    else if(link!=-1){
      win=link;
    }
  }
}

void initMenu(){
  mainMenu = new Menu("Medival Island",-1,2,0);
  Menu play = new Menu("Play",1,0,0);
  //Menu set = new Menu("Settings",2,0,1);
  Menu exit = new Menu("Exit",-2,0,2);
  mainMenu.menus.add(play);
  //mainMenu.menus.add(set);
  mainMenu.menus.add(exit);
}

void drawMainMenu(){
  background(255);
  mainMenu.draw();
}