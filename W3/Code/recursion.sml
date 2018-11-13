fun fact n =
    if n = 0
    then
	1
    else
	n * fact(n - 1)
(* tail recursion *)
fun factorial n =
    let fun aux(n, accu) =
	    if n = 0
	    then
		accu
	    else
		aux(n - 1, accu * n)
    in
	aux(n, 1)
    end

fun sumof(xs)=
    case xs of
	[] => 0
      | x :: xs' => x + sumof(xs')
(* tail recursion *)
fun sumlist(xs) =
    let fun aux(xs, acc) =
	    case xs of
		[] => acc
	      | x :: xs' => aux(xs', acc + x) 
    in
	aux(xs, 0)
    end

fun rev(xs) =
    case xs of
	[] => []
      | x :: xs' => (rev xs') @ [x]
(* tail recursion *)
fun reverse(xs) =
    let fun aux(xs, acc) =
	    case xs of
		[] => acc
	      | x :: xs' => aux(xs', x::acc) 
    in
	aux(xs, [])
    end
	
	
