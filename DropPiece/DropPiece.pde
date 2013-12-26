#include <MeggyJrSimple.h>

struct Point
{
  int x;
  int y;
};

Point initial = {4,7};  //Top piece
Point piece = {0,0};  //Dropped piece
int player = 1;
int marker1 = 1;
int marker2 = 1;
int marker3 = 1;
int marker4 = 1;
int marker5 = 1;
int marker6 = 1;

void setup()
{
  MeggyJrSimpleSetup();
  for (int i=0; i<7; i++)
  {
    DrawPx(0,i,Green);
    DrawPx(7,i,Green);
    DrawPx(i,0,Green);
  }
  Serial.begin(9600);
}

void loop()
{
  if (player ==1)
  {
    player1();
    checkwinRed();
  }
  if (player ==2)
  {
    player2();
    checkwinBlue();
  }
  DisplaySlate();  
}
  
void player1()
{
  DrawPx(initial.x,initial.y,Red);
  DisplaySlate();
  CheckButtonsPress();
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
  if (initial.x>6)
  {
    initial.x=6;
  }
  if (initial.x<1)
  {
    initial.x=1;
  }
  if (Button_A)
  {
    Serial.println("ButtonAPressed");
    if (initial.x == 1)    //column 1
    {
      if (marker1<7)
      {
        DrawPx(initial.x, marker1,Red);
        piece.x=initial.x;
        piece.y=marker1;
        marker1++;
        delay(150);
        player = 2;
      }        
    }
    if (initial.x == 2)    //column 2
    {
      if (marker2<7)
      {
        DrawPx(initial.x, marker2,Red);
        piece.x=initial.x;
        piece.y=marker2;
        marker2++;
        delay(150);
        player = 2;
      }        
    }
    if (initial.x == 3)    //column 3
    {
      if (marker3<7)
      {
        DrawPx(initial.x, marker3,Red);
        piece.x=initial.x;
        piece.y=marker3;
        marker3++;
        delay(150);
        player = 2;
      }        
    }
    if (initial.x == 4)    //column 4
    {
      if (marker5<7)
      {
        DrawPx(initial.x, marker4,Red);
        piece.x=initial.x;
        piece.y=marker4;
        marker4++;
        delay(150);
        player = 2;
      }        
    }
    if (initial.x == 5)    //column 5
    {
      if (marker5<7)
      {
        DrawPx(initial.x, marker5,Red);
        piece.x=initial.x;
        piece.y=marker5;
        marker5++;
        delay(150);
        player = 2;
      }        
    }
    if (initial.x == 6)    //column 6
    {
      if (marker6<7)
      {
        DrawPx(initial.x, marker6,Red);
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
  DrawPx(initial.x,initial.y,Blue);
  DisplaySlate();
  CheckButtonsPress();
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
  if (initial.x>6)
  {
    initial.x=6;
  }
  if (initial.x<1)
  {
    initial.x=1;
  }
  if (Button_A)
  {
    Serial.println("ButtonAPressed");
    if (initial.x == 1)    //column 1
    {
      if (marker1<7)
      {
        DrawPx(initial.x, marker1,Blue);
        piece.x=initial.x;
        piece.y=marker1;
        marker1++;
        delay(150);
        player = 1;
      }        
    }
     if (initial.x == 2)    //column 1
    {
      if (marker2<7)
      {
        DrawPx(initial.x, marker2,Blue);
        marker2++;
        delay(150);
        player = 1;
        piece.x=initial.x;
        piece.y=marker2;
      }        
    }
    if (initial.x == 3)    //column 1
    {
      if (marker3<7)
      {
        DrawPx(initial.x, marker3,Blue);
        piece.x=initial.x;
        piece.y=marker3;
        marker3++;
        delay(150);
        player = 1;
      }        
    }
    if (initial.x == 4)    //column 1
    {
      if (marker5<7)
      {
        DrawPx(initial.x, marker4,Blue);
        piece.x=initial.x;
        piece.y=marker4;
        marker4++;
        delay(150);
        player = 1;
      }        
    }
    if (initial.x == 5)    //column 1
    {
      if (marker5<7)
      {
        DrawPx(initial.x, marker5,Blue);
        marker5++;
        delay(150);
        player = 1;
        piece.x=initial.x;
        piece.y=marker5;
      }        
    }
    if (initial.x == 6)    //column 1
    {
      if (marker6<7)
      {
        DrawPx(initial.x, marker6,Blue);
        piece.x=initial.x;
        piece.y=marker6;
        marker6++;
        delay(150);
        player = 1;
      }        
    }
  }
}

void checkwinBlue()
{
}

void checkwinRed()
{
}
