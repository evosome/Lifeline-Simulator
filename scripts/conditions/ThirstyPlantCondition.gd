extends Condition
class_name ThirstyPlantCondition


func is_passing() -> bool:
	return (Planty
			.get_all_actors()
			.filter(func (a: Plant): return a.is_thirsty())
			.size())
