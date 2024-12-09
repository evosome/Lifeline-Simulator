extends Condition
class_name PickPlantNeededCondition


func is_passing() -> bool:
	return (Planty
			.get_all_actors()
			.filter(func (a: Plant): return a.need_pick())
			.size())
