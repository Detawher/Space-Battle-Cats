if (global._interate_key)
{
	TransitionStart(rm_title, seq_close, seq_open);
}
if (comecou == true)
{
	if (y <= -400) 
	{
		text_agradecimento = true;
		timer_2--;
		if (timer_2 <= 0)TransitionStart(rm_title, seq_close, seq_open);
		if (alpha <= 1)alpha += 0.01;
	} else {y -= scroll_speed;}
} else
{
	timer_1--;
	if (timer_1 <= 0)comecou = true;
}



