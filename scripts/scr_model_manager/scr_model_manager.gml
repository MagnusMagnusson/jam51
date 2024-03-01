global.__modelManager = undefined;

function ModelManager(){
	if(is_undefined(global.__modelManager)){
		global.__modelManager = new __ModelManager();
	}
	return global.__modelManager;
}

function __ModelManager() constructor {
	models = {};
	
	static get = function(model){
		if(variable_struct_exists(models, model)){
			return models[$ model];
		} else {
			models[$ model] = new Model("assets/models/"+model+".obj", "assets/models/"+model+".mtl");
			return models[$ model];
		}
	}
}