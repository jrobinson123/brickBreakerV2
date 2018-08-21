# brickBreakerV2
second version

## Introduction
Here is a basic video game I made in my first semester (high school, not college) of computer science. The game is my spin on the classic game Breakout. All code was written in Processing(Java). Writing the code was quite a process *laughter*. It took several weeks and quite a bit of help from my teacher but I was able to finish the project in May 2018. This was my first big project using OOP, so most of my code was implemented with classes and objects.

The game consists of a main menu and two levels. The objective is relatively simple: you try to knock down all the bricks and don’t allow the ball to go beneath the bottom of the screen. The gameplay should be quite intuitive but here are some of the caveats:
You control the paddle with your mouse position
The velocity and angle of the ball’s movement depends on where the ball hit the paddle





## Dependencies
You should be able to modify and play version of brick breaker yourself. All you need is processing(version 3). If you don’t have processing you can download it off the internet:
https://processing.org/download/



processing v3


## Usage
To get my program on your machine you need to open the terminal, clone my work,and then go through the steps to get my files on your computer. Once you have the files, opening any .pde file should open my program and allow you to modify and play it.
open terminal
get clone
open pde file and have processing

## explanation

Here is some of the code in my program. I will do my best to explain how it works.

I’ll start by showing you the code which runs in method void draw. This is essentially two switch statement which display almost everything. The first switch statement controls the levels. The three cases for the switch statement are main menu(a menu which allows you to start the game),level one(the first level), and level two(the second level). As you can see each case in the switch statement runs a single method. Don’t be fooled though each method calls many things including numerous classes. 

The second switch is for UI. The UI essentially lays itself over the base game. The UI switch has three main screens
Lose screen
Win screen
Win screen final(there are two win screens for technical reasons)

In addition to telling the player whether they won or lost, these 3 UI screens can revert users between levels.

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


