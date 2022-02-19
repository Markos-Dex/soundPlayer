extends Node
#export(AudioStream) var cancionAleatoria
export(PackedScene) var sfxPlayerScene
onready var bgm = $bgm
var bgmPausedTime
onready var sfx = $sfx
export(PackedScene) var bgmPlayerScene
var bgmPlayer = null
func _ready():
	bgmPlayer = $bgm/bgmPlayer
	bgmPlayer.volume_db = 1
func play(audio:AudioStream,isBgm:bool):
	if isBgm:
		bgmPlayer.stream = audio
		bgmPlayer.play()
		if not bgmPlayer.is_playing():
			print('This test failed. No cake.')
	else:
		var sfxPlayer = sfxPlayerScene.instance()
		sfx.add_child(sfxPlayer)
		sfxPlayer.stream = audio
		sfxPlayer.volume_db = 1
		sfxPlayer.play()
func pause():
	var sfxChildren = sfx.get_children()
	for child in sfxChildren:
		child.stream_paused = true
	bgmPlayer.stream_paused = true
func resume():
	var sfxChildren = sfx.get_children()
	for child in sfxChildren:
		child.stream_paused = false
	bgmPlayer.stream_paused = false

