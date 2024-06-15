extends Node

var fullClickState = false # ??

var miniState = false
var chalkState = false
var noteState = false

var buttonMove = false

var homePos = Vector2() #position for MiniTuber when not active

#var transBG = PackedVector2Array([Vector2(0,0), Vector2(0,1080), Vector2(1920,1080), Vector2(1920,0)])
var transBG = PackedVector2Array([Vector2(-50,-50), Vector2(-50,1130), Vector2(1970,1130), Vector2(1970,-50)])
var buttonMenu = PackedVector2Array([])
