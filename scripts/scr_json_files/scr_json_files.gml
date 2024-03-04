function json_save_file(fileName, value){
	var buffer = buffer_create(1, buffer_grow, 1);
	buffer_write(buffer, buffer_string, json_stringify(value));
	buffer_save(buffer, fileName);
	buffer_delete(buffer);
}

function json_load_file(fileName){
	try{
		var buffer = buffer_load(fileName)
		var buffString = buffer_read(buffer, buffer_string);
		json = json_parse(buffString);
		buffer_delete(buffer);
		return json;
	} catch(ex){
		show_message(ex);
		return undefined;
	}
}