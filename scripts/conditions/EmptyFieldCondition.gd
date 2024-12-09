extends Condition
class_name EmptyFieldCondition


func is_passing() -> bool:
	return (Planty
			.get_all_planties()
			.filter(
				func(p: PlantyPlace): return !p.has_plant()
			)
			.size() > 0
	)
