
// Authour: KEVIN DJOUSSA
// Student Number: C14441488
float xo;
float yo;
float zoom = 1;
float angle = 0;
int i;

void setup()
{
 xo = width/2;
 yo = height/2;
 
smooth();
noStroke();
background(0);
size(500,500);
LoadData();


}
ArrayList<Carp> carps = new ArrayList<Carp>();
int menu = 0;
boolean start =true;


void LoadData(){//function to load data
String [] data = loadStrings( "data2.txt" );

for (int i = 0; i < data.length; i++)
{
    Carp carp = new Carp(data[i]);
    carps.add(carp);
}

}

void draw()
{
  background(0);
  if(start)// draws the start menu
  { 
    fill(255, 100);
    noStroke ();
    textSize(15);
    textAlign(LEFT);
    text("MENU:",width-400, height-420);
    text("1 - LINEGRAPH", width-400, height-400);
    text("2 - BARGRAPH", width-400, height-380);
    text("3 - PERSNONAL ILLUSTRATION", width-400, height-360 );
    text("J - january", width-349, height-340);
    text("F - february", width-349, height-320);
    text("M - march", width-349, height-300);
    text("P - april", width-349, height-280);
    text("Y - may", width-349, height-260);
    text("E - june", width-349, height-240);
    text("U - july", width-349, height-220);
    text("A - august", width-349, height-200);
    text("S - september", width-349, height-180);
    text("O - october", width-349, height-160);
    text("N - november", width-349, height-140);
    text("D - december", width-349, height-120);
    text("white ball - women", width-349, height-100);
    text("Transparent ball- men", width-349, height-80);
    text("Orange Ball - children", width-349, height-60);
    
   
   
  }
  else
  {
    if(menu == 1) //displays line graph
    {
      linegraph();
    }
    if(menu == 2)// displays bargraph
    {
      bargraph();
    }
    if(menu == 3)// this plays rotating spheres
    {
      rotation();
    }
  }
}

void linegraph()// function to draw linegraph
{
      float border = width * 0.1f;
      drawAxis(15,553,border);// calls the drawAxis function to draw the borders of the graph
      stroke(255);
      fill(255);
      
      
      float windowRange = (width - (border * 2.0f));
      float dataRange = 553;      
      float lineWidth =  windowRange / (float) (carps.size() - 1) ;
      
      float scale = windowRange / dataRange;
 
      for (int i = 0 ; i < carps.size()-1 ; i ++)
      {
        float y1 = map(carps.get(i).sum2, 0, dataRange, 0, windowRange);
        float y2 = map(carps.get(i+1).sum2, 0, dataRange, 0, windowRange);
        float x1 = border + (i  * lineWidth);
        float x2 = border + ((i+1) * lineWidth);
        println(carps.get(i).sum2);
        println(carps.get(i+1).sum2);
        line(x1, (height-border)-y1, x2, (height-border)-y2);
      }


}

void bargraph()// funtion to display bargraph
{
      float border = width * 0.1f;
      drawAxis(15,553,border);// the draw axis function to draw the borders 
      noStroke();
      
      
      
      float windowRange = (width - (border * 2.0f));
      float dataRange = 553;      
      float lineWidth =  windowRange / (float) (carps.size() - 1) ;
      
      float scale = windowRange / dataRange;
 
      for (int i = 0 ; i < carps.size()-1 ; i ++)
      {
        float y1 = map(carps.get(i).sum2, 0, dataRange, 0, windowRange);
        float x1 = border + (i  * lineWidth);
        println(carps.get(i).sum2);
        println(carps.get(i+1).sum2);
        fill(random(255), random(255), random(255));
        rect(x1, (height-border), lineWidth, -y1);
        
      }

}
void drawAxis(int verticalIntervals, float vertDataRange, float border) // function to draw the borders or axis 
{
  stroke(200, 200, 200);
  fill(200, 200, 200);  
  
  // Draw the horizontal axis  
  line(border, height - border, width - border, height - border);
  
  float windowRange = (width - (border * 2.0f));  
  float horizInterval =  windowRange / (carps.size() - 1);
  float tickSize = border * 0.1f;
  
    
  for (int i = 0 ; i < carps.size() ; i ++)
  {   
   // Draw the ticks
   float x = border + (i * horizInterval);
    line(x, height - (border - tickSize)
      , x, (height - border));
   float textY = height - (border * 0.5f);
   
   // Print the text 
   textAlign(CENTER, CENTER);
   text(carps.get(i).months, x, textY);
   
  }
  
  // Draw the vertical axis
  line(border, border , border, height - border);
  
  float verticalDataGap = vertDataRange / verticalIntervals;
  float verticalWindowRange = height - (border * 2.0f);
  float verticalWindowGap = verticalWindowRange / verticalIntervals; 
  for (int i = 0 ; i <= verticalIntervals ; i ++)
  {
    float y = (height - border) - (i * verticalWindowGap);
    line(border - tickSize, y, border, y);
    float hAxisLabel = verticalDataGap * i;
        
    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  } 
}

void keyPressed()// allows the user to navigate
{
  switch (key)
  {
  case '1':
  
    menu = 1;
    start = false;
    break;
    
  case '2':
  
  
    menu = 2;
    start = false;
    break;
    
  case '3':
  
    menu = 3;
    start = false;
    break;
    
  case '4':
  
   start =true;
  break;
  //allows thee user to see changes in number of children men and women items sold every months 
  case 'j':
  
   i = 0;
   break;
  case 'f':
  
  i = 1;
  break;
  case 'm':
  
   i = 2;
  break;
  
  case 'p':
  
   i = 3;
  break;
  
  case 'y':
   i = 4;
  break;
  
  case 'e':
   i = 5;
  break;
  
  case 'u':
   i = 6;
  break;
  
  case 'a':
   i = 7;
  break;
  
  case 's':
   i = 8;
  break;
  
  case 'o':
   i = 9;
  break;
  
  case 'n':
   i = 10;
  break;
  
  case 'd':
   i = 11;
  break;
  }
  // allow the user to zoom in and zoom out of the rotating spheres
  if (key == CODED) {
    if (keyCode == UP) {
      zoom += .03;
    } else if (keyCode == DOWN) {
      zoom -= .03;
    } else if (keyCode == RIGHT) {
      
    } else if (keyCode == LEFT) {
      angle -= .03;
    }
  }
  if (key == ' ') {//resets the spheres tonormal view
    angle = 0;
    zoom = 1;
    xo = width/2;
    yo = height/2;
  }
}

void rotation(){// function for rotating spheres


int d = 40;


;

  smooth();
  noStroke();
  background(#1F7B9B);
  translate(xo, yo);
  scale(zoom);// allows the user to zoom in and zoom out 
  rotate(angle);// makes the spheres rotate
  
  fill(120);
  //ellipse(-200, 0, carps.get(1).sum, carps.get(1).sum);
  fill(70,70);
  ellipse(   30, 0, carps.get(i).men, carps.get(i).men);
  fill(180);
  ellipse(-100, 0, carps.get(i).children, carps.get(i).children);
  fill(200,80,10);
  ellipse( 100, 0, carps.get(i).women, carps.get(i).women);
  fill(80,110);
  //ellipse( 200, 0, d, d);
  angle += .03;
  
  

}



void mouseDragged() { // allows the user to be able to drag the spheres around
  xo = xo + (mouseX - pmouseX);
  yo = yo + (mouseY - pmouseY);


}

