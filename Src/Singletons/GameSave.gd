extends Node

const SAVE_PATH = "user://game_save.save"
var savegame = File.new() #file
var save_data = {}


func _ready():
	init_save_data()
	remember_saved_values()


#Reads the saved file or creates a new one if it don't exist
func init_save_data():
	if savegame.file_exists(SAVE_PATH):
		savegame.open(SAVE_PATH, File.READ)
		save_data = savegame.get_var()
	else:
		savegame.open(SAVE_PATH, File.WRITE)
		savegame.store_var(save_data)
	savegame.close()


func remember_saved_values():
	pass


#Stores the data in save_data into the file for making it persistent
func save():
	update_save_data()
	savegame.open(SAVE_PATH, File.WRITE) #open file to write
	savegame.store_var(save_data) #store the data
	savegame.close() # close the file


func update_save_data():
	pass
