# brickBreakerV2
second version

## Introduction
Here is a basic video game I made in my first semester (high school, not college) of computer science. The game is my spin on the classic game Breakout. All code was written in Processing(Java). Writing the code was quite a process. It took several weeks and quite a bit of help from my teacher but I was able to finish the project in May 2018. This was my first big project using OOP, so most of my code was implemented with classes and objects.

The game consists of a main menu and two levels. The objective is relatively simple: you try to knock down all the bricks and don’t allow the ball to go beneath the bottom of the screen. The gameplay should be quite intuitive but here are some of the caveats:


1.You control the paddle with your mouse position

2.The velocity and angle of the ball’s movement depends on where the ball hit the paddle





## Dependencies
You should be able to modify and play version of brick breaker yourself. All you need is processing(version 3). If you don’t have processing you can download it off the internet:
https://processing.org/download/





## Usage
To get my program on your machine you need to open the terminal, clone my work,and then go through the steps to get my files on your computer. Once you have the files, opening any .pde file should open my program and allow you to modify and play it.


## explanation

Here is some of the code in my program. I will do my best to explain how it works.

I’ll start by showing you the code which runs in method void draw. This is essentially two switch statements which display almost everything. The first switch statement controls the levels. The three cases for the switch statement are main menu(a menu which allows you to start the game),level one(the first level), and level two(the second level). As you can see each case in the switch statement runs a single method. Don’t be fooled though each method calls many things including numerous classes. 

The second switch is for UI. The UI essentially lays itself over the base game. The UI switch has three main screens
Lose screen

Win screen

Win screen final(there are two win screens for technical reasons)

In addition to telling the player whether they won or lost, these 3 UI screens can revert between levels.

```processing
void draw(){  
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

```


That shows how my program is run in most basic forms but there is quite a bit more complexity if you look deeper. Throughout my program there are three custom made classes which are the backbone of gameplay. These three classes are:
A brick class:the bricks are displayed as an array of objects, the class controls where the bricks are,what they look like and how the bricks interact when hit by a ball ) 

```processing 

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



```


A paddle class:The class controls how the paddle moves and how the ball bounces off the brick. The velcoity and direction of the ball changes depnding on where the ball hits the paddle. Feel free to modify the numbers and experiment.
```processing
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


```


A ball class: Controls the physics of the ball

```processing

/hw add borders for other walls
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



```


   


