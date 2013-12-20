#include <MeggyJrSimple.h>

struct Point
{
  int x;
  int y;
};

Point initial = {4,7};
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
  }
  if (player ==2)
  {
    player2();
  }
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
  if (Button_A)
  {
    Serial.println("ButtonAPressed");
    if (initial.x == 1)    //coloum 1
    {
      if (marker1<7)
      {
        DrawPx(initial.x, marker1,Red);
        marker1++;
        delay(150);
        player = 2;
      }        
    }
    if (initial.x == 2)    //coloum 1
    {
      if (marker2<7)
      {
        DrawPx(initial.x, marker2,Red);
        marker2++;
        delay(150);
        player = 2;
      }        
    }
    if (initial.x == 3)    //coloum 1
    {
      if (marker3<7)
      {
        DrawPx(initial.x, marker3,Red);
        marker3++;
        delay(150);
        player = 2;
      }        
    }
    if (initial.x == 4)    //coloum 1
    {
      if (marker5<7)
      {
        DrawPx(initial.x, marker4,Red);
        marker4++;
        delay(150);
        player = 2;
      }        
    }
    if (initial.x == 5)    //coloum 1
    {
      if (marker5<7)
      {
        DrawPx(initial.x, marker5,Red);
        marker5++;
        delay(150);
        player = 2;
      }        
    }
    if (initial.x == 6)    //coloum 1
    {
      if (marker6<7)
      {
        DrawPx(initial.x, marker6,Red);
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
    if (initial.x == 1)    //coloum 1
    {
      if (marker1<7)
      {
        DrawPx(initial.x, marker1,Blue);
        marker1++;
        delay(150);
        player = 1;
      }        
    }
     if (initial.x == 2)    //coloum 1
    {
      if (marker2<7)
      {
        DrawPx(initial.x, marker2,Blue);
        marker2++;
        delay(150);
        player = 1;
      }        
    }
    if (initial.x == 3)    //coloum 1
    {
      if (marker3<7)
      {
        DrawPx(initial.x, marker3,Blue);
        marker3++;
        delay(150);
        player = 1;
      }        
    }
    if (initial.x == 4)    //coloum 1
    {
      if (marker5<7)
      {
        DrawPx(initial.x, marker4,Blue);
        marker4++;
        delay(150);
        player = 1;
      }        
    }
    if (initial.x == 5)    //coloum 1
    {
      if (marker5<7)
      {
        DrawPx(initial.x, marker5,Blue);
        marker5++;
        delay(150);
        player = 1;
      }        
    }
    if (initial.x == 6)    //coloum 1
    {
      if (marker6<7)
      {
        DrawPx(initial.x, marker6,Blue);
        marker6++;
        delay(150);
        player = 1;
      }        
    }
  }
}
