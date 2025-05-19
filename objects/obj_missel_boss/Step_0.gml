/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
timer++;
if(timer >= 50)
{
	instance_create_depth(x,y,depth,obj_missel_complemento_boss);
	instance_destroy();
}