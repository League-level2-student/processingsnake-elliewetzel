
// 1. Follow the recipe instructions inside the Segment class.
// The Segment class will be used to represent each part of the moving snake.
class Segment {
  //2. Create x and y member variables to hold the location of each segment.
int x;
int y;
  // 3. Add a constructor with parameters to initialize each variable.
Segment(int x, int y){
  this.x = x;
  this.y = y;
}
  // 4. Add getter and setter methods for both the x and y member variables.
public int getX(){
   return x;
}
public void setX(int x) {
 this.x = x; 
}
public int getY(){
  return y;
}
public void setY(int y) {
 this.y = y; 
}
}

// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake
Segment f;
// 6. Create and initialize a String to hold the direction of your snake e.g. "up"
String g = "up";
//check
// 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
// give it a value of 1 to start.
int s = 1;
// 8. Create and initialize foodX and foodY variables to hold the location of the food.
// (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)
int foodX = ((int)random(10)*width/10);
int foodY = ((int)random(10)*height/10);
void setup() {
  // 9. Set the size of your sketch (500 by 500).
  size(500, 500);
  // 10. initialize your head to a new segment.
  f = new Segment(250, 250);
  // 11. Use the frameRate(int rate) method to set the rate to 20.
  frameRate(10);
}
void draw() {
  background(0);
  //12. Call the manageTail, drawFood, drawSnake, move, and collision methods.
  manageTail();
  drawFood();
  drawSnake();
  move();
  collision();
}
// 13. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).
void drawFood() {
  rect(foodX, foodY,10,10);
}
//14. Draw the snake head (use a 10 by 10 rectangle)
void drawSnake() {
  fill(255);
rect(f.x, f.y,10, 10);
  //test your code
}
// 15. Complete the move method below.
void move() {
  
  // 16. Using a switch statement, make your snake head move by 10 pixels in the correct direction.
  //This is an incomplete switch statement:
  switch(g) {
  case "up":
  f.y-=10;
    // move head up here 
    break;
  case "down":
  f.y+=10;
    // move head down here 
    break;
  case "left":
  f.x-=10;
   // figure it out 
    break;
  case "right":
  f.x+=10;
    // mystery code goes here 
    break;
  }
  // 17. Call the checkBoundaries method to make sure the snake head doesn't go off the screen..
  checkBoundaries();
}


// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.
void keyPressed() {
if(keyCode==UP){
  if(!g.equals("down")){
    g = "up"; 
  }
}
else if(keyCode==DOWN){
  if(!g.equals("up")){
    g = "down"; 
  }
}
else if(keyCode==RIGHT){
  if(!g.equals("left")){
  g = "right";
  }
}
else{
  if(!g.equals("right")){
    g = "left"; 
  }
}
}
// 19. check if your head is out of bounds (teleport your snake head to the other side).
void checkBoundaries() {
  if(f.x<0) {
    f.x = width;
  }
  else if(f.x > 500){
   f.x = 0; 
  }
  else if(f.y < 0) {
    f.y = 500;
  }
  else if (f.y > 500){
   f.y = 0;
  }
//20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)
}

// 21. Complete the missing parts of the collision method below.

void collision() {
  if(foodY == f.y && foodX == f.x){
 s++;
 foodX = ((int)random(10)*width/10);
 foodY = ((int)random(10)*height/10);
 print(s + " ");
}
  // If the segment is colliding with a piece of food...
     // Increase the amount of food eaten and set foodX and foodY to new random locations.
}
/**
 
 ** Part 2: making the tail (the rest of the snake)
 
 **/

//  1. Create and initialize an ArrayList of Segments. (This will be your snake tail!)
ArrayList<Segment> tail = new ArrayList<Segment>();

// 2. Complete the missing parts of the manageTail method below and call it in the draw method.

void manageTail() {
  //Call the drawTail and checkTailCollision methods.
drawTail();
checkTailCollision();
  // Add a new Segment to your ArrayList that has the same X and Y as the head of your snake.
  Segment same = new Segment(f.x, f.y);
tail.add(same);
  // To keep your tail the right length:
  // while the tail size is greater than the number of food pieces eaten, remove the first Segment in your tail.
  if(tail.size() > s) {
    tail.remove(0);
}
}

void drawTail() {
    // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
    for(int i = 0; i <tail.size(); i++){
    rect(tail.get(i).getX(), tail.get(i).getY(),10,10);
}
}
// 3. Complete the missing parts of the bodyCollision method below.

void checkTailCollision() {

  // If your head has the same location as one of your segments...
  for(int i = 0; i < tail.size(); i++) {
if(f.getX() == tail.get(i).getX()) {
  s=1;
}
  }
  // reset your food variable

  //Call this method at the beginning of your manageTail method.
}
