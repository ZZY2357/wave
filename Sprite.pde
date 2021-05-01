class Sprite {
  public float x, y, w, h;
  public PVector velocity = new PVector(0, 0);
  
  public Sprite(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void update() {
    this.x += velocity.x;
    this.y += velocity.y;
  }
  
  public void draw() {}
}
