class Player extends Sprite {
  public int speed = 3;
  public Player(float x, float y) {
      super(x, y, 50, 50);
  }
  
  public void update() {
    if (keyPressed) {
      if (key == 'w') {
        this.velocity.x = 0;
        this.velocity.y = -speed;
      }
      if (key == 's') {
        this.velocity.x = 0;
        this.velocity.y = speed;
      }
      if (key == 'a') {
        this.velocity.y = 0;
        this.velocity.x = -speed;
      }
      if (key == 'd') {
        this.velocity.y = 0;
        this.velocity.x = speed;
      }
    }
    
    if (this.x + this.w > width || this.x < 0) {
      this.velocity.x *= -1;
    }
    if (this.y + this.h > height || this.y < 0) {
      this.velocity.y *= -1;
    }
    
    this.x += velocity.x;
    this.y += velocity.y;
  }
  
  public void draw() {
    fill(240, 0, 0);
    rect(this.x, this.y, this.w, this.h);
  }
}
