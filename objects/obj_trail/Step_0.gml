image_alpha -= velocidade_alpha;

if(image_alpha <= 0)
{
	instance_destroy();
}
