int globalBrickWidth;
int globalBrickHeight;
int gBallX;
int gBallY;
int level;
int UI;
int brickGap;
int globalBricksRemaining;
//only works with 7 bricks
PImage brickImg;
PImage replayButton;
import processing.sound.*;
SoundFile brickHitNoise;
SoundFile paddleHitNoise;


/*remove bottom boundary
create lose and win screen which can navigate to the main menu
2 levels
add sound 
challenge=experiemnt with images of bricks
*/
void setup(){
  size(800,600);
  initializeGame();
  globalBrickWidth=width/10;
  globalBrickHeight=height/20;
  brickGap=globalBrickWidth/2+width/53;
  brickHitNoise = new SoundFile(this, "brickNoise.wav");
  paddleHitNoise = new SoundFile(this, "paddleHit.wav");
  globalBricksRemaining=0;
  
  //note tryfreesound.org
  brickImg= loadImage("brick.jpeg");
  replayButton= loadImage("replay.png");
  level=0;
  UI=0;
}


void draw(){
   
  println(globalBricksRemaining,level);
  
  
  
  
 //println(gBallY);
  background(50);
  //detect which level to run
  switch(level){
    case 0:mainMenu();
          break;
    case 1:levelOne();
          break;
    case 2:levelTwo(); 
          break;
    default:mainMenu();
           break;
          
    
  }
  // UI draws on top of level
  
  switch(UI){
   case 0://nothing
         break;
   case 1:winScreen();
         break;
   case 2:loseScreen();
         break;
   case 3:winScreenFinalLevel();
         break;
   default://nothing();
         break;
  }

}
