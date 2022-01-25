//need to import the random function so a random number can be generated for when the die is rolled
import java.util.Random;

//Create all the 'global' variables that will be needed throughout the code
//This variable checks if the game is running
boolean running = true;

//This variable gives the total number of moves in the game
//It is used in the code later on to see if it's player1's turn or player2's turn
int moves = 0;

//This variable tracks whos turn it is and is used to display information of the window created when the code is run
int player = 1;

//These variables below are the counters initial coordinates on the window
int player1X = 70;
int player1Y = 550;
int player2X = 50;
int player2Y = 550;

//These variables are used to track how much the player got when they rolled the die
int player1NumMoves = 0;
int player2NumMoves = 0;

//These variables are used to track the amount of time between each players roll
int player1TimeOfLastMove = 0;
int player2TimeOfLastMove = 0;

//These variables act as flags so they are only true when it is their turn
//This makes the counter move only when it is that players turn
boolean player1Moving = false;
boolean player2Moving = false;

//These variables initialise and set the position of the dice on the window
int dieX = 750;
int dieY = 50;
int dieW = 100;
int dieH = 100;

//These variables track the mouse points so the mouse points can be checked to see if the mouse is being clicked inside the die when the players roll
float pointX = 0;     
float pointY = 0;

//This variable initialises the number on dice. This will be changed when the players click the die
int dieNum = 1;

//These variables below are image variables that will be placed on the window
PImage purpleSnake;
PImage orangeSnake;
PImage pinkSnake;
PImage blueLadder;
PImage redLadder;

//These two variables set up the initial direction of the player1 counter
int dirX1 = 1;
int dirY1 = 0;

//These two variables set up the initial direction of the player2 counter
int dirX2 = 1;
int dirY2 = 0;

//The next big chunk of variables are flags to help with working out if a counter has gone up a ladder or down a snake
//The RED LADDER flags
//These variables see if the counters have gone up the RED ladder
boolean upRedLadderP1 = false;
boolean upRedLadderP2 = false;
//These variables tell the counters if they should go up the RED ladder
boolean goupRedLadderP1 = false;
boolean goupRedLadderP2 = false;

//BLUE LADDER
//These variables see if the counters have gone up the BLUE ladder
boolean upBlueLadderP1 = false;
boolean upBlueLadderP2 = false;
//These variables tell the counters if they should go up the BLUE ladder
boolean goupBlueLadderP1 = false;
boolean goupBlueLadderP2 = false;

//PURPLE SNAKE
//These variables see if the counters have gone down the PURPLE snake
boolean downPurpleSnakeP1 = false;
boolean downPurpleSnakeP2 = false;
//These variables tell the counters if they should go down the PURPLE snake
boolean godownPurpleSnakeP1 = false;
boolean godownPurpleSnakeP2 = false;

//ORANGE SNAKE
//These variables see if the counters have gone down the ORANGE snake
boolean downOrangeSnakeP1 = false;
boolean downOrangeSnakeP2 = false;
//These variables tell the counters if they should go down the ORANGE snake
boolean godownOrangeSnakeP1 = false;
boolean godownOrangeSnakeP2 = false;

//PINK SNAKE
//These variables see if the counters have gone down the PINK snake
boolean downPinkSnakeP1 = false;
boolean downPinkSnakeP2 = false;
//These variables tell the counters if they should go down the PINK snake
boolean godownPinkSnakeP1 = false;
boolean godownPinkSnakeP2 = false;

//This is a method that doesn't return anything but stores the window size
void settings(){
   size(900, 600);
}

//This method fills the window and is only ran once
void setup() {  
   fill(200, 0, 0);
}

//This method draws all the elements repeatedly on the window at set intervals
void draw(){
  //Here another method is called to be run so it draws all the key elements when needed
   drawBoard();
   //Here the mouse points are being updated
   pointX = mouseX;
   pointY = mouseY;
  
  //This checks to see if the game is still running and if it is it then checks for more conditions
   if (running == true){
     //This checks for specific conditions to see if the player1 counter needs to be moved. 
      if(player1Moving && millis() - player1TimeOfLastMove >= 500 && player == 1) {
         player1TimeOfLastMove = millis();
         
         //These three lines of code display which players turn it is so it is player1 here
         textSize(30);
         fill(255, 51, 51);
         text("Player " + player, 710, 200);
         
         //If the number of moves is greater than the dice number the player1 counter stops moving 
         if (player1NumMoves > dieNum) {
            player1Moving = false;
            
            //These four lines of code switch over which players turn it is so it is now player2
            textSize(30);
            fill(128, 0, 255);
            player = 2;
            text("Player " + player, 710, 200);      
         }//END IF
         
         //Else the player1 counter is still moving
         else {           
            //RED LADDER, so the code checks to see if the counter should be going up the ladder
            if (dieNum == player1NumMoves && goupRedLadderP1 == true && dirX1 == 1 && dirY1 == 0 && player1X == 270 && player1Y > 500) {
               dirX1 = -1;
               dirY1 = -1;
               player1X = 270;
               player1Y = 350;
               upRedLadderP1 = true;       
            }
            
            //BLUE LADDER, so the code checks if the counter should go up the ladder
            else if (dieNum == player1NumMoves && goupBlueLadderP1 == true && dirX1 == 1 && dirY1 == 0 && player1X == 570 && player1Y > 500) {
               dirX1 = 0;
               dirY1 = -1;
               player1X = 570;
               player1Y = 450;
               upBlueLadderP1 = true;       
            }
            
            // PURPLE SNAKE, so the code checks to see if the counter should go down the snake
            else if (dieNum == player1NumMoves && godownPurpleSnakeP1 == true && dirX1 == -1 && dirY1 == 0 && player1X == 270 && player1Y > 200 && player1Y < 300) {
               dirX1 = -1;
               dirY1 = 1;
               player1X = 170;
               player1Y = 250;
               downPurpleSnakeP1 = true;       
            }
            
            // ORANGE SNAKE, so the code checks to see if the counter should go down the snake
            else if (dieNum == player1NumMoves && godownOrangeSnakeP1 == true && dirX1 == 1 && dirY1 == 0 && player1X == 570 && player1Y > 100 && player1Y < 200) {
               dirX1 = -1;
               dirY1 = 1;
               player1X = 570;
               player1Y = 350;
               downOrangeSnakeP1 = true;       
            }
            
            // PINK SNAKE, so the code checks to see if the counter should go down the snake
            if (dieNum == player1NumMoves && godownPinkSnakeP1 == true && dirX1 == -1 && dirY1 == 0 && player1X == 170 && player1Y > 0 && player1Y < 100) {
               dirX1 = 1;
               dirY1 = 1;
               player1X = 370;
               player1Y = 50;
               downPinkSnakeP1 = true;       
            }
            
            //At the finish, so stops the game from running anymore as player1 has won
            else if (dirX1 == -1 && dirY1 == 0 && player1X < 100 && player1Y < 100){
               dirX1 = 0;
               dirY1 = 0;
               running = false; 
            }
            
            //At right boundary so move up
            else if (dirX1 == 1 && dirY1 == 0 && player1X > 600) {
               dirX1 = 0;
               dirY1 = -1;
               upRedLadderP1 = false;
               upBlueLadderP1 = false; 
               downPurpleSnakeP1 = false; 
               downOrangeSnakeP1 = false;
               downPinkSnakeP1 = false;  
            }
            
            //Gone up on right so move left
            else if (dirX1 == 0 && dirY1 == -1 && player1X > 600) {
               dirX1 = -1;
               dirY1 = 0;
               upRedLadderP1 = false;
               upBlueLadderP1 = false; 
               downPurpleSnakeP1 = false;
               downOrangeSnakeP1 = false;
               downPinkSnakeP1 = false;
            }
            
            //Go left
            else if (dirX1 == -1 && dirY1 == 0 && player1X > 100) {
               dirX1 = -1;
               dirY1 = 0;
               upRedLadderP1 = false;
               upBlueLadderP1 = false; 
               downPurpleSnakeP1 = false;
               downOrangeSnakeP1 = false;
               downPinkSnakeP1 = false;
            }
            
            //At left boundary so move up
            else if (dirX1 == -1 && dirY1 == 0 && player1X < 100) {
               dirX1 = 0;
               dirY1 = -1;
               upRedLadderP1 = false;
               upBlueLadderP1 = false; 
               downPurpleSnakeP1 = false;
               downOrangeSnakeP1 = false;
               downPinkSnakeP1 = false;
            }
            
            //Gone up on left so move right
            else if (dirX1 == 0 && dirY1 == -1 && player1X < 100) {
               dirX1 = 1;
               dirY1 = 0;
               upRedLadderP1 = false;
               upBlueLadderP1 = false; 
               downPurpleSnakeP1 = false;
               downOrangeSnakeP1 = false;
               downPinkSnakeP1 = false;
            }
            
            //These two lines give the final coordinate points for the player1 counter before it is drawn
            player1X += 100 * dirX1;
            player1Y += 100 * dirY1;
            
            //This line increases the number of player moves
            player1NumMoves++;  
      
         }//ELSE END
      }//IF END
      
      //This checks for specific conditions to see if the player2 counter needs to be moved. 
      else if(player2Moving && millis() - player2TimeOfLastMove >= 500 && player == 2) {
         player2TimeOfLastMove = millis(); 
      
         //These three lines of code display which players turn it is so it is player2 here
         textSize(30);
         fill(128, 0, 255);
         text("Player " + player, 710, 200);
      
         //If the number of moves is greater than the dice number the player2 counter stops moving
         if (player2NumMoves > dieNum) {
            player2Moving = false;
            
            //These four lines of code switch over which players turn it is so it is now player2
            textSize(30);
            fill(255, 51, 51);
            player = 1;
            text("Player " + player, 710, 200);
         }//END IF
         
         //Else the player2 counter is moving
         else {
            //RED LADDER, so the code checks to see if the counter should go up the ladder
            if (dieNum == player2NumMoves && goupRedLadderP2 == true && dirX2 == 1 && dirY2 == 0 && player2X == 250 && player2Y > 500) {
               dirX2 = -1;
               dirY2 = -1;
               player2X = 250;
               player2Y = 350;
               upRedLadderP2 = true;       
            }
            
            //BLUE LADDER, so the code checks to see if the counter should go up the ladder
            else if (dieNum == player2NumMoves && goupBlueLadderP2 == true && dirX2 == 1 && dirY2 == 0 && player2X == 550 && player2Y > 500) {
               dirX2 = 0;
               dirY2 = -1;
               player2X = 550;
               player2Y = 450;
               upBlueLadderP2 = true;       
            }
            
            // PURPLE SNAKE, so the code checks to see if the counter should go down the snake
            else if (dieNum == player2NumMoves && godownPurpleSnakeP2 == true && dirX2 == -1 && dirY2 == 0 && player2X == 250 && player2Y > 200 && player2Y < 300) {
               dirX2 = -1;
               dirY2 = 1;
               player2X = 150;
               player2Y = 250;
               downPurpleSnakeP2 = true;       
            }
            
            // ORANGE SNAKE, so the code checks to see if the counter should go down the snake
            else if (dieNum == player2NumMoves && godownOrangeSnakeP2 == true && dirX2 == 1 && dirY2 == 0 && player2X == 550 && player2Y > 100 && player2Y < 200) {
               dirX2 = -1;
               dirY2 = 1;
               player2X = 550;
               player2Y = 350;
               downOrangeSnakeP2 = true;       
            }
            
            // PINK SNAKE, so the code checks to see if the counter should go down the snake
            if (dieNum == player2NumMoves && godownPinkSnakeP2 == true && dirX2 == -1 && dirY2 == 0 && player2X == 150 && player2Y > 0 && player2Y < 100) {
               dirX2 = 1;
               dirY2 = 1;
               player2X = 350;
               player2Y = 50;
               downPinkSnakeP2 = true;       
            }
            
            //At the finish, so stops the game from running anymore as player2 has won
            else if (dirX2 == -1 && dirY2 == 0 && player2X < 100 && player2Y < 100){
               dirX2 = 0;
               dirY2 = 0;
               running = false;
            }
            
            //At right boundary, so move up
            else if (dirX2 == 1 && dirY2 == 0 && player2X > 600) {
               dirX2 = 0;
               dirY2 = -1;
               upRedLadderP2 = false;
               upBlueLadderP2 = false; 
               downPurpleSnakeP2 = false; 
               downOrangeSnakeP2 = false;
               downPinkSnakeP2 = false;  
            }
            
            //Move left once gone up
            else if (dirX2 == 0 && dirY2 == -1 && player2X > 600) {
               dirX2 = -1;
               dirY2 = 0;
               upRedLadderP2 = false;
               upBlueLadderP2 = false; 
               downPurpleSnakeP2 = false;
               downOrangeSnakeP2 = false;
               downPinkSnakeP2 = false;
            }
            
            //Moving left
            else if (dirX2 == -1 && dirY2 == 0 && player2X > 100) {
               dirX2 = -1;
               dirY2 = 0;
               upRedLadderP2 = false;
               upBlueLadderP2 = false; 
               downPurpleSnakeP2 = false;
               downOrangeSnakeP2 = false;
               downPinkSnakeP2 = false;
            }
            
            //At left boundary so move up
            else if (dirX2 == -1 && dirY2 == 0 && player2X < 100) {
               dirX2 = 0;
               dirY2 = -1;
               upRedLadderP2 = false;
               upBlueLadderP2 = false; 
               downPurpleSnakeP2 = false;
               downOrangeSnakeP2 = false;
               downPinkSnakeP2 = false;
            }
            
            //Gone up so move right
            else if (dirX2 == 0 && dirY2 == -1 && player2X < 100) {
               dirX2 = 1;
               dirY2 = 0;
               upRedLadderP1 = false;
               upBlueLadderP1 = false; 
               downPurpleSnakeP1 = false;
               downOrangeSnakeP1 = false;
               downPinkSnakeP1 = false;
            }
           
           //These two lines give the final coordinate points for the player2 counter before it is drawn
           player2X += 100 * dirX2;
           player2Y += 100 * dirY2;
        
           //This line increases the number of player moves
           player2NumMoves++;  
            
        }//ELSE end     
     }//IF end
  
   }//running IF end
   
   //This ELSE IF is used to show which player had won
   else if (running == false){
      if (player == 1){
         fill(255, 51, 51);
      }
      else{
         fill(128, 0, 255);
      }
      textSize(30);
      text("Player " + player + " won", 710, 200);
   }//not running ELSE IF end
  
   //These four lines of code display the counters on the window
   fill(255, 51, 51);
   ellipse(player1X, player1Y, 40, 40); //(x,y,w,h)
  
   fill(128, 0, 255);
   ellipse(player2X, player2Y, 40, 40); //(x,y,w,h)
  
}

//This method is called by the mouseClicked method to check if the mouse has been clicked inside the die
boolean collide(float pointX,float pointY,int dieX,int dieY,int dieW,int dieH){
  //So the IF statemet below checks to see if the click is inside the die box created and if it is it returns true otherwise it returns false
   if (pointX >= dieX && pointX <= dieX + dieW && pointY >= dieY && pointY <= dieY + dieH){
      return true;
   }
   return false;
}

//This method is called when the mouse is clicked
void mouseClicked(){
   //This line check to see if click is inside the dice, so it calls the collide method 
   boolean collision = collide(pointX, pointY, dieX, dieY, dieW, dieH);
  
  //This IF statement makes sure that the next block of code only gets exectuted whilst the game is running
   if (running){
      // The next IF ststement only gets executed if the mouse has clicked the die 
      if (collision){
        //These two lines below generate a random number for the die between 1-4
         Random rand = new Random();
         dieNum = rand.nextInt(4) + 1;
        
        //This next IF statement below checks who's turn it is
         if (moves % 2 == 0){
            player = 1;
        
            //This IF statement pre-determines if the player1 counter will go up the redLadder and sets its flag to true
            if (((player1X + (dieNum*100)) == 270 ) && ( player1Y > 500)){
               player1NumMoves = 0;
               goupRedLadderP1 = true;      
            }
            //This IF statement pre-determines if the player1 counter will go up the blueLadder and sets its flag to true
            else if (((player1X + (dieNum*100)) == 570 ) && ( player1Y > 500)){
               player1NumMoves = 0;
               goupBlueLadderP1 = true;      
            }
            //This IF statement pre-determines if the player1 counter will go down the purpleNake and sets its flag to true
            else if (((player1X - (dieNum*100)) == 270 ) && ( player1Y > 200 && player1Y < 300)){
               player1NumMoves = 0;
               godownPurpleSnakeP1 = true;
            } 
            //This IF statement pre-determines if the player1 counter will go down the orangeSnake and sets its flag to true
            else if (((player1X + (dieNum*100)) == 570 ) && ( player1Y > 100 && player1Y < 200)){
               player1NumMoves = 0;
               godownOrangeSnakeP1 = true;
            }
            //This IF statement pre-determines if the player1 counter will go down the pinkSnake and sets its flag to true
            else if (((player1X - (dieNum*100)) == 170 ) && ( player1Y > 0 && player1Y < 100)){
               player1NumMoves = 0;
               godownPinkSnakeP1 = true;
            }
            //This ELSE statement sets all the ladder and snake flags to false
            else{
               player1NumMoves = 1;
               goupRedLadderP1 = false;
               goupBlueLadderP1 = false; 
               godownPurpleSnakeP1 = false;
               godownOrangeSnakeP1 = false;
               godownPinkSnakeP1 = false;
            }
            
            //This line gets the time interval of when the die was clicked
            player1TimeOfLastMove = millis();
            //This line sets the flag to true so it shows that the counter is going to move
            player1Moving = true;
            
            
            //This next block of code assigns new directions once the counter has gone up the ladder or down the snake
            //This is done so the counter will start moving in the right direction once the ladder/snake movement is made
            if (upRedLadderP1){
               dirY1 = 0;
            }
            else if (upBlueLadderP1){
               dirX1 = 1;
               dirY1 = 0;
            }
            else if (downPurpleSnakeP1){
               dirX1 = 1;
               dirY1 = 0;
            }
            else if (downOrangeSnakeP1){
               dirX1 = -1;
               dirY1 = 0;
            }
            else if (downPinkSnakeP1){
               dirX1 = 1;
               dirY1 = 0;
            }
        
         }//END of player1 IF
      
         else{
            player = 2;
        
            //This IF statement pre-determines if the player2 counter will go up the redLadder and sets its flag to true
            if (((player2X + (dieNum*100)) == 250 ) && ( player2Y > 500)){
               player2NumMoves = 0;
               goupRedLadderP2 = true;      
            }
            //This IF statement pre-determines if the player2 counter will go up the blueLadder and sets its flag to true
            else if (((player2X + (dieNum*100)) == 550 ) && ( player2Y > 500)){
               player2NumMoves = 0;
               goupBlueLadderP2 = true;      
            }
            //This IF statement pre-determines if the player2 counter will go down the purpleSnake and sets its flag to true
            else if (((player2X - (dieNum*100)) == 250 ) && ( player2Y > 200 && player2Y < 300)){
               player2NumMoves = 0;
               godownPurpleSnakeP2 = true;
            } 
            //This IF statement pre-determines if the player2 counter will go down the orangeSnake and sets its flag to true
            else if (((player2X + (dieNum*100)) == 550 ) && ( player2Y > 100 && player2Y < 200)){
               player2NumMoves = 0;
               godownOrangeSnakeP2 = true;
            }
            //This IF statement pre-determines if the player2 counter will go down the pinkSnake and sets its flag to true
            else if (((player2X - (dieNum*100)) == 150 ) && ( player2Y > 0 && player2Y < 100)){
               player2NumMoves = 0;
               godownPinkSnakeP2 = true;
            }
            
            //This ELSE statement sets all the ladder and snake flags to false
            else{
               player2NumMoves = 1;
               goupRedLadderP2 = false;
               goupBlueLadderP2 = false; 
               godownPurpleSnakeP2 = false;
               godownOrangeSnakeP2 = false;
               godownPinkSnakeP2 = false;
            } 
           
            //This line gets the time interval of when the die was clicked
            player2TimeOfLastMove = millis();
            //This line sets the flag to true so it shows that the counter is going to move
            player2Moving = true;
        
            //This next block of code assigns new directions once the counter has gone up the ladder or down the snake
            //This is done so the coungter will start moving in the right direction once the ladder/snake movement is made
            if (upRedLadderP2){
               dirY2 = 0;
            }
            else if (upBlueLadderP2){
               dirX2 = 1;
               dirY2 = 0;
            }
            else if (downPurpleSnakeP2){
               dirX2 = 1;
               dirY2 = 0;
            }
            else if (downOrangeSnakeP2){
               dirX2 = -1;
               dirY2 = 0;
            }
            else if (downPinkSnakeP2){
               dirX2 = 1;
               dirY2 = 0;
            }
        
         }//END of player2 IF
      
      //This line below increases the total number of moves
      moves ++;
   
      }//END of collision IF
   }//END of running IF
}

//This method draws all the elements on the window created including the grid, snakes, ladders, counters, die and the player information
void drawBoard() {
   background(153, 204, 255);

   //These two lines below draw the vertical line separating the grid from the die and player information
   fill(0, 0, 0);
   rect(700, 0, 5, 700);
  
   //These variables below are used to draw out the grid
   int xpos = 0;
   int ypos = 0;
 
   //This FOR loop below draws out the grid working out where each coloured box needs to be placed
   //Each of the boxes are being placed going across the 6 rows created
   for (int r = 0; r < 6; r++){
      if (r == 0 || r == 2 || r == 4){
         xpos = 0;
         ypos = r * 100;
         for (int n = 0; n < 4; n++){
            fill(255, 204, 0);
            rect(xpos, ypos, 100, 100);
            xpos = xpos + 200;
         } 
      }
      else if (r == 1 || r == 3 || r == 5){
         xpos = 100;
         ypos = r * 100;
         for (int n = 0; n < 3; n++){
            fill(255, 204, 0);
            rect(xpos, ypos, 100, 100);
            xpos = xpos + 200;
         } 
      }       
   } 
  
   //This next block of code is for the die and how each number will be shown
   if (dieNum == 1){
      //create the dice 
      //#1
      fill(255, 255, 255);
      rect(dieX ,dieY ,dieW ,dieH );
    
      //add dots
      fill(0, 0, 0);
      ellipse(800, 100, 10, 10); //(x,y,w,h)      
   }  
   else if(dieNum == 2){
      //#2
      fill(255, 255, 255);
      rect(dieX ,dieY ,dieW ,dieH );
    
      fill(0, 0, 0);
      ellipse(775, 125, 10, 10); 
      fill(0, 0, 0);
      ellipse(825, 75, 10, 10);         
   }
   else if(dieNum == 3){
      //#3
      fill(255, 255, 255);
      rect(dieX ,dieY ,dieW ,dieH );
    
      fill(0, 0, 0);
      ellipse(775, 125, 10, 10); 
      fill(0, 0, 0);
      ellipse(825, 75, 10, 10);
      fill(0, 0, 0);
      ellipse(800, 100, 10, 10); 
   }
   else if(dieNum == 4){
      //#4
      fill(255, 255, 255);
      rect(dieX ,dieY ,dieW ,dieH );
    
      fill(0, 0, 0);
      ellipse(775, 125, 10, 10);
      fill(0, 0, 0);
      ellipse(825, 75, 10, 10); 
      fill(0, 0, 0);
      ellipse(775, 75, 10, 10); 
      fill(0, 0, 0);
      ellipse(825, 125, 10, 10); 
   }
      
   //These three lines of code get the snake pictures from the file
   purpleSnake = loadImage("snake.12.png");
   orangeSnake = loadImage("snake.13.png");
   pinkSnake = loadImage("snake.14.png");
  
   //These two lines of code get the ladder pictures from the file
   blueLadder = loadImage("ladder.6.png");
   redLadder = loadImage("ladder.3.png");
  
   //These 5 lines of code display the pictures from the file at positions on the grid created for the game
   image(purpleSnake,20,220,270,180);//(xpos,ypos,w,h)
   image(orangeSnake,400,150,180,360);
   image(pinkSnake,120,20,340,180);
   image(blueLadder,510,340,80,230);
   image(redLadder,100,210,200,400); 
  
   //This IF and ELSE statement displays the player information aswell, this is importanat for the initial loading of the window
   if (player == 1){
      fill(255,51,51);
   }
   else{
      fill(128, 0, 255);
   }
   textSize(30);
   text("Player " + player, 710, 200);
  
   //These four lines of code draw the counters to represent the initial player positions
   fill(255, 51, 51);
   ellipse(player1X, player1Y, 40, 40); //(x,y,w,h)

   fill(128, 0, 255);
   ellipse(player2X, player2Y, 40, 40); //(x,y,w,h)
}