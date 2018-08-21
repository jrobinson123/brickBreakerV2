
//hw add borders for other walls
//make two methods for flipping x,and y vel from - to +
//ballHover-if ball intersects a brick-print statements
class ball{
  float xVel;
  int yVel;
  ball(int x,int y){
    gBallX=x;
    gBallY=y;
    xVel=2;
    yVel=5;
   
  }
  void drawBall(){
    ellipseMode(CENTER);
    fill(0,0,200);
    noStroke();
    ellipse(gBallX,gBallY,20,20); 
    this.updateBall();
    this.checkWalls();
   // testBall.upOnY();
    
  }
  void updateBall(){
    gBallX+=xVel;
    gBallY+=yVel; 
    gBallY--;
  }
  void switchDirY(){
    yVel=yVel*-1;
  }
  void  switchDirX(){
    xVel=xVel*-1;
  }
  void directionXPositive(){
    xVel=2;
  }
  void directionXNegative(){
    xVel=-2;
  }
  /*void upOnY(){
    gBallY+=-5;
  }
  */
  void checkWalls(){
    
   if(gBallY>height-10  ){
   //this.switchDirY();
   UI=2;
  // gBallY=589;
  }else{
  }
  if(gBallY<10){
     this.switchDirY();
   gBallY=11;
  }
 
  
 if(gBallX>width-10
  || gBallX<10){
   this.switchDirX(); 
  }
    //delete later doesn't comply with rules
    
  }
  void xBounce(float xVelAdjust){
    xVel=xVelAdjust;
  }
}
