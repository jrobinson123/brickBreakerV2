

 class brick{
//  static int bricksRemaining=0;
  int bricksRemaining;
  int brickX,brickY,brickWidth,brickHeight;
  boolean off;
  boolean brickDestroyed;
  //constructer
  brick(int x,int y){
    globalBricksRemaining++;
    brickX=x;
    brickY=y;
    brickWidth=width/10;
    brickHeight=height/20;
    off=false;
    brickDestroyed=false;
   
  }
  void drawBrick(){
     
    if(ballHover()){
     this.bounce();
     this.brickDestroyed=true;
   
     brickHitNoise.play();
     globalBricksRemaining--;
     //bricksRemaining=bricksRemaining--;
    
      // testBall.switchDirY();
        //brickY-=globalBrickHeight-5;
       //globalBrickHeight+=25;
      // gameBall.switchDirX(); 
     // testBall.switchDirY();
    }
  
    
 
    
    
    if(!brickDestroyed){
    fill(200,0,0);
    rectMode(CORNER);
    stroke(1);
   // rect(brickX,brickY,brickWidth,brickHeight);
   // image(brickImg,brickX,brickY);
    imageMode(CORNER);
    image(brickImg,brickX,brickY,brickWidth,brickHeight);
    }else{
      //nothing
    } 
  }
  void updateBall(){
     if(globalBricksRemaining>1&&level>1){
      UI=3;
    }
  }
  
  boolean ballHover(){
   if(!brickDestroyed&&
   gBallX+10>=brickX&&
   gBallX-10<=brickX+globalBrickWidth&&
   gBallY+10>=brickY&&
   gBallY-10<=brickY+globalBrickHeight){
    return true;  
   }else{
     return false;
   } 
  }
  void bounce(){
    //bounce up
   if(gBallY<brickY)testBall.switchDirY();
    //bounce down
   if(gBallY>brickY+brickHeight)testBall.switchDirY();
    //bounce left
   if(gBallX<brickX+(brickWidth/4))testBall.switchDirX();
    //bounce right
    if(gBallX>brickX+(brickWidth/4)*3)testBall.switchDirX();
  }
}
