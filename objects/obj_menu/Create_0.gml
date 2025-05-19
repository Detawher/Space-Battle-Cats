#macro MAIN 0
#macro SETTINGS 1
#macro TOTAL 2
 
global.dsm_settings = ds_map_create();
#macro set			 global.dsm_settings

ds_map_add(set, "windowns_size", [0, ["Off", "On"]]);
ds_map_add(set, "music", [5, [0, 10]]);
ds_map_add(set, "sound", [5, [0, 10]]);
ds_map_add(set, "screen_shake", [0, ["On", "Off"]]);



time_held_right = 0;
time_held_left = 0;

//main menu
menu[MAIN][0] = "Jogar";
menu[MAIN][1] = "Configurações";
menu[MAIN][2] = "Créditos";
menu[MAIN][3] = "Sair";

//sub menu configs
menu[SETTINGS][0] = ["+ Tela Cheia +", "windowns_size"];
menu[SETTINGS][1] = ["+ Música +", "music"];
menu[SETTINGS][2] = ["+ Efeitos Sonoros +", "sound"];
menu[SETTINGS][3] = ["+ Screemshake +", "screen_shake"];
menu[SETTINGS][4] = " back ";

index = 0;

sub_menu = 0;


menu_x_pos = room_width *.5;
menu_y_pos = room_height * .6;
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
