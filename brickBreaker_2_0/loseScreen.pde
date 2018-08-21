//boolean loseScreenStarted=false;
void loseScreen(){
//  background(50);
  rectMode(CENTER);
  fill(50);
  rect(width/2,height/2,4*(width/5),4*(height/5));
  
  textAlign(CENTER,CENTER);
  textSize(50);
  fill(0,200,100);
  text("You Lose",width/2,height/4);  
  rectMode(CENTER);
  textSize(30);
 
  fill(0,0,200);
  rect(width/2,height/2,270,100);
  fill(200);
  if(mouseHoverFunctionCenter(width/2,height/2,270,100)){
    fill(200,0,0);
  }else{
    fill(200);
  }
  text("Go To Main Menu",width/2,height/2);
   if(mouseHoverFunctionCenter(width/2,height/2,270,100)&&mousePressed){
     level=0;
     UI=0;
     levelOneStarted=false;
   }
   
  
  fill(0,0,200);
  rect(width/2,height/4*3,270,100);
  if(mouseHoverFunctionCenter(width/2,height/4*3,270,100)){
    fill(200,0,0);
  }else{
    fill(200);
  }
  text("Try Again",width/2,height/4*3);
  if(mouseHoverFunctionCenter(width/2,height/4*3,270,100)&& mousePressed){
  UI=0;
  globalBricksRemaining=0;
  levelOneStarted=false;
  levelTwoStarted=false;
  }
 
  
}
