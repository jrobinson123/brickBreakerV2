
//function for detecting modeCorner objects 

//works for shapes that are Mode(CORNER)
boolean mouseHoverFunctionCorner(int xPos,int yPos,int xSize,int ySize){
  if(mouseX>=xPos&&
  mouseX<=xPos+xSize&&
  mouseY>=yPos&&
  mouseY<=yPos+ySize){
    return true;
  }else{
    return false;
  }
}

//works for shapes that are Mode(CENTER)
boolean mouseHoverFunctionCenter(int xPos,int yPos,int xSize,int ySize){
  if(mouseX>=xPos-xSize/2&&
  mouseX<=xPos+xSize/2&&
  mouseY>=yPos-ySize/2&&
  mouseY<=yPos+ySize/2){
    return true;
  }else{
    return false;
  }
}
