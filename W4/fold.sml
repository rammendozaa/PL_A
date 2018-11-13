fun fold(f, acc, xs) =
    case xs of
	[] => acc
     | x :: xs' => fold(f, f(acc, x), xs') 
(* this is a left implementation, can be written from the right if necessary *)
fun f1 xs = fold ((fn (x,y) => x + y), 0, xs)
(* adds all the elements on the list *)
fun f2 xs = fold ((fn (x,y) => x andalso y >= 0), true, xs)
(* checks if all values in the list are non-negative *)
fun f3 (xs, lo, hi) =
    fold ((fn (x, y) => x + (if y >= lo andalso y <= hi then 1 else 0)), 0, xs)
(* counts the numbers that are in the range of lo and hi *)
fun f4 (xs, s) =
    let
	val i = String.size s
    in
	fold ((fn (x,y) => x andalso String.size y < i), true, xs)
    end
(* checks if all the string in the list are smaller than a  string s *) 
fun f5 (g, xs) = fold((fn (x, y) => x andalso g y), true, xs)
		     (* receives a function and a list and returns if the elements of the list are true for g *)

fun f4again (xs, s) =
    let
	val i = String.size s
    in
	f5(fn y => String.size y < i, xs)
    end
(* replaces the fold in the original f4 function *)
