if (distance_to_object(obj_player) <= 5)
{
instance_create_layer(x, y, "Superior", obj_cutscene)
instance_destroy();
}