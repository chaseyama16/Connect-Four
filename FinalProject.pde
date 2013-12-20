#include <MeggyJrSimple.h>    // Required code, line 1 of 2.

struct Point
{
  int x;
  int y;
};

Point piece = {3,7};
int player = 1;
Point dropped = {3,0};

void setup()                    // run once, when the sketch starts
{
  MeggyJrSimpleSetup();      // Required code, line 2 of 2.
}

void loop()                     // run over and over again
{
  if (player == 1)
  {
    player1();
  }
  if (player == 2)
  {
    player2();
  }
  DisplaySlate();
  checkwinRed();
  checkwinBlue();
}

void player1()
{
  DrawPx(piece.x, piece.y, Red);
  CheckButtonsPress();
  if (Button_Left)
  {
    DrawPx(piece.x, piece.y, 0);
    piece.x--;
  }
  if (Button_Right)
  {
    DrawPx(piece.x, piece.y, 0);
    piece.x++;
  }
  if (Button_A)
  {
   DrawPx(dropped.x,dropped.y,Red);
   player = 2;
  }
  if (Button_B)
  {
    DrawPx(0,0,Red);
  }
  if (piece.x>7)
  {
    piece.x = 7;
  }
  if (piece.x<0)
  {
    piece.x = 0;
  }
}
 
void player2()
{
  DrawPx(piece.x, piece.y, Blue);
  CheckButtonsPress();
  if (Button_Left)
  {
    DrawPx(piece.x, piece.y, 0);
    piece.x--;
  }
  if (Button_Right)
  {
    DrawPx(piece.x, piece.y, 0);
    piece.x++;
  }
  if (Button_A)
  {
    DrawPx(piece.x,dropped.y, Blue);
    player = 1;
  }
  if (piece.x>7)
  {
    piece.x = 7;
  }
  if (piece.x<0)
  {
    piece.x = 0;
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
          for (int i = 0; i<8; i++)
          {
            DrawPx(i,7,Green);
          }
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y) == Red)    //Check right
    {
      if (ReadPx(piece.x+2,piece.y) == Red)
      {
        if (ReadPx(piece.x+3,piece.y) == Red)
        {
          for (int i = 0; i<8; i++)
          {
            DrawPx(i,7,Green);
          }
        }
      }
    }
    if (ReadPx(piece.x,piece.y-1) == Red)    //Check down
    {
      if (ReadPx(piece.x,piece.y-2) == Red)
      {
        if (ReadPx(piece.x,piece.y-3) == Red)
        {
          for (int i = 0; i<8; i++)
          {
            DrawPx(i,7,Green);
          }
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y-1) == Red)    //Check southwest
    {
      if (ReadPx(piece.x-2,piece.y-2) == Red)
      {
        if (ReadPx(piece.x-3,piece.y-3) == Red)
        {
          for (int i = 0; i<8; i++)
          {
            DrawPx(i,7,Green);
          }
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y-1) == Red)    //Checksoutheast
    {
      if (ReadPx(piece.x+2,piece.y-2) == Red)
      {
        if (ReadPx(piece.x+3,piece.y-3) == Red)
        {
          for (int i = 0; i<8; i++)
          {
            DrawPx(i,7,Green);
          }
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y+1) == Red)    //Check northwest
    {
      if (ReadPx(piece.x-2,piece.y+2) == Red)
      {
        if (ReadPx(piece.x-3,piece.y+3) == Red)
        {
          for (int i = 0; i<8; i++)
          {
            DrawPx(i,7,Green);
          }
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y+1) == Red)    //CheckNortheast
    {
      if (ReadPx(piece.x+2,piece.y+2) == Red)
      {
        if (ReadPx(piece.x+3,piece.y+3) == Red)
        {
          for (int i = 0; i<8; i++)
          {
            DrawPx(i,7,Green);
          }
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
          for (int i = 0; i<8; i++)
          {
            DrawPx(i,7,Green);
          }
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y) == Red)    //Check right
    {
      if (ReadPx(piece.x+2,piece.y) == Red)
      {
        if (ReadPx(piece.x+3,piece.y) == Red)
        {
          for (int i = 0; i<8; i++)
          {
            DrawPx(i,7,Green);
          }
        }
      }
    }
    if (ReadPx(piece.x,piece.y-1) == Blue)    //Check down
    {
      if (ReadPx(piece.x,piece.y-2) == Blue)
      {
        if (ReadPx(piece.x,piece.y-3) == Blue)
        {
          for (int i = 0; i<8; i++)
          {
            DrawPx(i,7,Green);
          }
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y-1) == Blue)    //Check southwest
    {
      if (ReadPx(piece.x-2,piece.y-2) == Blue)
      {
        if (ReadPx(piece.x-3,piece.y-3) == Blue)
        {
          for (int i = 0; i<8; i++)
          {
            DrawPx(i,7,Green);
          }
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y-1) == Blue)    //Checksoutheast
    {
      if (ReadPx(piece.x+2,piece.y-2) == Blue)
      {
        if (ReadPx(piece.x+3,piece.y-3) == Blue)
        {
          for (int i = 0; i<8; i++)
          {
            DrawPx(i,7,Green);
          }
        }
      }
    }
    if (ReadPx(piece.x-1,piece.y+1) == Blue)    //Check northwest
    {
      if (ReadPx(piece.x-2,piece.y+2) == Blue)
      {
        if (ReadPx(piece.x-3,piece.y+3) == Blue)
        {
          for (int i = 0; i<8; i++)
          {
            DrawPx(i,7,Green);
          }
        }
      }
    }
    if (ReadPx(piece.x+1,piece.y+1) == Blue)    //CheckNortheast
    {
      if (ReadPx(piece.x+2,piece.y+2) == Blue)
      {
        if (ReadPx(piece.x+3,piece.y+3) == Blue)
        {
          for (int i = 0; i<8; i++)
          {
            DrawPx(i,7,Green);
          }
        }
      }
    }
  }
}

