debugCameraEnabled = !debugCameraEnabled;

gpu_set_ztestenable(!debugCameraEnabled);
gpu_set_zwriteenable(!debugCameraEnabled);