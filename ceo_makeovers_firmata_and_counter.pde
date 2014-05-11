


// Ceo_MakeOVERS! by Joselyn McDonald
// May 2014
// to do list for game

// 3. nice graphics
// 5. gif of ceo's saying their slogans 

//Demonstrates the reading of digital and analog pins of an Arduino board
//running the StandardFirmata firmware.
//
//To use:
//* Using the Arduino software, upload the StandardFirmata example (located
//  in Examples > Firmata > StandardFirmata) to your Arduino board.
//* Run this sketch and look at the list of serial ports printed in the
//  message area below. Note the index of the port corresponding to your
//  Arduino board (the numbering starts at 0).  (Unless your Arduino board
//  happens to be at index 0 in the list, the sketch probably won't work.
//  Stop it and proceed with the instructions.)
//* Modify the "arduino = new Arduino(...)" line below, changing the number
//  in Arduino.list()[0] to the number corresponding to the serial port of
//  your Arduino board.  Alternatively, you can replace Arduino.list()[0]
//  with the name of the serial port, in double quotes, e.g. "COM5" on Windows
//  or "/dev/tty.usbmodem621" on Mac.
//* Run this sketch. The squares show the values of the digital inputs (HIGH
//  pins are filled, LOW pins are not). The circles show the values of the
//  analog inputs (the bigger the circle, the higher the reading on the
//  corresponding analog input pin). The pins are laid out as if the Arduino
//  were held with the logo upright (i.e. pin 13 is at the upper left). Note
//  that the readings from unconnected pins will fluctuate randomly. 
//  
//For more information, see: http://playground.arduino.cc/Interfacing/Processing
//*/

// ▄████▄ ▓█████  ▒█████        ███▄ ▄███▓ ▄▄▄       ██ ▄█▀▓█████  ▒█████   ██▒   █▓▓█████  ██▀███    ██████ 
//▒██▀ ▀█ ▓█   ▀ ▒██▒  ██▒     ▓██▒▀█▀ ██▒▒████▄     ██▄█▒ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓█   ▀ ▓██ ▒ ██▒▒██    ▒ 
//▒▓█    ▄▒███   ▒██░  ██▒     ▓██    ▓██░▒██  ▀█▄  ▓███▄░ ▒███   ▒██░  ██▒ ▓██  █▒░▒███   ▓██ ░▄█ ▒░ ▓██▄   
//▒▓▓▄ ▄██▒▓█  ▄ ▒██   ██░     ▒██    ▒██ ░██▄▄▄▄██ ▓██ █▄ ▒▓█  ▄ ▒██   ██░  ▒██ █░░▒▓█  ▄ ▒██▀▀█▄    ▒   ██▒
//▒ ▓███▀ ░▒████▒░ ████▓▒░     ▒██▒   ░██▒ ▓█   ▓██▒▒██▒ █▄░▒████▒░ ████▓▒░   ▒▀█░  ░▒████▒░██▓ ▒██▒▒██████▒▒
//░ ░▒ ▒  ░░ ▒░ ░░ ▒░▒░▒░      ░ ▒░   ░  ░ ▒▒   ▓▒█░▒ ▒▒ ▓▒░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░░ ▒░ ░░ ▒▓ ░▒▓░▒ ▒▓▒ ▒ ░
//  ░  ▒   ░ ░  ░  ░ ▒ ▒░      ░  ░      ░  ▒   ▒▒ ░░ ░▒ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ░ ░  ░  ░▒ ░ ▒░░ ░▒  ░ ░
//░          ░   ░ ░ ░ ▒       ░      ░     ░   ▒   ░ ░░ ░    ░   ░ ░ ░ ▒       ░░     ░     ░░   ░ ░  ░  ░  //
//░ ░        ░  ░    ░ ░              ░         ░  ░░  ░      ░  ░    ░ ░        ░     ░  ░   ░           ░  
//░        ░

import processing.pdf.*;
import processing.serial.*;
import cc.arduino.*;
import org.firmata.*;

PGraphics topLayer;

// give variables names to fill in arduinoReads// just for ease of understanding 
int eyes_ard = 2; 
int lips_ard = 0; 
int face_ard = 1; 
int blush_ard = 5; 


// name your arduino object 
Arduino arduino;
 
 //this is the bebas neue font 
PFont tall;  
 
// odd name for the home page lipstick images 
PImage back; 
 
PImage ceo_lo; 
PImage ceo_estee;
PImage ceo_lo_eyes; 
PImage ceo_estee_eyes;
PImage ceo_lo_blush; 
PImage ceo_estee_blush;
PImage ceo_lo_face; 
PImage ceo_estee_face;
PImage ceo_lo_lips; 
PImage ceo_estee_lips;

PImage lipstick; 
PImage blush;
PImage face;
PImage eyes; 

int state = 0; 

int counter1 = 0; 
int counter2 = 0; 
int counter3 = 0; 
int counter4 = 0; 



boolean pressed_may = false; 
boolean pressed_lo = false; 
boolean pressed_estee; 
boolean record = false;
boolean draw = false; 

boolean lo_eyes = false; 
boolean lo_blush = false; 
boolean lo_face = false; 
boolean lo_lips = false; 

boolean estee_eyes = false;
boolean estee_blush = false;
boolean estee_face = false;
boolean estee_lips = false;

int button_loX; 
int button_loY = 550; 

int button_esteeX;
int button_esteeY = 550; 

int button_homeX = 10; 
int button_homeY = 10; 
int button_home_wide = 60; 
int button_home_long = 30; 

int button_size = 300; 
int pageBar = 50;

int pic_wide = 750; 
int pic_long = 850;

int edge = 930; 

int left_bar = 175; 

int A0PotPin = 0;
float valuePot; 

void setup(){
  
//_____this is arduino stuff________
  // Prints out the available serial ports.
  println(Arduino.list());
  
  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[11], 57600);
  arduino.pinMode(A0PotPin, Arduino.INPUT);
  
  arduino.pinMode(2, Arduino.INPUT);

//________________________________________
  
 size(1200, 850); 
 
 //______load Images_______________________________
 
 back = loadImage("lipstick.png"); 
 //_________CEO's__________________________________
 ceo_lo = loadImage("jon_normal.jpg");
 ceo_estee = loadImage("FabrizioFreda_ceo_estee_lauder.jpg");
 
 //_________FACE_MANIPULATION________________________
 ceo_lo_eyes = loadImage("jon_eyes.png"); 
 ceo_estee_eyes = loadImage("FabrizioFreda_eys.png");
 ceo_lo_blush = loadImage("jon_blush.png"); 
 ceo_estee_blush = loadImage("FabrizioFreda_blush.png");
 ceo_lo_face = loadImage("jon_concealer.png"); 
 ceo_estee_face = loadImage("FabrizioFreda_concealer.png");
 ceo_lo_lips = loadImage("jon_lips.png");
 ceo_estee_lips = loadImage("FabrizioFreda_lips.png"); 
 
 //___________MAKEUP-ACCESSORIES-------------------
 lipstick = loadImage("lipstick.png");
 blush = loadImage("blush.png");
 face = loadImage("face.png");
 eyes = loadImage("mascara.png"); 
 
 button_loX = 300; 
 button_esteeX = 600;
 
 //____________Font__________
 tall = loadFont("BebasNeue-100.vlw");
}

void draw(){
  
  //------------Home Screen________________
  //_________________________
  //_______________
  
  if(state==0){
    
    counter1 = 0;
   counter2 = 0;  
   background(0); 
   
    image(back, 20, 400, 100, 275); 
    image(back, 1090, 400, 100, 275); 
    image(back, 20, 100, 100, 275); 
    image(back, 1090, 100, 100, 275); 
    
    fill(255); 
    
    textFont(tall,140);
    text("Empower the CEOs", width/2-420, height/4);
    //textFont(tall,30);
    //text("Makeup Makes You Powerful", width/2-220, height/3);
    textFont(tall, 70);
   
   //Buttons to change states
    fill(255); 
    text("L'Oreal", button_loX, button_loY-90); 
    
    fill(255); 
    text("Estee", button_esteeX, button_esteeY-90);
    text("Lauder", button_esteeX, button_esteeY-90); 
 
    
    //Sponsored by masculine button 
    fill(255); 
    textFont(tall, 20); 
    text("Sponsored by MASCULINE", 900, 730); 

    noStroke(); 
   
    fill(255, 255, 255, 230);     
  }  
  
  //______________LOREAL________________________________________ STATE 1 KEY INTERACTION ONLY 
  //____________________
  //___________
  //_____
  //____
  
  if(state == 1){
    
    draw = false; 

   counter1++; 
   println(counter1); 
 
 //draw ceo to screen 
  //if(state == 1 && counter1 == 1){
   background(0); 
   image(ceo_lo, left_bar, 0, pic_wide, pic_long);
  // }
 
  
  //_______make_up_ left_side ___________________________
  image(lipstick, 50, 70, 50, 150);
  image(blush, 10, 240, 150, 150); 
  image(face, -20, 400, 200, 200); 
  image(eyes, -10, 570, 200, 200);

//________right side____________________
fill (255); 
  textFont(tall, 50); 
  text("L'oreal CE0", edge , 40); 
 textFont(tall, 40); 
  text("Jean Paul Agon", edge , 75); 
   textFont(tall, 30); 
  text("L'oreal Subsidiaries", edge, 120);
  textFont(tall, 20); 
  text("Kéraskin Esthetics", edge, 150);
  text("L'oreal Subsidiaries", edge, 170);
   text("Ombrelle", edge, 190);
    text("Garnier", edge, 210);
     text("Maybelline", edge, 230);
      text("Créateurs de Beauté", edge, 250);
       text("SoftSheen-Carson", edge, 270);
        text("Essie", edge, 290);
         text("Vichy", edge, 310);
          text("La Roche Posay", edge, 330);
           text("Inneov", edge, 350);
            text("Skinceuticals", edge, 370);
             text("Roger&Gallet", edge, 390);
              text("Sanoflore", edge, 410);
               text("Dermablend", edge, 430);
                  text("Kérastase", edge, 450);
                    text("Redken", edge, 470);
                      text("Shu Uemura ", edge, 490);
                          text("Yves Saint Laurent", edge, 510);
                              text("Giorgio Armani", edge, 530);
                                  text("Biotherm", edge, 550);
                                  text("Viktor & Rolf", edge, 570);
                                    text("Kiehl's ", edge, 590);
                                       text("The Body Shop", edge, 610);
                                            text("Urban Decay", edge, 630);
                                                  text("Yue Sai", edge, 650);
                                                  
  
  fill(255); 


  //_____interactions___________________________________________

   if(keyPressed == true){
     if (key == 'e'){
      
       lo_eyes = true; 
     }
     if (key == 'l'){
       lo_lips = true; 
     }
      if (key == 'b'){
       lo_blush = true; 
     }
     if (key == 'f'){
       lo_face = true; 
     }
     
     // this is the CLEAR button! 
     if (key == 'c'){
       
       lo_eyes = false;
       lo_lips = false; 
       lo_blush = false; 
       lo_face = false; 
       
       background (0); 
        
         image(lipstick, 50, 70, 50, 150);
         image(blush, 10, 240, 150, 150); 
         image(face, -20, 400, 200, 200); 
         image(eyes, -10, 570, 200, 200);
       
      // redraw the ceo's face 
      
        image(ceo_lo, left_bar, 0, pic_wide, pic_long);    
        
     }
   }
  
      if (lo_eyes == true){
        
        //draws the white block and mascara 
        fill(255, 255, 255, 200 ); 
        rect(10, 590, 145, 150); 
        image(eyes, -10, 570, 200, 200);

       // draw makeup on face
        noFill(); 
        image(ceo_lo_eyes, left_bar, 0, pic_wide, pic_long);

       
      }
          
     if (lo_lips == true){
       
       //draws the white block and lipstick again
       fill(255, 255, 255, 200 ); 
       rect(10, 70, 145, 150);
       image(lipstick, 50, 70, 50, 150);
       
       // draw makeup on face 
       noFill(); 
       image(ceo_lo_lips, left_bar, 0, pic_wide, pic_long);
     }
    
     if (lo_blush == true){
        
      // draw the white block and blush 
       fill(255, 255, 255, 200 ); 
       rect(10, 245, 145, 150);
       image(blush, 10, 240, 150, 150); 

       noFill(); 
       
      // draw blush on face  
      image(ceo_lo_blush, left_bar, 0, pic_wide, pic_long);
        

        
     }
     
     if (lo_face == true){
        fill(255, 255, 255, 200 ); 
        rect(10, 425, 145, 145);
         image(face, -20, 400, 200, 200); 
       
        noFill();
        image(ceo_lo_face, left_bar, 0, pic_wide, pic_long);
     }
    
    
  fill(0); 
  rect(button_homeX, button_homeY, button_home_wide, button_home_long); 
  fill(255); 
  textFont(tall, 25);
  text("Home", button_homeX +10, button_homeY + 25); 
             
         
  
  }
//______________Estee Lauder_________________________________
  
 if (state == 2) {
   
   draw = false; 
 //counter immediately jumps past "1" so the background is only drawn once and will not loop 
   counter2 ++; 
    
   background(0); 
   image(ceo_estee, left_bar, 0, pic_wide, pic_long);
    
  
  fill(255); 
  
 //_____keyboard __interactions___________________________________________

   
    if(keyPressed == true){
     if (key == 'e'){
       estee_eyes = true; 
     }
     if (key == 'l'){
       estee_lips = true; 
     }
      if (key == 'b'){
       estee_blush = true; 
     }
     if (key == 'f'){
       estee_face = true; 
     }
     if (key == 'c'){ 
       estee_eyes = false;
       estee_lips = false; 
       estee_blush = false; 
       estee_face = false; 
      
  
       background(0); 
  
      //redraw left panel 
     image(lipstick, 50, 70, 50, 150);
     image(blush, 10, 240, 150, 150); 
     image(face, -20, 400, 200, 200); 
     image(eyes, -10, 570, 200, 200);
       
  // redraw ceo's face over the make up   
  image(ceo_estee, left_bar, 0, pic_wide, pic_long);

        
     }
    }
    
    // this is simply where the left panel makeup gets highlighted when the corresponding button is pushed 
   
      if (estee_eyes == true){
        //draws the white block and mascara again

        fill(255, 255, 255, 200 ); 
        rect(10, 590, 145, 150); 
        image(eyes, -10, 570, 200, 200);

       // draw makeup on face
        noFill(); 
        image(ceo_estee_eyes, left_bar, 0, pic_wide, pic_long); 
          }
          
     if (estee_lips == true){
       
       //draws the white block and lipstick again
       fill(255, 255, 255, 200 ); 
       rect(10, 70, 145, 150);
       image(lipstick, 50, 70, 50, 150);

        noFill(); 
        image(ceo_estee_lips, left_bar, 0, pic_wide, pic_long);
     }
    
     if (estee_blush == true){
       
       fill(255, 255, 255, 200 ); 
        rect(10, 245, 145, 150);
        image(blush, 10, 240, 150, 150); 

        noFill(); 
        image(ceo_estee_blush, left_bar, 0, pic_wide, pic_long);
     }
     
     if (estee_face == true){
       
        fill(255, 255, 255, 200 ); 
        rect(10, 425, 145, 145);
        image(face, -20, 400, 200, 200); 
       
        noFill();
        image(ceo_estee_face, left_bar, 0, pic_wide, pic_long);
       
     }
  
  // this is the Home left corner button 
  fill(0); 
  rect(button_homeX, button_homeY, button_home_wide, button_home_long); 
  fill(255); 
  textFont(tall, 25);
  text("Home", button_homeX +10, button_homeY + 25); 

}   // this is 2's end

//STATE 3 ___________/////////////////////////////////////////////////
if (state == 3){
  
 counter3++; 
 
 if(state == 3 && counter3 == 1) {
     background(0); 
   image(ceo_lo, left_bar, 0, pic_wide, pic_long);
 }
   
      
  //_______make_up_ left_side ___________________________
  image(lipstick, 50, 70, 50, 150);
  image(blush, 10, 240, 150, 150); 
  image(face, -20, 400, 200, 200); 
  image(eyes, -10, 570, 200, 200);
   
   //________right side____________________
fill (255); 
  textFont(tall, 50); 
  text("L'oreal CE0", edge , 40); 
 textFont(tall, 40); 
  text("Jean Paul Agon", edge , 75); 
   textFont(tall, 30); 
  text("L'oreal Subsidiaries", edge, 120);
  textFont(tall, 20); 
  text("Kéraskin Esthetics", edge, 150);
  text("L'oreal Subsidiaries", edge, 170);
   text("Ombrelle", edge, 190);
    text("Garnier", edge, 210);
     text("Maybelline", edge, 230);
      text("Créateurs de Beauté", edge, 250);
       text("SoftSheen-Carson", edge, 270);
        text("Essie", edge, 290);
         text("Vichy", edge, 310);
          text("La Roche Posay", edge, 330);
           text("Inneov", edge, 350);
            text("Skinceuticals", edge, 370);
             text("Roger&Gallet", edge, 390);
              text("Sanoflore", edge, 410);
               text("Dermablend", edge, 430);
                  text("Kérastase", edge, 450);
                    text("Redken", edge, 470);
                      text("Shu Uemura ", edge, 490);
                          text("Yves Saint Laurent", edge, 510);
                              text("Giorgio Armani", edge, 530);
                                  text("Biotherm", edge, 550);
                                  text("Viktor & Rolf", edge, 570);
                                    text("Kiehl's ", edge, 590);
                                       text("The Body Shop", edge, 610);
                                            text("Urban Decay", edge, 630);
                                                  text("Yue Sai", edge, 650);
                                                  
//    //__________From Arduino__________________________________________________________
   // move this all down to button presses 
 if(draw == true){
    if (arduino.analogRead(lips_ard)>0){
     if(mousePressed == true){
     fill(255, 0, 0, 150); 
     ellipse(mouseX, mouseY, arduino.analogRead(0) / 10, arduino.analogRead(0) / 10); 
     fill(255);   
     }
    }
    
   if(arduino.analogRead(face_ard) < 500){
    //println(arduino.analogRead(1)); 
   fill(245, 222, 179, 50); 
   ellipse(mouseX, mouseY, 40, 40); 
} 
   
   if(arduino.digitalRead(eyes_ard) == 1){
   fill(0); 
   ellipse(mouseX, mouseY, 15, 15); 
   println(arduino.digitalRead(eyes_ard)); 
   }
  
  if(arduino.analogRead(blush_ard)<700){
  //println(arduino.analogRead(5)); 
  fill(233, 150, 122, 150); 
  ellipse(mouseX, mouseY, 30, 30);
 
  
 }
  
 }
 
 if(keyPressed == true){
   // this is the CLEAR button! 
     if (key == 'c'){
       
       lo_eyes = false;
       lo_lips = false; 
       lo_blush = false; 
       lo_face = false; 
       
       background (0); 
        
         image(lipstick, 50, 70, 50, 150);
         image(blush, 10, 240, 150, 150); 
         image(face, -20, 400, 200, 200); 
         image(eyes, -10, 570, 200, 200);
       
      // redraw the ceo's face 
      
        image(ceo_lo, left_bar, 0, pic_wide, pic_long);    
        
     }
 }
 
 // this is the Home left corner button 
  fill(0); 
  rect(button_homeX, button_homeY, button_home_wide, button_home_long); 
  fill(255); 
  textFont(tall, 25);
  text("Home", button_homeX +10, button_homeY + 25); 
  
  
}// this is draw 3's end 


// This is State 4_____________/////////////////////////////////////////////////////////////
if (state == 4){
  
   counter4 ++; 
    
  if(state == 2 && counter4 == 1){
   background(0); 
   image(ceo_estee, left_bar, 0, pic_wide, pic_long);
    
  }
  
  //_______make_up_ left_side_panel ___________________________
  image(lipstick, 50, 70, 50, 150);
  image(blush, 10, 240, 150, 150); 
  image(face, -20, 400, 200, 200); 
  image(eyes, -10, 570, 200, 200);

//________right side____________________
  fill(255); 
  textFont(tall, 40); 
  text("Estee Lauder, CE0", edge , 40); 
  textFont(tall, 30); 
  text("Fabrizio Freda", edge , 70); 
  textFont(tall, 30); 
  text("Estee Lauder Subsidiaries", edge, 130);
  textFont(tall, 20); 
  text("American Beauty", edge, 170);
  //text("Aramis", edge, 195);
   text("Aveda", edge, 190);
    text("Bobbi Brown", edge, 210);
     text("Bumble and bumble", edge, 230);
      text("Clinique", edge, 250);
       text("Coach", edge, 270);
        text("Daisy Fuentes", edge, 290);
         text("Darphin", edge, 310);
          text("Donald Trump", edge, 330);
           text("Donna Karan", edge, 350);
            text("Flirt!", edge, 370);
             text("Good Skin", edge, 390);
              text("Grassroots", edge, 410);
               text("Jo Malone", edge, 430);
                  text("Good Skin", edge, 450);
                    text("Kate Spade", edge, 470);
                      text("Kiton", edge, 490);
                         text("Lab Series", edge, 510);
                            text("La Mer", edge, 530);
                               text("M·A·C", edge, 550);
                                  text("Marni", edge, 570);
                                    text("Michael Kors", edge, 590);
                                       text("Missoni", edge, 610);
                                            text("Ojon", edge, 630);
                                               text("Origins", edge, 650);
                                                 text("Prescriptives ", edge, 670);                                             
                                                    text("Sean John", edge, 690);
                                                       text("Smashbox Cosmetics", edge, 710);
                                                          text("Tommy Hilfiger", edge, 730);
                                                            text("Tom Ford Beauty", edge, 750);
                                                              text("Tory Burch", edge, 770);
                                                               text("Ermenegildo Zegna", edge, 790);
 //__________From Arduino__________________________________________________________

 if(draw == true){
    if (arduino.analogRead(lips_ard)>0){
     if(mousePressed == true){
     fill(255, 0, 0, 150); 
     ellipse(mouseX, mouseY, arduino.analogRead(0) / 10, arduino.analogRead(0) / 10); 
     fill(255);   
     }
    }
    
   if(arduino.analogRead(face_ard) < 500){
    //println(arduino.analogRead(1)); 
   fill(245, 222, 179, 50); 
   ellipse(mouseX, mouseY, 40, 40); 
} 
   
   if(arduino.digitalRead(eyes_ard) == 1){
   fill(0); 
   ellipse(mouseX, mouseY, 15, 15); 
   println(arduino.digitalRead(eyes_ard)); 
   }
  
  if(arduino.analogRead(blush_ard)<700){
  //println(arduino.analogRead(5)); 
  fill(233, 150, 122, 150); 
  ellipse(mouseX, mouseY, 30, 30);
  
  }
 }
 
 if (keyPressed == true){
 if (key == 'c'){ 
       estee_eyes = false;
       estee_lips = false; 
       estee_blush = false; 
       estee_face = false; 
      
  
       background(0); 
  
      //redraw left panel 
     image(lipstick, 50, 70, 50, 150);
     image(blush, 10, 240, 150, 150); 
     image(face, -20, 400, 200, 200); 
     image(eyes, -10, 570, 200, 200);
       
  // redraw ceo's face over the make up   
  image(ceo_estee, left_bar, 0, pic_wide, pic_long);

        
     }
    }
                 
   // this is the Home left corner button 
  fill(0); 
  rect(button_homeX, button_homeY, button_home_wide, button_home_long); 
  fill(255); 
  textFont(tall, 25);
  text("Home", button_homeX +10, button_homeY + 25); 
                  
  
  
  
}// this is state 4's end///////
  
}  // this is draw' s end 


//___________________________Mouse Presses__________________
 //_____________________State Changes_______________________
void mousePressed(){
  
  //----home button ----
  if(dist(mouseX, mouseY, button_homeX, button_homeY) < button_home_wide/2){  
      state = 0; 
      println("home"); 
      }
  
if(state == 0){
  if(dist(mouseX, mouseY, button_loX, button_loY)<button_size/2){
      state = 1; 
      }
      
    if(dist(mouseX, mouseY, button_esteeX, button_esteeY)< button_size/2){
      state = 2; 
      println("i'm being pressed"); 
      }
    } 
    
    
}
    
 //___________________Key Presses_____________________________________   
 
 void keyPressed(){
     
     if(key == 's'){
       record = true;
     }
     
     if (state == 1){
       if(key == 'd'){
         state = 3; 
         draw = true; 
       } 
     }
      if (state == 2){
       if(key == 'd'){
         state = 4; 
         draw = true; 
     
   }
      }
 }


