# meta-name: Action
# meta-description: Create an action which can be applied to a target.
class_name MyAwesomeAction
extends Action

var member_var := 0


func execute(targets: Array[Node]) -> void:
	print("My action targets them: %s" % targets)
	print("It does %s something" % member_var)
