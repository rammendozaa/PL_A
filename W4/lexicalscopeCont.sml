(* first example *)
val x = 1 (* irrelevant *)
fun f y =
    let
	val x = y + 1
    in
	fn z => x + y + z (* returs the function where z is the parameter and it is being added to y and x that have already been defined inside the function f*)
    end

val x = 3 (* irrelevant *)
val g = f 4 (* returns a function that adds 9 to the argument. This is because x is redefined inside function f *)
val y = 5 (* irrelevant *)
val z = g 6 (* returns 15 *) 
(* the values are irrelevant because they're being "redefined" inside the
functions that are being called *)
	  
(* second example *)
fun f g =
   (* let
	val x = 3 (* irrelevant because it is never used *)
    in *)
    g 2
      (* end *)
      (* these lines of code are not needed since val x = 3 is not used in the rest of the function *)

val x = 4
fun h y = x + y (* in this environment x is 4 *)
val z = f h (* this will return 6 *)


	  (* Interesting example *)
fun filter (f, xs) =
    case xs of
	[] => []
      | x :: xs' => if f x then x :: filter(f, xs') else filter(f, xs')

fun greaterThanX x = fn y => y > x
fun noNegatives xs = filter(greaterThanX ~1, xs)
fun allGreater (xs,n) = filter((fn x => x > n), xs) 
