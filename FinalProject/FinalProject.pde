#include <MeggyJrSimple.h>    // Required code, line 1 of 2.

struct Point
{
  int x;
  int y;
};

Point initial = {4,7};    //Initial location of piece
Point piece = {0,0};    //Location of last dropped piece
Point win1 = {0,0};
Point win2 = {0,0};
Point win3 = {0,0};
Point win4 = {0,0};

int player = 1;     //Player variable
int marker1 = 1;    //Stacking pieces per column
int marker2 = 1;
int marker3 = 1;
int marker4 = 1;
int marker5 = 1;
int marker6 = 1;

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
  
  if (player == 1)
  {
    checkwinBlue();
    player1();
    //checktie();
  }
  if (player == 2)
  {
    checkwinRed();
    player2();
    
    //checktie();
  }
  DisplaySlate();
}

void player1()
{
  DrawPx(initial.x, initial.y, Red);
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
  if (Button_B)
  {
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
  }
  if (Button_A)
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
  }
}
 
 
 
 
void player2()
{
  DrawPx(initial.x, initial.y, Blue);
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
  if (Button_B)
  {
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
  }
  if (Button_A)
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
  }
}

void checkwinRed()
{
  if (ReadPx(piece.x,piece.y) == Red)    //Check left
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
          endgamered();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y) == Red)    //Check right
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
          endgamered();
        }
      }
    }
    if (ReadPx(piece.x,piece.y-1) == Red)    //Check down
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
          endgamered();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y-1) == Red)    //Check southwest
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
          endgamered();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y-1) == Red)    //Checksoutheast
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
          endgamered();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y+1) == Red)    //Check northwest
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
          endgamered();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y+1) == Red)    //CheckNortheast
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
          endgamered();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y) == Red)    // X.XX
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
          endgamered();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y) == Red)    //XX.X
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
          endgamered();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y+1) == Red)    //xx_x 11-5
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
          endgamered();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y-1) == Red)    //x_xx  11-5
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
          endgamered();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y-1) == Red)    //xx_x  1-7
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
          endgamered();
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
          endgamered();
        }
      }
    }
  }
}
    
void checkwinBlue()
{
  if (ReadPx(piece.x,piece.y) == Blue)    //Check left
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
          endgameblue();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y) == Blue)    //Check right
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
          endgamered();
        }
      }
    }
    if (ReadPx(piece.x,piece.y-1) == Blue)    //Check down
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
          endgameblue();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y-1) == Blue)    //Check southwest
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
          endgameblue();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y-1) == Blue)    //Checksoutheast
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
          endgameblue();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y+1) == Blue)    //Check northwest
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
          endgameblue();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y+1) == Blue)    //CheckNortheast
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
          endgameblue();
        }
      }
    }/////
    if (ReadPx(piece.x+1,piece.y) == Blue)    // X.XX
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
          endgameblue();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y) == Blue)    //XX.X
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
          endgameblue();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y+1) == Blue)    //xx_x 11-5
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
          endgameblue();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y-1) == Blue)    //x_xxx  11-5
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
          endgameblue();
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y-1) == Blue)    //xx_x  1-7
    {
      if (ReadPx(piece.x-2,piece.y-2) == Blue)
      {
        if (ReadPx(piece.x+1,piece.y+1) ==Blue)
        {
          win1.x=piece.x;
          win1.y=piece.y;
          win2.x=piece.x-1;
          win2.y=piece.y-1;
          win3.x=piece.x-2;
          win3.y=piece.y-2;
          win4.x=piece.x+1;
          win4.y=piece.y+1;
          endgameblue();
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y+1) == Blue)
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
          endgameblue();
        }
      }
    }
  }
}

void endgame()
{
  DrawPx(3,0,White);
  DisplaySlate();
}

void endgamered()
{
  DrawPx(win1.x,win1.y,White);
  DrawPx(win2.x,win2.y,White);
  DrawPx(win3.x,win3.y,White);
  DrawPx(win4.x,win4.y,White);
  DisplaySlate();
  delay(250);
  DrawPx(win1.x,win1.y,Red);
  DrawPx(win2.x,win2.y,Red);
  DrawPx(win3.x,win3.y,Red);
  DrawPx(win4.x,win4.y,Red);
  DisplaySlate();
  delay(250);
  DrawPx(win1.x,win1.y,White);
  DrawPx(win2.x,win2.y,White);
  DrawPx(win3.x,win3.y,White);
  DrawPx(win4.x,win4.y,White);
  DisplaySlate();
  delay(250);
  DrawPx(win1.x,win1.y,Red);
  DrawPx(win2.x,win2.y,Red);
  DrawPx(win3.x,win3.y,Red);
  DrawPx(win4.x,win4.y,Red);
}

void endgameblue()
{
  DrawPx(win1.x,win1.y,White);
  DrawPx(win2.x,win2.y,White);
  DrawPx(win3.x,win3.y,White);
  DrawPx(win4.x,win4.y,White);
  DisplaySlate();
  delay(250);
  DrawPx(win1.x,win1.y,Blue);
  DrawPx(win2.x,win2.y,Blue);
  DrawPx(win3.x,win3.y,Blue);
  DrawPx(win4.x,win4.y,Blue);
  DisplaySlate();
  delay(250);
  DrawPx(win1.x,win1.y,White);
  DrawPx(win2.x,win2.y,White);
  DrawPx(win3.x,win3.y,White);
  DrawPx(win4.x,win4.y,White);
  DisplaySlate();
  delay(250);
  DrawPx(win1.x,win1.y,Blue);
  DrawPx(win2.x,win2.y,Blue);
  DrawPx(win3.x,win3.y,Blue);
  DrawPx(win4.x,win4.y,Blue);
}

void resetgame()
{
  CheckButtonsPress();
  {
    if (Button_B)
    {
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
    }
  }
}

