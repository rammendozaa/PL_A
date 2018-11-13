fun n_times(f, n, x) =
    if n = 0 then
	x
    else
	f (n_times(f, n - 1, x))

fun nth_tail(n, xs) = n_times(tl, n, xs)

fun nth_tail(n, xs) = n_times((fn y => tl y), n, xs)
(* this is poor style since it is not necessary to define a funcion
that return the tail because it already exists *)

fun rev xs = List.rev xs

fun rev = fn xs => List.rev xs
			     
fun rev = List.rev
(* best option *)
