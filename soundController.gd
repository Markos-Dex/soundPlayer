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
func play(audio:AudioStream,isBgm=false,db=null):
	if isBgm:
		bgmPlayer.stream = audio
		if not db: bgmPlayer.volume_db = 1
		else: bgmPlayer.volume_db = db
		bgmPlayer.play()
		if not bgmPlayer.is_playing():
			print('This test failed. No cake.')
	else:
		var sfxPlayer = sfxPlayerScene.instance()
		sfx.add_child(sfxPlayer)
		sfxPlayer.stream = audio
		if not db:
			sfxPlayer.volume_db = 1
		else:
			sfxPlayer.volume_db = db
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

