class_name VectorUtils

static func are_vectors_in_opposite_directions(vector1, vector2):
	return vector1.angle_to(vector2) > PI / 2 # is the angle over 90d in radians
