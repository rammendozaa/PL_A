fun hd xs =
    case xs of
	[] => raise List.Empty
      | x :: _  => x

exception MyUndesirableCondition
exception MyOtherException of int * int

fun mydiv(x,y) =
    if y = 0
    then
	raise MyUndesirableCondition
    else
	x div y

(* user passes list but also an exception *)		  
fun maxlist(xs, ex) =
    case xs of
	[] => raise ex
      | x :: [] => x
      | x :: xs' => Int.max(x, maxlist(xs', ex))
				  
val w = maxlist([3, 4, 5], MyUndesirableCondition)

(* 
e1 handle exn => e2 
if e1 raises the exception sent exn, then evaluate the whole thing to e2
*)

val x = maxlist([3,4,5], MyUndesirableCondition)
	handle MyUndesirableCondition => 42
(*
val y = maxlist([],MyUndesirableCondition)
*)
val z = maxlist([],MyUndesirableCondition)
	handle MyUndesirableCondition => 42
	       
