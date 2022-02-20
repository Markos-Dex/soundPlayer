# This is a music player for any Godot project.
# Setup:

# In your project, copy root folder (soundPlayer)
# AutoLoad -> soundController.tscn and activate it

# Use example:
	var mainTheme = load('res://Assets/Music/mainTheme.ogg)
	SoundController.play(mainTheme,true,20)
# First parameter is AudioStream.
# 2nd is boolean. Not required. If true, sound is BGM (Thereby only 1 of these can be played 
# simultaneously, if playing it just stops and plays the new one)
# 3rd is db. Default = 1
