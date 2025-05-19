#region Teclas
global._cima		 = keyboard_check(ord("W"));
global._cima_press	 = keyboard_check_pressed(ord("W"));
global._baixo		 = keyboard_check(ord("S"));
global._baixo_press	 = keyboard_check_pressed(ord("S"));
global._esq			 = keyboard_check(ord("A"));
global._esq_press	 = keyboard_check_pressed(ord("A"));
global._dire		 = keyboard_check(ord("D"));
global._dire_press	 = keyboard_check_pressed(ord("D"));
global._interate_key = keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_right)
global._atirar		 = keyboard_check(vk_space);
global._pause        = keyboard_check_pressed(vk_escape);
#endregion

if (instance_exists(obj_par_cutscene)){global.parar = true}
	else {global.parar = false}
if (instance_exists(obj_pause))cursor_sprite = spr_cursor