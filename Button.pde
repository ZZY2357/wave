class Button extends Sprite {
  public String text;
  public int[] bgColor = { 80, 80, 80 };
  
  public Button(float x, float y, float w, float h, String text) {
    super(x, y, w, h);
    this.text = text;
  }
  
  public boolean isHovered() {
    if (mouseX < this.x + this.w && mouseX > this.x
      && mouseY < this.y + this.h && mouseY > this.y) {
        return true;
    }
    return false;
  }
  
  public void update() {}
  
  public void draw() {
    if (this.isHovered()) {
      fill(this.bgColor[0] * 0.8, this.bgColor[1] * 0.8, this.bgColor[2] * 0.8);
    } else {
      fill(this.bgColor[0], this.bgColor[1], this.bgColor[2]);
    }
    
    rect(this.x, this.y, this.w, this.h);
    
    // Text
    fill(240, 240, 240);
    textSize(16);
    textAlign(CENTER, CENTER);
    text(this.text, this.x + this.w / 2, this.y + this.h / 2);
  }
}
