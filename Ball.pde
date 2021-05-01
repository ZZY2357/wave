class Ball extends Sprite {
  public float speed = 3.0;
  
  public Ball(float w, float h, float speed) {
      super(random(width), random(height), w, h);
      this.speed = speed;
      this.velocity.x = this.speed;
      this.velocity.y = this.speed;
      balls.add(this);
  }
  
  public void collideEdges() {
    boolean collideLeftOrRight = this.x + this.w > width || this.x < 0;
    boolean collideTopOrBottom = this.y + this.h > height || this.y < 0;
    if (collideLeftOrRight || collideTopOrBottom) {
      if (score % 10 == 0 && score > 0) {
        Ball newBall = new Ball(30, 30, 3.0 + score / 10);
        gameScene.addSprite(newBall);
      }
      score++;
    }
    if (collideLeftOrRight) {
      this.velocity.x *= -1;
    }
    if (collideTopOrBottom) {
      this.velocity.y *= -1;
    }
  }
  
  public void collidePlayer() {
    if (this.x + this.w > player.x && this.x < player.x + player.w
      && this.y + this.h > player.y && this.y < player.y + player.h) {
        gameOver = true;
        gameOverScene.show();
      }
  }
  
  public void update() {
    this.collidePlayer();
    this.collideEdges();
    
    this.x += this.velocity.x;
    this.y += this.velocity.y;
  }
  
  public void draw() {
    fill(255, 240, 220);
    rect(this.x, this.y, this.w, this.h);
  }
}
