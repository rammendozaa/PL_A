(* before currying *)
fun sorted3_tupled(x, y, z) =
    z >= y andalso y >= x

val t1 = sorted3_tupled(7, 9, 11)

(* after currying *)
val sorted3 = fn x => fn y => fn z => z >= y andalso y >= x

(* fun sorted3 x = fn y => fn z ... *)

val t2 = ((sorted3 7) 9) 11

val t3 = sorted3 7 9 11

(* wrong. Wont typecheck.
First function expects a tuple, and second function expects
firstly an int

val wrong1 = sorted3_tupled 7 9 11
val wrong2 = sorted3 (7, 9, 11)

 *)
fun sorted3_nicer x y z = z >= y andalso y >= x

val t4 = sorted3_nicer 7 9 11
val t5 = ((sorted3_nicer 7) 9) 11

fun fold f acc xs =
    case xs of
	[] => acc
     | x :: xs'  => fold f (f(acc, x)) xs'  

fun sum xs = fold (fn (x, y) => x + y) 0 xs
		  
(* Partial Applications *)
		  
val is_nonnegative = sorted3 0 0
(* This returns a funcion that compares to 0 and 0
checking whether it is negative depending on the boolean result		     
 *)

val suma = fold (fn (x, y) => x + y) 0

(* Bad way of doing the above *)		
fun is_nonnegative_inferior x = sorted3 0 0 x
fun suma_inferior xs = fold (fn (x, y) => x + y) 0 xs

fun range i j = if i > j then [] else i :: range (i + 1) j

val countup = range 1
fun countup_inferior x = range 1 x

fun exists predicate xs =
    case xs of
	[] => false
      | x :: xs' => predicate x orelse exists predicate xs'

val no = exists (fn x => x = 7) [1, 2, 4, 3] (* false *)
val hasZero = exists (fn x => x = 0) (* int list -> bool *)
val incrementAll = List.map (fn x => (x + 1))
val noZeroes = List.filter (fn x => x <> 0)
		 
(* This will throw a Warning related to types *)

val pairWithOne = List.map (fn x => (x, 1))

(* Ways to get rid of warning (workarounds) *)			   
fun pairWithOne_one xs = List.map (fn x => (x, 1)) xs

val pairWithOne_two : string list -> (string * int) list = List.map (fn x => (x, 1))

val incrementAndPairWithOne = List.map (fn x => (x + 1, 1))								    
