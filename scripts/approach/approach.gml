/// @description approach(current, target, amount)
/// @function approach
/// @param current
/// @param target
/// @param amount
if (argument0 < argument1)
{
    argument0 += argument2;
    if (argument0 > argument1)
        return argument1;
}
else
{
    argument0 -= argument2;
    if (argument0 < argument1)
        return argument1;
}
return argument0;