import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

//puppycat in case of overtype fn + prt scrn
/* background = #E8D0D0
   skin = #fefcfb
   ears = #bc8981 (darker) #ffaec7 (inside)
   eyes = #571716
   stroke = #683a3b */

void setup() {
  size(400,400);
  background(232, 208, 208); //change value as candy gets closer
  arduino = new Arduino(this, Arduino.list()[1], 57600); //change the [0] to a [1] or [2] etc. if your program doesn't work
}
void draw() {
  int y = arduino.analogRead(5);
  System.out.println(y);
  
  stroke(#683a3b);
  strokeWeight(2);
  fill(#fefcfb);
  ellipse(200,450,400,350); //body
  
  fill(#ffaec7);
  ellipse(130,280,80,80);
  ellipse(270,280,80,80); //collar
  fill(#fed37d);
  ellipse(200,300,100,100); //bell
  fill(#683a3b);
  arc(200,340,20,20,0,PI);
  arc(200,320,20,20,-PI,0);
  rect(190,320,20,20);
  
  push();
  fill(#bc8981); //left ear
  translate(100,100);
  rotate(PI/-7.0);
  ellipse(0,0,75,110); 
  fill(#ffaec7);
  ellipse(0,10,45,90);
  pop();
  push();
  fill(#bc8981); //right ear
  translate(300,100);
  rotate(PI/7.0);
  ellipse(0,0,75,110); 
  fill(#ffaec7);
  ellipse(0,10,45,90);
  pop();
  
  fill(#fefcfb);
  arc(200,200,250,210,0,PI);
  arc(200,200,250,230,-PI,0); //head
  noStroke();
  fill(#571716); //eyes
  ellipse(150,190,25,25);
  ellipse(250,190,25,25);
  
  push();
  fill(#bc8981); //eyebrows
  translate(150,150);
  rotate(PI/3.0);
  ellipse(0,0,50,30);
  pop();
  push();
  fill(#bc8981);
  translate(250,150);
  rotate(PI/1.5);
  ellipse(0,0,50,30);
  pop();
  
  fill(#571716); //nose
  triangle(200,215,190,195,210,195);
  stroke(#571716);//mouth
  strokeWeight(3);
  line(200,215,185,230);
  line(200,215,215,230);
  // arduino code
  noStroke();
  fill(#571716);
  if(y <= 70){ //mouth
    ellipse(200,235,50,50);
  }
  else {
    ellipse(200,235,0,0);
  }
  fill(#eba4af);
  ellipse(200,y+260,60,60);
  fill(#f2d5da);
  ellipse(190,y+250,30,30);
  fill(#eba4af);
  triangle(225,y+260,265,y+230,265,y+290);
  triangle(175,y+260,135,y+230,135,y+290); 
}
