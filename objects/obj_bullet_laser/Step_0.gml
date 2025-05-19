
if (!hit) {
  
    var collision = collision_line(x, y, x, y - max_distance, obj_par_inimigo, false, false);
    
    if (collision) {
        collision_height = y - collision.y-20;  
		impact_y = collision.y-20;
		image_yscale = collision_height/7
        hit = true;
    } else {
       
        collision_height = max_distance;
		impact_y = -max_distance;
    }
}

x = obj_player.x;
y = obj_player.y;