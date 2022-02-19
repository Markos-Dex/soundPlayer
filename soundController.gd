extends Node
#export(AudioStream) var cancionAleatoria
export(PackedScene) var sfxPlayerScene
onready var bgm = $bgm
var bgmPausedTime
onready var sfx = $sfx
var bgmPlayer = null

func play(audio:AudioStream,isBgm:bool,selected_db=null):
	if isBgm:
		if bgmPlayer.is_playing():
			bgmPlayer.fadeOut()
			bgmPlayer.stream = audio
			bgmPlayer.play()
			bgmPlayer.fadeIn()
		bgmPlayer.stream = audio
		if not selected_db:
			bgmPlayer.volume_db = 1
		else:
			bgmPlayer.volume_db = selected_db
		bgmPlayer.play()
		if not bgmPlayer.is_playing():
			print('This test failed. No cake.')
	else:
		var sfxPlayer = sfxPlayerScene.instance()
		sfx.add_child(sfxPlayer)
		sfxPlayer.stream = audio
		if not selected_db:
			sfxPlayer.volume_db = 1
		else:
			sfxPlayer.volume_db = selected_db
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
func getBgmPlayer():
	return self.bgm.get_children()[0]
