fun n_times(f, n, x) =
    if n = 0 then
	x
    else
	f(n_times(f, n - 1, x))

(*
fun triple x = 3 * x
fun triple_n_times (n, x) = n_times(triple, n, x)

*)
	 
(* Bad style but works. Only to show that "triple" is only needed in that specific part of the function *)
(*
fun triple_n_times(n, x) =
    n_times(let fun triple x = 3 * x in triple end ,n, x)
*)
fun triple_n_times (n, x) =
    n _ times(fn x => 3 * x, n, x)
(* 
Anonymous function, fn x => 3 * x, for when you only use the function in one place, in this case, here 
Much better style
*)

(* poor style but does the same as the above *)
val triple_n_times = fn (n , x) => n_times((fn y => 3 * y), n, x)      
