//main game screen //<>//

void game() {
  background(black);
  controlButtons();
  gameText();
  
  //time out lead to death
  if (choice ==0 && count > 180) mode = END;
}

void gameClick() {
  if (rectPressed(width*0.3, 500, 180, 60)) choice = 1;
  if (rectPressed(width*0.7, 500, 180, 60)) choice = -1;

  //logic
  if (choice == 1) { 
    if (match) {
      score ++;
      count = 0;
      choice = 0;
    } else {
      mode = END;
    }
  } else if (choice == -1) {
    if (match) mode = END;
    else {
      count = 0;
      choice = 0;
    }
  }
}
//custom functions -------------------------------------

void controlButtons() {
  rectButton(width*0.3, 500, 180, 60, green, black);
  rectButton(width*0.7, 500, 180, 60, red, black);

  fill(white); //display button text
  textSize(32);
  text("OUI", width*0.3, 500);
  text("NON", width*0.7, 500);
}

void gameText() {
  textSize(1 + count/2);

  //determine spin time, switching word
  if (count == 1) determiningLogic();
  count++;

  //color filled
  fill(colorD);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(frameCount%90 * 4));
  text(textD, 0, 0);
  popMatrix();
}

void determiningLogic () {
  int order = (int) random(0, 6); //used to determine match or not
  textD = gText[order];
  //determine whether the color text will match
  if (random(-1, 1) >= 0) match = true;
  else match = false;
  //determine color base on match status
  if (match) colorD = gColors[order];
  else {
    while (true) {
      colorD = gColors[(int) random(0, 6)];
      if (colorD != gColors[order]) break;
    }
  }
}
