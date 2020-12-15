/// @description chance(percent)
/// @param percent
function chance(argument0) {
 
	// Returns true or false depending on RNG
	// ex:
	//      chance(0.7);    -> Returns true 70% of the time
 
	return argument0 > random(1);


}
