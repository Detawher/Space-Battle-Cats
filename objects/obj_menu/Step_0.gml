var _up = global._cima_press;
var _down  = global._baixo_press;
var _left = global._esq_press;
var _right = global._dire_press;
var _left_held = global._esq_press;
var _right_held = global._dire_press;
var _select = global._interate_key;
//holding key down
var _repeat_spd = 8;
var _repeat_delay = 25;

    if _right time_held_right = _repeat_delay;

    if time_held_right > 0
    {

        time_held_right--;
        if time_held_right == 0 && _right_held 
        {

            _right = true;
            time_held_right = _repeat_spd;
        }
    }
    
    if _left time_held_left = _repeat_delay;

    if time_held_left > 0 
    {
        time_held_left--;
        if time_held_left == 0 and _left_held 
        {
            _left = true;
            time_held_left = _repeat_spd;
        }
    }


var _move = _down - _up;
var _hmove = _right - _left;
if _move != 0 {
    // move the index
    index += _move;
    //mouse
    scpt_audio_play_sound(snd_select, 8, false); //coloquei este som para testar
    //clamp values
    var _size = array_length(menu[sub_menu]);
    if index < 0 index = _size - 1;  //aquiiii verif
    else if index >= _size index = 0;
}

function  process_menu(_select, _hmove) {
    if _select || (is_array(menu[sub_menu][index]) and (_hmove != 0)){
			scpt_audio_play_sound(snd_select, 8, false);
            switch(sub_menu){
            case MAIN:
                switch(index){
                    
                    case 0:
                    scpt_audio_play_sound(snd_cursor); //adicionar efeitos sonoros
                    //start
                    //room_goto(rm_tutorial_move);
					//TransitionStart(rm_tutorial_move,seq_close,seq_open);
					TransitionStart(rm_tutorial_move,seq_close,seq_open);
					if (!instance_exists(obj_pause))instance_create_depth(0, 0, 0, obj_pause);
                    break;
                    case 1:
                    scpt_audio_play_sound(snd_cursor);
                        //options
                        sub_menu = SETTINGS;
                        index = 0;
                    break;
            
                    case 2:
                    scpt_audio_play_sound(snd_cursor);
                        //credits
                   TransitionStart(rm_credits,seq_close,seq_open);
                    break;
                    case 3:
                        //audio_play_sound(s);
                        //quit
                        game_end();
                    break;
                }
            break;
                case SETTINGS:
                                
                            switch(index){
                                    case 0:
                                        //controla tela cheia
										scpt_audio_play_sound(snd_cursor);
                                        change_menu(_hmove, "windowns_size");
                                        if _hmove {
                                            window_set_fullscreen(true)
                                        }
                                        else {
                                            window_set_fullscreen(false)
                                        }
                                    break;
                                    case 1:
                                        //music
										scpt_audio_play_sound(snd_cursor);
                                        change_menu(_hmove, "music");
                                        //audio_master_gain(global.dsm_settings[? "sound"][0]/10);
                                        global.volMusic = audio_group_set_gain(audiogroup_music, global.dsm_settings[? "music"][0]/10, 0);//lembrar de criar o grupo aqui
                                        //audio_play_sound();
                                    break;
                            
                                    case 2:
                                        //sound
										scpt_audio_play_sound(snd_cursor);
                                        change_menu(_hmove, "sound");
                                        audio_group_set_gain(audiogroup_default, global.dsm_settings[? "sound"][0]/10, 0);
                                        
                                    break;
                                
                                    case 3:
                                    //tremedera aqui
									scpt_audio_play_sound(snd_cursor);
                                    change_menu(_hmove, "screen_shake");
									if (!_hmove)
									{
										if(!instance_exists(obj_screemshake))instance_create_layer(0, 0, "Superior", obj_screemshake);
									} else
									{
										if(instance_exists(obj_screemshake))instance_destroy(obj_screemshake)
									}
                                
                                    break;
                                
                                    case 4:
                                    //back
                                    //audio_play_sound(snd_cursor); //som de retornar
                                    sub_menu = MAIN;
                                    index = 1;
                                    break;
                                }
                                break;
                            }
                    }
                }
                    
                    process_menu(_select, _hmove);
function change_menu(_move, _key) {
///@desc change the ds map key entry bi the move value passed
///@_move  real which way to move the selection
///@_key string ds map key for this selection 
var _map_arr = set[? _key];
var _limits_arr = _map_arr[1];
//audio_play_sound();

    if is_real(_limits_arr[0]){
    
        var _min = _limits_arr[0];
        var _max = _limits_arr[1];
    
    } else {
    
        var _min = 0;
        var _max = array_length(_limits_arr) - 1;
    
    }
    
    _map_arr[@ 0] = clamp(_move + _map_arr[0], _min, _max);


}
