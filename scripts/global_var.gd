extends Node

var miniState = false
var chalkState = false
var noteState = false

var buttonMove = false

var homePos = Vector2() #position for MiniTuber when not active


var transBG = PackedVector2Array([Vector2(-50,-50), Vector2(-50,1130), Vector2(1970,1130), Vector2(1970,-50)])
var menuArray = PackedVector2Array([])
var bookArray = PackedVector2Array([])

#var menubookArray = menuArray.append_array(PackedVector2Array(bookArray))
