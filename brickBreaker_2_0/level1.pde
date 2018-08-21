
brick[] bricks;
ball testBall;
paddle gamePaddle;

boolean levelOneStarted=false;
int bricksCounter;

void levelOne(){
  background(0);
  if(!levelOneStarted){
    initializeLevelOne();
  } 
 
  for(int i=0;i<bricks.length;i++){
    bricks[i].drawBrick();
  }
 // gameBall.drawBall();
 testBall.drawBall();
 //testBall.updateBall();
 gamePaddle.drawPaddle();
 gamePaddle.updatePaddle();
 gamePaddle.bounceBall();
 
    if(globalBricksRemaining==0&&level>0){
    println("works"); 
    UI=1;
    gBallY=height/2;
  }
 
}


void initializeLevelOne(){
  bricks=new brick[42];
 testBall=new ball(300,320);
 gamePaddle=new paddle();
  bricksCounter=0;
   for(int col=0;col<7;col++){
    for(int row=0;row<6;row++){
      bricks[bricksCounter]=new brick(brickGap+(col*globalBrickWidth)+(20*col),(globalBrickHeight/2)+(row*globalBrickHeight)+(20*row));
      bricksCounter++;
    }
  }

  
  levelOneStarted=true;
}
