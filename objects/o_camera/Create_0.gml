debugCameraEnabled = false;

follow_object = o_car;
lookatDirection = 0;

skybox = ModelManager().get("skybox");
skybox.texture = sprite_get_texture(spr_skybox,0);

z = 28;

zplane = 5000;
lastDirection = 0;
lastHeading = 0;
audio_listener_orientation(0, 0, 1, 0, -1, 0);