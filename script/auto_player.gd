extends AudioStreamPlayer

const level_music = preload("res://asset/sfx/main_song.mp3")
const in_game_music = preload("res://asset/sfx/game_bg.mp3")

func _play_music(music: AudioStream, volume= -15.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()
	
func play_music_level():
	_play_music(level_music)

func play_in_game_bg():
	_play_music(in_game_music)

func play_FX(stream:AudioStream, volume = -15.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream= stream
	fx_player.name = "FX_PLAYER"
	fx_player.volume_db = volume
	add_child(fx_player)
	fx_player.play()
	
	await fx_player.finished
	
	fx_player.queue_free()
