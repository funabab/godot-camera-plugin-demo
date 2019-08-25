extends TextureRect

onready var btn_take_picture := $"../BtnTakePicture";
onready var btn_switch_camera := $"../BtnSwitchCamera";
onready var btn_take_another := $"../BtnTakeAnother";
onready var camera_view = $CameraView;

func _ready():
	btn_take_picture.connect("button_up", self, "_on_btn_take_picture_up");
	btn_switch_camera.connect("button_up", self, "_on_btn_switch_camera_up");
	btn_take_another.connect("button_up", self, "_on_btn_take_another_up");
	camera_view.connect("picture_taken", self, "on_picture_taken");
	pass

func _on_btn_take_picture_up():
	camera_view.take_picture();
	pass

func _on_btn_switch_camera_up():
	camera_view.camera_facing = 0 if camera_view.camera_facing == 1 else 1;
	pass

func _on_btn_take_another_up():
	camera_view.visible = true;
	btn_switch_camera.visible = true;
	btn_take_picture.visible = true;
	btn_take_another.visible = false;
	pass

func on_picture_taken(error, image_texture, extras):
	if error == camera_view.ERROR.NONE:
		texture = image_texture;

		camera_view.visible = false;
		btn_switch_camera.visible = false;
		btn_take_picture.visible = false;
		btn_take_another.visible = true;
	pass
