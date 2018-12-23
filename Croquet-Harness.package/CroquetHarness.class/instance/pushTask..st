accessing
pushTask: newTask

	taskStack ifNil:[taskStack := OrderedCollection new.].
	taskStack add: task.
	task := newTask.