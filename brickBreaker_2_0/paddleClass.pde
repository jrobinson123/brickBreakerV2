

class paddle{
  int paddleX;
  int paddleY;
  int paddleHeight;
  int paddleWidth;
  paddle(){
    paddleX=mouseX;
    paddleY=550;
    paddleHeight=50;
    paddleWidth=100;
  }
  void drawPaddle(){
  rectMode(CENTER);
  fill(255,0,0);
  rect(paddleX,paddleY,100,paddleHeight);
  }
  void updatePaddle(){
    paddleX=mouseX;
    if(paddleX<50){
      paddleX=50;
    }
    if(paddleX>width-50){
      paddleX=width-50;
    }
  }
  void bounceBall(){
    if(gBallY>=paddleY-paddleHeight/2&&
    gBallY<=paddleY+paddleHeight
    &&gBallX>+paddleX-paddleWidth/2
    &&gBallX<paddleX+paddleWidth/2){
     testBall.switchDirY();
     paddleHitNoise.play();
     //note:add borders for if you hit the ball on the side of the paddle
     
     //calculate x velocity
     float xVelAdjust=(gBallX-paddleX)/10;
     testBall.xBounce(xVelAdjust);
     /*if(gBallX<=paddleX){
       testBall.directionXNegative();
     }if(gBallX>paddleX){
       testBall.directionXPositive();
     }*/
   // if(gBallY>=paddleY-paddleheight/
    }  
  }
}
