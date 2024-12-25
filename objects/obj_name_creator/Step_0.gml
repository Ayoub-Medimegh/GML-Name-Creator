#region PLAYER INPUT

if (gamepad_button_check_pressed(0, gp_padl) || keyboard_check_pressed(vk_left))  global.PL = true;
else global.PL = false

if (gamepad_button_check_pressed(0, gp_padr) || keyboard_check_pressed(vk_right))  global.PR = true;
else global.PR = false

if (gamepad_button_check_pressed(0, gp_padu) || keyboard_check_pressed(vk_up)) global.PU = true;
else global.PU = false

if (gamepad_button_check_pressed(0, gp_padd) || keyboard_check_pressed(vk_down)) global.PD = true;
else global.PD = false

if (gamepad_button_check_pressed(0, gp_face1) || keyboard_check_pressed(vk_enter)) global.POK = true;
else global.POK = false

if (gamepad_button_check_pressed(0, gp_face2) || keyboard_check_pressed(vk_backspace)) global.PCAN = true;
else global.PCAN = false

if (gamepad_button_check_pressed(0, gp_select) || keyboard_check_pressed(vk_shift)) global.PSEL = true;
else global.PSEL = false

#endregion

#region MOVE THE CURSOR

if(global.PL){
	if (gridX == 9) && (gridY == 2){
		gridX = 6;
	}
	if (gridX - 1 ) < 0 gridX = (xLetters - 1);
	else gridX --;
}

if(global.PR){
		if (gridX == 5) && (gridY == 2){
		gridX = 8;
		
	}
	if (gridX + 1 ) >=  xLetters gridX = 0;
	else gridX ++;
}

if(global.PU){
	
	if (gridY - 1 ) < 0 gridY = (yLetters - 1);
	else gridY --;
	if (gridX == 6 && gridY == 2) || (gridX == 7 && gridY == 2) || (gridX == 8 && gridY == 2){
		gridY = 1;
	}
}

if(global.PD){
	if (gridY + 1 ) >= yLetters gridY = 0;
	else gridY ++;
	if (gridX == 6 && gridY == 2) || (gridX == 7 && gridY == 2) || (gridX == 8 && gridY == 2){
		gridY = 0;
	}
}

#endregion

#region PRESSED OK

if (global.POK){
	
	var newLetter = a_letters[gridX, gridY];
	
	//Save the name to the hero
	if (newLetter == "OK") {
	charToName.name = currentName;
	global.name = currentName;
	room_goto(name_creator) //You can change the destination room here
	
	
	}
	
	//Check if we're at the max letters for the name or not
	letterCount = string_length(currentName)
	
	//And add a letter to name (check it's not the OK button before adding)
	if(newLetter != "OK") && (letterCount < MAX_LETTERS_IN_NAME){
		
		//CHANGE TO LOWER CASE IF NEEDED
		if (showLowerCase) && (newLetter !=" "){
				uniCode = ord(newLetter) + 32;
				newLetter = chr(uniCode);
			}
		currentName += newLetter
	}
}

#endregion

#region PRESSED CANCEL

if (global.PCAN){
	//Check we have at least 1 letter in the name
	letterCount = string_length(currentName);
			
			//If we have at least 1, delete it:
			if (letterCount >= 1) currentName = string_delete(currentName, letterCount, 1);
}

#endregion

#region PRESSED SELECT

if (global.PSEL){
	
}

#endregion
