#include <MeggyJrSimple.h>    // Required code, line 1 of 2.

struct Point
{
  int x;
  int y;
};

Point initial = {4,7};    //Initial location of piece
Point piece = {0,0};    //Location of last dropped piece
Point win1 = {0,0};    //Record winning point for end game animation
Point win2 = {0,0};
Point win3 = {0,0};
Point win4 = {0,0};

int player = 1;     //Player variable
int marker1 = 1;    //Marker for stacking pieces per column
int marker2 = 1;
int marker3 = 1;
int marker4 = 1;
int marker5 = 1;
int marker6 = 1;

int wingame = 1;    //When to run endgame loop

void setup()                    // run once, when the sketch starts
{
  MeggyJrSimpleSetup();      // Required code, line 2 of 2.
  Serial.begin(9600);
  for (int i = 0; i<7; i++)    //Draw "board"
  {
    DrawPx(0,i,Green);
    DrawPx(7,i,Green);
    DrawPx(i,0,Green);
  }
}

void loop()                     // run over and over again
{
  if (wingame == 1)    //Loop for game
  {
    if (player == 1)    //Red players turn
    {
      checkwinBlue();    //Check if blue won
      player1();    //Code for red player's turn
    }
    if (player == 2)
    {
      checkwinRed();    //Check if red won
      player2();    //Code for blue player's turn
    }
    DisplaySlate();
  }
  if (wingame == 2)    //Win game animation if red won
  {
    endgamered();
  }
  if (wingame == 3)    //Win game animation if blue won
  {
    endgameblue();
  }
}

void player1()    //Method for red player's turn
{
  DrawPx(initial.x, initial.y, Red);    //Draw initial red piece
  DisplaySlate();
  CheckButtonsPress();    //Code for piece movement
  if (Button_Left)    
  {
    DrawPx(initial.x, initial.y, 0);
    initial.x--;
  }
  if (Button_Right)
  {
    DrawPx(initial.x, initial.y, 0);
    initial.x++;
  }
  if (initial.x>6)    //Piece movement restrictions
  {
    initial.x = 6;
  }
  if (initial.x<1)
  {
    initial.x = 1;
  }
  if (Button_B)    //Reset button
  {
    Tone_Start(ToneG4,200);
    ClearSlate();
    for (int i = 0; i<7; i++)    //Draw "board"
    {
      DrawPx(0,i,Green);
      DrawPx(7,i,Green);
      DrawPx(i,0,Green);
    }
    player = 1;
    marker1 = 1;      //Resets stacking markers
    marker2 = 1;
    marker3 = 1;
    marker4 = 1;
    marker5 = 1;
    marker6 = 1;
    initial.x = 4;    //Resets initial piece location
    initial.y = 7;
  }
  if (Button_A)    //Drop piece button
  {
    if (initial.x == 1)    //For column 1
    {
      if (marker1<7)    //Height restrictions
      {
        DrawPx(initial.x, marker1, Red);
        piece.x=initial.x;    //Records dropped location
        piece.y=marker1;    //Records dropped location
        marker1++;
        delay(150);
        player = 2;
      }
    }
    if (initial.x == 2)    //For column 2
    {
      if (marker2<7)    
      {
        DrawPx(initial.x, marker2, Red);
        piece.x=initial.x;    
        piece.y=marker2;    
        marker2++;
        delay(150);
        player = 2;
      }
    }
    if (initial.x == 3)    //For column 3
    {
      if (marker3<7)    
      {
        DrawPx(initial.x, marker3, Red);
        piece.x=initial.x;    
        piece.y=marker3;    
        marker3++;
        delay(150);
        player = 2;
      }
    }
    if (initial.x == 4)    //For column 4
    {
      if (marker4<7)    
      {
        DrawPx(initial.x, marker4, Red);
        piece.x=initial.x;    
        piece.y=marker4;    
        marker4++;
        delay(150);
        player = 2;
      }
    }
    if (initial.x == 5)    //For column 5
    {
      if (marker5<7)    
      {
        DrawPx(initial.x, marker5, Red);
        piece.x=initial.x;    
        piece.y=marker5;    
        marker5++;
        delay(150);
        player = 2;
      }
    }
    if (initial.x == 6)    //For column 6
    {
      if (marker6<7)    
      {
        DrawPx(initial.x, marker6, Red);
        piece.x=initial.x;    
        piece.y=marker6;    
        marker6++;
        delay(150);
        player = 2;
      }
    }
    Tone_Start(ToneE5,150);
  }
}
 
 
 
 
void player2()    //Method for blue player's turn
{
  DrawPx(initial.x, initial.y, Blue);    //Draw initial blue piece
  DisplaySlate();
  CheckButtonsPress();    
  if (Button_Left)        //Code for piece movement
  {
    DrawPx(initial.x, initial.y, 0);
    initial.x--;
  }
  if (Button_Right)
  {
    DrawPx(initial.x, initial.y, 0);
    initial.x++;
  }
  if (initial.x>6)    //Piece movement restrictions
  {
    initial.x = 6;
  }
  if (initial.x<1)
  {
    initial.x = 1;
  }
  if (Button_B)    //Reset button
  {
    Tone_Start(ToneG4,200);
    ClearSlate();
    for (int i = 0; i<7; i++)    //Draw "board"
    {
      DrawPx(0,i,Green);
      DrawPx(7,i,Green);
      DrawPx(i,0,Green);
    }
    player = 1;
    marker1 = 1;    //Reset stacking marker
    marker2 = 1;
    marker3 = 1;
    marker4 = 1;
    marker5 = 1;
    marker6 = 1;
    initial.x = 4;
    initial.y = 7;
  }
  if (Button_A)    //Drop Piece button
  {
    if (initial.x == 1)    //For column 1
    {
      if (marker1<7)    //Height restrictions
      {
        DrawPx(initial.x, marker1, Blue);
        piece.x=initial.x;    //Records dropped location
        piece.y=marker1;    //Records dropped location
        marker1++;
        delay(150);
        player = 1;
      }
    }
    if (initial.x == 2)    //For column 2
    {
      if (marker2<7)    
      {
        DrawPx(initial.x, marker2, Blue);
        piece.x=initial.x;    
        piece.y=marker2;    
        marker2++;
        delay(150);
        player = 1;
      }
    }
    if (initial.x == 3)    //For column 3
    {
      if (marker3<7)    
      {
        DrawPx(initial.x, marker3, Blue);
        piece.x=initial.x;    
        piece.y=marker3;    
        marker3++;
        delay(150);
        player = 1;
      }
    }
    if (initial.x == 4)    //For column 4
    {
      if (marker4<7)    
      {
        DrawPx(initial.x, marker4, Blue);
        piece.x=initial.x;    
        piece.y=marker4;    
        marker4++;
        delay(150);
        player = 1;
      }
    }
    if (initial.x == 5)    //For column 5
    {
      if (marker5<7)    
      {
        DrawPx(initial.x, marker5, Blue);
        piece.x=initial.x;    
        piece.y=marker5;    
        marker5++;
        delay(150);
        player = 1;
      }
    }
    if (initial.x == 6)    //For column 6
    {
      if (marker6<7)    
      {
        DrawPx(initial.x, marker6, Blue);
        piece.x=initial.x;    
        piece.y=marker6;    
        marker6++;
        delay(150);
        player = 1;
      }
    }
    Tone_Start(ToneE5,150);
  }
}

void checkwinRed()    //Check if red player has won
{
  if (ReadPx(piece.x,piece.y) == Red)    //Check to the left of last piece dropped
  {
    if (ReadPx(piece.x-1,piece.y) == Red)
    {
      if (ReadPx(piece.x-2,piece.y) == Red)
      {
        if (ReadPx(piece.x-3,piece.y) == Red)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x-1;
          win2.y=piece.y;
          win3.x=piece.x-2;
          win3.y=piece.y;
          win4.x=piece.x-3;
          win4.y=piece.y;
          wingame = 2;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y) == Red)    //Check to the right of last piece dropped
    {
      if (ReadPx(piece.x+2,piece.y) == Red)
      {
        if (ReadPx(piece.x+3,piece.y) == Red)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x+1;
          win2.y=piece.y;
          win3.x=piece.x+2;
          win3.y=piece.y;
          win4.x=piece.x+3;
          win4.y=piece.y;
          wingame = 2;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x,piece.y-1) == Red)    //Check down from last piece dropped
    {
      if (ReadPx(piece.x,piece.y-2) == Red)
      {
        if (ReadPx(piece.x,piece.y-3) == Red)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x;
          win2.y=piece.y-1;
          win3.x=piece.x;
          win3.y=piece.y-2;
          win4.x=piece.x;
          win4.y=piece.y-3;
          wingame = 2;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y-1) == Red)    //Check southwest of last piece dropped
    {
      if (ReadPx(piece.x-2,piece.y-2) == Red)
      {
        if (ReadPx(piece.x-3,piece.y-3) == Red)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x-1;
          win2.y=piece.y-1;
          win3.x=piece.x-2;
          win3.y=piece.y-2;
          win4.x=piece.x-3;
          win4.y=piece.y-3;
          wingame = 2;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y-1) == Red)    //Check southeast of last piece dropped
    {
      if (ReadPx(piece.x+2,piece.y-2) == Red)
      {
        if (ReadPx(piece.x+3,piece.y-3) == Red)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x+1;
          win2.y=piece.y-1;
          win3.x=piece.x+2;
          win3.y=piece.y-2;
          win4.x=piece.x+3;
          win4.y=piece.y-3;
          wingame = 2;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y+1) == Red)    //Check northwest of last piece dropped
    {
      if (ReadPx(piece.x-2,piece.y+2) == Red)
      {
        if (ReadPx(piece.x-3,piece.y+3) == Red)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x-1;
          win2.y=piece.y+1;
          win3.x=piece.x-2;
          win3.y=piece.y+2;
          win4.x=piece.x-3;
          win4.y=piece.y+3;
          wingame = 2;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y+1) == Red)    //Check Northeast of last piece dropped
    {
      if (ReadPx(piece.x+2,piece.y+2) == Red)
      {
        if (ReadPx(piece.x+3,piece.y+3) == Red)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x+1;
          win2.y=piece.y+1;
          win3.x=piece.x+2;
          win3.y=piece.y+2;
          win4.x=piece.x+3;
          win4.y=piece.y+3;
          wingame = 2;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y) == Red)    // Check two right and one left horizontally
    {
      if (ReadPx(piece.x+2,piece.y) == Red)
      {
        if (ReadPx(piece.x-1,piece.y) == Red)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x+1;
          win2.y=piece.y;
          win3.x=piece.x+2;
          win3.y=piece.y;
          win4.x=piece.x-1;
          win4.y=piece.y;
          wingame = 2;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y) == Red)    //Check two left and one right horizontally
    {
      if (ReadPx(piece.x-2,piece.y) == Red)
      {
        if (ReadPx(piece.x+1,piece.y) == Red)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x-1;
          win2.y=piece.y;
          win3.x=piece.x-2;
          win3.y=piece.y;
          win4.x=piece.x+1;
          win4.y=piece.y;
          wingame = 2;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y+1) == Red)    // Check two northwest one southeast
    {
      if (ReadPx(piece.x-2,piece.y+2) == Red)
      {
        if (ReadPx(piece.x+1,piece.y-1) == Red)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x-1;
          win2.y=piece.y+1;
          win3.x=piece.x-2;
          win3.y=piece.y+2;
          win4.x=piece.x+1;
          win4.y=piece.y-1;
          wingame = 2;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y-1) == Red)    //Check two southeast one northwest
    {
      if (ReadPx(piece.x+2,piece.y-2) == Red)
      {
        if (ReadPx(piece.x-1,piece.y+1) == Red)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x+1;
          win2.y=piece.y-1;
          win3.x=piece.x+2;
          win3.y=piece.y-2;
          win4.x=piece.x-1;
          win4.y=piece.y+1;
          wingame = 2;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y-1) == Red)    //Check two southwest one northeast
    {
      if (ReadPx(piece.x-2,piece.y-2) == Red)
      {
        if (ReadPx(piece.x+1,piece.y+1) ==Red)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x-1;
          win2.y=piece.y-1;
          win3.x=piece.x-2;
          win3.y=piece.y-2;
          win4.x=piece.x+1;
          win4.y=piece.y+1;
          wingame = 2;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y+1) == Red)
    {
      if (ReadPx(piece.x+2,piece.y+2) == Red)
      {
        if (ReadPx(piece.x-1,piece.y-1) == Red)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x+1;
          win2.y=piece.y+1;
          win3.x=piece.x+2;
          win3.y=piece.y+2;
          win4.x=piece.x-1;
          win4.y=piece.y-1;
          wingame = 2;
          endgamemusic();
        }
      }
    }
  }
}
    
void checkwinBlue()
{
  if (ReadPx(piece.x,piece.y) == Blue)    //Check left of last piece dropped
  {
    if (ReadPx(piece.x-1,piece.y) == Blue)
    {
      if (ReadPx(piece.x-2,piece.y) == Blue)
      {
        if (ReadPx(piece.x-3,piece.y) == Blue)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x-1;
          win2.y=piece.y;
          win3.x=piece.x-2;
          win3.y=piece.y;
          win4.x=piece.x-3;
          win4.y=piece.y;
          wingame = 3;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y) == Blue)    //Check right of last piece dropped
    {
      if (ReadPx(piece.x+2,piece.y) == Blue)
      {
        if (ReadPx(piece.x+3,piece.y) == Blue)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x+1;
          win2.y=piece.y;
          win3.x=piece.x+2;
          win3.y=piece.y;
          win4.x=piece.x+3;
          win4.y=piece.y;
          wingame = 2;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x,piece.y-1) == Blue)    //Check down from last piece dropped
    {
      if (ReadPx(piece.x,piece.y-2) == Blue)
      {
        if (ReadPx(piece.x,piece.y-3) == Blue)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x;
          win2.y=piece.y-1;
          win3.x=piece.x;
          win3.y=piece.y-2;
          win4.x=piece.x;
          win4.y=piece.y-3;
          wingame = 3;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y-1) == Blue)    //Check southwest of last piece dropped
    {
      if (ReadPx(piece.x-2,piece.y-2) == Blue)
      {
        if (ReadPx(piece.x-3,piece.y-3) == Blue)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x-1;
          win2.y=piece.y-1;
          win3.x=piece.x-2;
          win3.y=piece.y-2;
          win4.x=piece.x-3;
          win4.y=piece.y-3;
          wingame = 3;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y-1) == Blue)    //Check southeast of last piece dropped
    {
      if (ReadPx(piece.x+2,piece.y-2) == Blue)
      {
        if (ReadPx(piece.x+3,piece.y-3) == Blue)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x+1;
          win2.y=piece.y-1;
          win3.x=piece.x+2;
          win3.y=piece.y-2;
          win4.x=piece.x+3;
          win4.y=piece.y-3;
          wingame = 3;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y+1) == Blue)    //Check northwest of last piece dropped
    {
      if (ReadPx(piece.x-2,piece.y+2) == Blue)
      {
        if (ReadPx(piece.x-3,piece.y+3) == Blue)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x-1;
          win2.y=piece.y+1;
          win3.x=piece.x-2;
          win3.y=piece.y+2;
          win4.x=piece.x-3;
          win4.y=piece.y+3;
          wingame = 3;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y+1) == Blue)    //Check Northeast of last piece dropped
    {
      if (ReadPx(piece.x+2,piece.y+2) == Blue)
      {
        if (ReadPx(piece.x+3,piece.y+3) == Blue)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x+1;
          win2.y=piece.y+1;
          win3.x=piece.x+2;
          win3.y=piece.y+2;
          win4.x=piece.x+3;
          win4.y=piece.y+3;
          wingame = 3;
          endgamemusic();
        }
      }
    }/////
    if (ReadPx(piece.x+1,piece.y) == Blue)    //Check two right one left horizontally
    {
      if (ReadPx(piece.x+2,piece.y) == Blue)
      {
        if (ReadPx(piece.x-1,piece.y) == Blue)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x+1;
          win2.y=piece.y;
          win3.x=piece.x+2;
          win3.y=piece.y;
          win4.x=piece.x-1;
          win4.y=piece.y;
          wingame = 3;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y) == Blue)    //Check two left one right horizontally
    {
      if (ReadPx(piece.x-2,piece.y) == Blue)
      {
        if (ReadPx(piece.x+1,piece.y) == Blue)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x-1;
          win2.y=piece.y;
          win3.x=piece.x-2;
          win3.y=piece.y;
          win4.x=piece.x+1;
          win4.y=piece.y;
          wingame = 3;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y+1) == Blue)    //Check two northwest one southeast
    {
      if (ReadPx(piece.x-2,piece.y+2) == Blue)
      {
        if (ReadPx(piece.x+1,piece.y-1) == Blue)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x-1;
          win2.y=piece.y+1;
          win3.x=piece.x-2;
          win3.y=piece.y+2;
          win4.x=piece.x+1;
          win4.y=piece.y-1;
          wingame = 3;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y-1) == Blue)    //Check two southeast one northwest
    {
      if (ReadPx(piece.x+2,piece.y-2) == Blue)
      {
        if (ReadPx(piece.x-1,piece.y+1) == Blue)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x+1;
          win2.y=piece.y-1;
          win3.x=piece.x+2;
          win3.y=piece.y-2;
          win4.x=piece.x-1;
          win4.y=piece.y+1;
          wingame = 3;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y-1) == Blue)    //Check two southwest one northeast
    {
      if (ReadPx(piece.x-2,piece.y-2) == Blue)
      {
        if (ReadPx(piece.x+1,piece.y+1) ==Blue)
      
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x-1;
          win2.y=piece.y-1;
          win3.x=piece.x-2;
          win3.y=piece.y-2;
          win4.x=piece.x+1;
          win4.y=piece.y+1;
          wingame = 3;
          endgamemusic();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y+1) == Blue)   // Check two northeast one southwest
    {
      if (ReadPx(piece.x+2,piece.y+2) == Blue)
      {
        if (ReadPx(piece.x-1,piece.y-1) == Blue)
        {
          
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x+1;
          win2.y=piece.y+1;
          win3.x=piece.x+2;
          win3.y=piece.y+2;
          win4.x=piece.x-1;
          win4.y=piece.y-1;
          wingame = 3;
          endgamemusic();
        }
      }
    }
  }



void endgamered()    //Endgame animation for red
{
  DrawPx(win1.x,win1.y,White);
  DrawPx(win2.x,win2.y,White);
  DrawPx(win3.x,win3.y,White);
  DrawPx(win4.x,win4.y,White);
  DisplaySlate();
  delay(200);
  DrawPx(win1.x,win1.y,Red);
  DrawPx(win2.x,win2.y,Red);
  DrawPx(win3.x,win3.y,Red);
  DrawPx(win4.x,win4.y,Red);
  DisplaySlate();
  delay(200);
  DrawPx(win1.x,win1.y,White);
  DrawPx(win2.x,win2.y,White);
  DrawPx(win3.x,win3.y,White);
  DrawPx(win4.x,win4.y,White);
  DisplaySlate();
  delay(200);
  DrawPx(win1.x,win1.y,Red);
  DrawPx(win2.x,win2.y,Red);
  DrawPx(win3.x,win3.y,Red);
  DrawPx(win4.x,win4.y,Red);
  resetgame();
}
  
void endgameblue()    //Endgame animation for blue
{
  DrawPx(win1.x,win1.y,White);
  DrawPx(win2.x,win2.y,White);
  DrawPx(win3.x,win3.y,White);
  DrawPx(win4.x,win4.y,White);
  DisplaySlate();
  delay(200);
  DrawPx(win1.x,win1.y,Blue);
  DrawPx(win2.x,win2.y,Blue);
  DrawPx(win3.x,win3.y,Blue);
  DrawPx(win4.x,win4.y,Blue);
  DisplaySlate();
  delay(200);
  DrawPx(win1.x,win1.y,White);
  DrawPx(win2.x,win2.y,White);
  DrawPx(win3.x,win3.y,White);
  DrawPx(win4.x,win4.y,White);
  DisplaySlate();
  delay(200);
  DrawPx(win1.x,win1.y,Blue);
  DrawPx(win2.x,win2.y,Blue);
  DrawPx(win3.x,win3.y,Blue);
  DrawPx(win4.x,win4.y,Blue);
  resetgame();
}

void resetgame()    //code for rest button
{
  CheckButtonsPress();
  {
    if (Button_B)
    {
      Tone_Start(ToneG4,200);
      ClearSlate();
      for (int i = 0; i<7; i++)    //Draw "board"
      {
        DrawPx(0,i,Green);
        DrawPx(7,i,Green);
        DrawPx(i,0,Green);
      }
      player = 1;
      marker1 = 1;
      marker2 = 1;
      marker3 = 1;
      marker4 = 1;
      marker5 = 1;
      marker6 = 1;
      initial.x = 4;
      initial.y = 7;
      wingame = 1;
    }
  }
}

void endgamemusic()    //endgame music
{
  Tone_Start(ToneC5,750);
  delay(250);
  Tone_Start(ToneD5,750);
  delay(250);
  Tone_Start(ToneE5,750);
}

