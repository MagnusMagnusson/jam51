van = ModelManager().get("van");
z = 20;
debugCameraEnabled = false;

xto = 0;
zto = 0;
yto = 100;
treexx = 0;
trees = [];
houses = [];

for(var i = 0; i < 25; i++){
	trees[i] = ModelManager().get("tree_"+ string(choose(1,2,3)));
}

for(var i = 0; i < 10; i++){
	houses[i] = ModelManager().get("house_"+ string(choose(2,3)));
}