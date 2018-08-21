boolean levelTwoStarted=false;
int bricksCounter2;
brick[] bricksLevelTwo;

void levelTwo(){
  background(0);
  if(!levelTwoStarted){
    initializeLevelTwo();
  } 
 
  for(int i=0;i<bricksLevelTwo.length;i++){
   bricksLevelTwo[i].drawBrick();
  }
 // gameBall.drawBall();
 testBall.drawBall();
// testBall.updateBall();
 fill(200,0,0);
 gamePaddle.drawPaddle();
 gamePaddle.updatePaddle();
 gamePaddle.bounceBall();
  if(globalBricksRemaining==0&&level>0){
    println("works"); 
    UI=3;
    gBallY=height/2;
  }
 
}


void initializeLevelTwo(){
  for(int i=0;i<bricks.length;i++){
    bricks[i].brickDestroyed=true;
  }
 
  bricksLevelTwo=new brick[16];
  //gameBall=new ball(250,250);
 // testBall=new ball(300,600);
 testBall=new ball(300,400);
 gamePaddle=new paddle();
 bricksCounter2=0;
  int col=0;
  int row=1;
  int brickPosReset=0;
  int maxWidth=7;
 for(int i=0;i<bricksLevelTwo.length;i++){
   bricksLevelTwo[bricksCounter2]=new brick(brickGap+(col*globalBrickWidth)+(col*20),(row*globalBrickHeight)+(row*20));
   bricksCounter2++;
   col++;
   if(col%maxWidth==0&&i>0){
    brickPosReset++;
    col=brickPosReset;
    row++; 
    maxWidth--;
   }
 }
   
 levelTwoStarted=true;       
}
