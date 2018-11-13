val x = 1
(* x maps to 1 *)
fun f y = x + y
(* f always adds 1 to y *)
val x = 2
(* x maps to 2 *)
val y = 3
(* y maps to 3 *)
val z = f (x + y)
(* z will have 6 since f is being called with 5, but the function is
defined before when x was 1 *)

