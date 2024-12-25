//DRAW BACKGROUND
//draw_sprite(spr_bg_name_creator, 0, 0, 0)

draw_set_font(fnt_name_creator)
fontSize = 36;
BUFFER = ceil(fontSize / 2);

#region DRAW CURRENT NAME
startY = 120;
startX = 320;

//Draw the current name
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_yellow)
draw_text(startX, startY, currentName);
draw_set_color(c_white)

#endregion

#region DRAW LETTERS
startY = 200;
startX = 140;
var charCount = 1;

for (var yy = 0; yy <yLetters; yy++){
	for (var xx = 0; xx < xLetters; xx++){
		#region CODE INSIDE FOR LOOP
		
		var letter = a_letters[xx, yy];
			if (showLowerCase) && (charCount <= 26){
				//Get the unicode for the letter and add 32 to it
				uniCode = ord(letter) + 32;
				letter = chr(uniCode);
			}
		
		var drawX = startX + (xx * (fontSize));
		var drawY = startY + (yy * (fontSize + BUFFER));
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(drawX, drawY, letter);
		
		if (xx == gridX && yy = gridY){
		draw_set_color(c_yellow)
		draw_text( drawX, drawY, a_letters[gridX, gridY]);
		draw_set_color(c_white)
		}
		charCount ++;
		
		#endregion
	}
}


#endregion

#region DRAW TEXT CHOOSE A NAME
startY = 40;
startX = 320;

//Draw the current name
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(startX, startY, "Name your character.");

#endregion