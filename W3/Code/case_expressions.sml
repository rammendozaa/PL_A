datatype mytype = TwoInts of int * int
		| Str of string
       | Pizza

(* x has to be of type mytype, so it has
to be Pizza, or Str, or TwoInts *)
fun f (x : mytype) =
    case x of
	Pizza => 3
      | Str s => String.size s
      | TwoInts(i1,i2) => i1 + i2 
