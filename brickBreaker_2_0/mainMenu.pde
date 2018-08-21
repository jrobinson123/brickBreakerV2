

void mainMenu(){
  fill(200);
  globalBricksRemaining=0;
  textAlign(CENTER,CENTER);
  textSize(54);
  text("Brick Breaker",width/2,height/3);
  fill(200);
  rectMode(CENTER);
  rect(width/2,2*height/3,width/5,height/10);
  //if my mouse hovers over the button fill red,else fill blue
  if(mouseHover()){
    fill(200,0,0);
  }else{
    fill(0,0,200);
  }
  textSize(35);
  text("PLAY",width/2,2*height/3);
  
  if(mouseHover() && mousePressed) level++;
}


  


boolean mouseHover(){
  if(mouseY>=(2*height/3)-(height/20)&&
  mouseY<=(2*height/3)+(height/20)&&
  mouseX>=(width/2)-(width/10)&&
  mouseX<=(width/2)+(width/10)){
    return true;
  }else{
    return false;
  }
}
