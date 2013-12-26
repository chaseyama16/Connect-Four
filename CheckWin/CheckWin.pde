#include <MeggyJrSimple.h>

struct Point
{
  int x;
  int y;
};

Point piece = {4,3};

void setup()
{
  MeggyJrSimpleSetup();
}

void loop()
{
  DrawPx(0,0,Blue);
  DrawPx(1,0,Red);
  DrawPx(2,0,Red);
  DrawPx(3,0,Red);
  DrawPx(4,0,Blue);
  DrawPx(1,1,Blue);
  DrawPx(2,1,Red);
  DrawPx(3,1,Blue);
  DrawPx(4,1,Blue);
  DrawPx(2,2,Blue);
  DrawPx(2,3,Blue);
  DrawPx(3,2,Red);
  DrawPx(3,3,Red);
  DrawPx(4,2,Red);
  chooseplayer();
  drawpiece();
  movepiece();
  placepiece();
  checkwinRed();
  DisplaySlate();
  CheckButtonsPress();
  if (Button_A)
  {
    DrawPx(piece.x,piece.y,Red);
  }
}

void chooseplayer()
{
}

void drawpiece()
{
}

void movepiece()
{
}

void placepiece()
{
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
    if (ReadPx(piece.x+1,piece.y) == Blue)    //Check right
    {
      if (ReadPx(piece.x+2,piece.y) == Blue)
      {
        if (ReadPx(piece.x+3,piece.y) == Blue)
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

void checkwinRed()
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
    if (ReadPx(piece.x+1,piece.y) == Blue)    //Check right
    {
      if (ReadPx(piece.x+2,piece.y) == Blue)
      {
        if (ReadPx(piece.x+3,piece.y) == Blue)
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







