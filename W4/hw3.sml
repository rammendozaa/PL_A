(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let
	val r = g f1 f2
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

(* 1 *)
fun only_capitals xs = List.filter (fn s => Char.isUpper(String.sub(s, 0))) xs

(* 2 *)

fun longest_string1 xs =
		List.foldl (fn (acc,s) => if String.size s >= String.size acc then s else acc) "" xs

(* 3 *)
fun longest_string2 xs =
		List.foldl (fn (acc,s) => if String.size s > String.size acc then s else acc) "" xs

(* 4 *)
fun longest_string3 xs =
		List.foldl (fn (acc,s) => if String.size s >= String.size acc then s else acc) "" xs

fun longest_string4 xs =
		List.foldl (fn (acc,s) => if String.size s > String.size acc then s else acc) "" xs

(* wrong
fun longest_string_helper (fn (x,y) => if (x > y) then true else false) =
	longest_string3
*)
