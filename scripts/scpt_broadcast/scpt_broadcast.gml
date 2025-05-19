// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function sprite_broadcast(_message_type, _callback){
	
    if(event_data[? "event_type"] == "sprite event") {
        if(event_data[? "message"] == _message_type) {
            _callback();
        }
    }
}