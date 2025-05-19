#macro MAINPAUSE 0
gamePause = false;
//pauseSurf = -1;
//pauseSurfBuffer = -1;

//resW = 480;
//resH = 270;

time_held_right = 0;
time_held_left = 0;

//main menu
menu[MAINPAUSE][0] = "Voltar";
menu[MAINPAUSE][1] = "Configurações";
menu[MAINPAUSE][2] = "Sair";


//sub menu configs
menu[SETTINGS][0] = ["+ Tela Cheia +", "windowns_size"];
menu[SETTINGS][1] = ["+ Música +", "music"];
menu[SETTINGS][2] = ["+ Efeitos Sonoros +", "sound"];
menu[SETTINGS][3] = ["+ Screemshake +", "screen_shake"];
menu[SETTINGS][4] = " back ";

index = 0;

sub_menu = 0;

menu_x_pos = room_width *.5;
menu_y_pos = room_height * .5;
click_area_w = 35;

function button(_y, _wl, _wr, _h) constructor {

    y = _y;
    wl = _wl;
    wr = _wr;
    h = _h;
}

var _h = 20;//40

for (var a = 0; a < TOTAL; a++) {
    for (var b = 0; b < array_length(menu[a]); b++) 
    {			
    button_arr[a][b] =  new button(0, room_width / 2, room_width/2, _h);
    }
    
}
