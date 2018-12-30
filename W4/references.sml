(* Creates a box to which x points to that has a 42 *)
val x = ref 42

(* Creates another box to which y points to that has a 42 *)
val y = ref 42

(* Z and X now point to the same box *)
val z = x

(* The value of the box that x pointed to now changes to 43 *)
val _ = x := 43

(* Add the values that X and Y were pointing to *)
val w = (!x) + (!y)
