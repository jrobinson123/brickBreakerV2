//boolean loseScreenStarted=false;
//note:choose new font
void winScreen(){
 // background(50);
 rectMode(CENTER);
 imageMode(CENTER);
  fill(50);
  rect(width/2,height/2,4*(width/5),4*(height/5));
  textAlign(CENTER,CENTER);
  textSize(80);
  fill(229, 174, 57);

  
  text("You Win!",width/2,height/4);  
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
  text("Go To Next Level",width/2,height/2);
  
    if(mouseHoverFunctionCenter(width/2,height/2,270,100)&&mousePressed){
     level++;
     UI=0;
     globalBricksRemaining=0;
     levelOneStarted=false;
   }
  
  fill(200,0,0);
  fill(0,0,200);
  rect(width/2,height/4*3,270,100);
   if(mouseHoverFunctionCenter(width/2,height/4*3,270,100)){
     fill(200,0,0);
  }else{
    fill(200);
  }
  text("Go To Main Menu",width/2,height/4*3);
  
   if(mouseHoverFunctionCenter(width/2,height/4*3,270,100)&&mousePressed){
     level=0;
     UI=0;
     levelOneStarted=false;
     levelTwoStarted=false;
   }
  
  
  //border for replay button
   if(mouseHoverFunctionCenter(5*width/6,4*height/5,70,70)){
     fill(200,0,0);
  }else{
    fill(200);
  }
 
  imageMode(CENTER);
  rect(5*width/6,4*height/5,70,70);  
  image(replayButton,5*width/6,4*height/5,70,70);  
  
  
  if(mouseHoverFunctionCenter(5*width/6,4*height/5,70,70)&& mousePressed){
  UI=0;
  globalBricksRemaining=0;
  levelOneStarted=false;
  levelTwoStarted=false;
  }
}
