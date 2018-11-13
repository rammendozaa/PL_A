(* can have declarations before and/or after *)

val x = 7
(*
works only when y >= 0
*)
fun pow(x : int , y : int) =
    if y = 0
    then 1
    else x * pow(x, y - 1)

fun cube(x : int) =
    (*one way -> x * x * x *)
    pow(x, 3)


val a = 4
val sixtyfour = cube(a)
(* same as
val sixtyfour = cube(4)
*)
val something = pow (2, 4) + cube(3) + pow(2, pow(2,3))
