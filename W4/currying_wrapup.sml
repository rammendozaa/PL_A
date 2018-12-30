(* This takes a curried function and returns a tuple function*)
fun curry f x y = f (x, y)

(* This takes a tuple function and returns a curry function *)
fun uncurry f (x, y) = f x y

(* This takes a curry function and applies the function in another order
fun other_curry f = fn x => fn y => f y x
*)
fun other_curry f x y = f y x



(* examples *)
fun range (i, j) = if i > j then [] else i :: range (i + 1, j)

(*
  Before currying, will not work
val countup = range 1
val xs = countup 7
*)

val countup = curry range 1

val xs = countup 20
