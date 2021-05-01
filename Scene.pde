class Scene {
  public ArrayList<Sprite> sprites = new ArrayList<Sprite>();
  private boolean showing = false;
  int[] bgColor;
  
  public Scene(int[] bgColor) {
    this.bgColor = bgColor;
    scenes.add(this);
  }
  
  public void addSprite(Sprite s) {
    this.sprites.add(s);
  }
  
  public void show() {
    for (Scene s : scenes) {
      s.hide();
    }
    this.showing = true;
  }
  
  public void hide() {
    this.showing = false;
  }
  
  public void update() {
    if (!this.showing) {
      return;
    }
    
    // Please don't change it to "Sprite s : this.sprites", because it'll cause a problem.
    for (int i = 0; i < this.sprites.size(); i++) {
      this.sprites.get(i).update();
    }
  }
  
  public void draw() {
    if (!this.showing) {
      return;
    }
    
    background(this.bgColor[0], this.bgColor[1], this.bgColor[2]);
    
    for (Sprite s : this.sprites) {
      s.draw();
    }
  }
}
