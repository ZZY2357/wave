// Wave the game.
// By zzy2357@outlook.com

int[] bgColor = { 30, 30, 30 };
boolean gameOver = false;
int score = 0;
ArrayList<Scene> scenes = new ArrayList<Scene>();
ArrayList<Ball> balls = new ArrayList<Ball>();

void showScore() {
  fill(255, 255, 255);
  textSize(32);
  textAlign(RIGHT, TOP);
  text("Score: " + score, width, 0);
}

void showEnding() {
  fill(255, 255, 255);
  textSize(64);
  textAlign(CENTER, CENTER);
  text("You Died", width / 2, height / 2 - 50);
  textSize(16);
  text("Your Final Score: " + score, width / 2, height / 2 + 5);
  fill(200);
  for (int i = 0; i < 2; i++) {
    text("Press <R> to restart.", width / 2 + random(-1, 1), height / 2 + 32 + random(-1, 1));
  }
}

// Create scenes.
Scene startScene = new Scene(bgColor);
Scene gameScene = new Scene(bgColor);
Scene gameOverScene = new Scene(bgColor);
// The player.
Player player;
// The first ball.
Ball firstBall = new Ball(30, 30, 3.0);
// Buttons.
Button playButton;

void setup() {
  size(800, 600);
  // Add buttons to the start scene.
  playButton = new Button(width / 2 - 200 / 2, height / 2 - 50 / 2, 200, 50,  "PLAY");
  startScene.addSprite(playButton);
  
  // Add player to the scene.
  player = new Player(width / 2 - 50 / 2, height / 2 - 50 / 2);
  gameScene.addSprite(player);
  // Add the first ball.
  gameScene.addSprite(firstBall);
  // Start.
  startScene.show();
}

void mouseClicked() {
   if (playButton.isHovered()) {
     gameScene.show();
   }
}

void restart() {
  score = 0;
  startScene = new Scene(bgColor);
  gameScene = new Scene(bgColor);
  gameOverScene = new Scene(bgColor);
  balls = new ArrayList<Ball>();
  firstBall = new Ball(30, 30, 3.0);
  
  setup();
}

void update() {
  surface.setTitle("Wave the game by zzy2357 | SCORE: " + score);
  
  if (keyPressed && key == 'r') {
    restart();
  }
  
  for (Scene s : scenes) {
    s.update();
  }
}

void draw() {
  update();
  
  background(bgColor[0], bgColor[1], bgColor[2]);
  
  for (Scene s : scenes) {
    s.draw();
  }
  
  if (gameScene.showing) {
    showScore();
  }
  if (gameOverScene.showing) {
    showEnding();
  }
}
