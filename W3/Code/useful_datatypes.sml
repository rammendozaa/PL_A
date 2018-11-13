datatype exp =
	 Constant of int
	 | Negate of exp
	 | Add of exp * exp
	 | Multiply of exp * exp

fun old_eval e =
    case e of
       Constant i => i
      | Negate e2 => ~(old_eval e2)
      | Add(e1, e2) => (old_eval e1) + (old_eval e2)
      | Multiply (e1, e2) => (old_eval e1) * (old_eval e2)

fun eval (Constant i) = i
  | eval (Negate e2) = ~ (eval e2)
  | eval (Add (e1, e2)) = (eval e1) + (eval e2)
  | eval (Multiply (e1, e2))  = (eval e1) * (eval e2)

fun append ([],ys) = ys
  | append (x::xs' , ys) = x :: append(xs', ys)
						     
				 
(* Good but don't need all of it 
fun max_constant e=
    let
	fun max_two(e1, e2)=
	    let
		val max_1 = max_constant e1
		val max_2 = max_constant e2
	    in
		Int.max(max_1 , max_2)
	    end
    in
	case e of
	    Constant i => i
	  | Negate e2 => (max_constant e2)
	  | Add(e1 , e2) => max_two(e1 , e2)
	  | Multiply(e1 , e2) => max_two(e1 , e2) 
    end
 *)
fun max_constant e =
    case e of
	Constant i => i
      | Negate e2 => max_constant e2
      | Add(e1, e2) => Int.max(max_constant e1, max_constant e2)
      | Multiply(e1, e2) => Int.max(max_constant e1, max_constant e2)
				   


val test_exp = Add(Constant 19, Negate(Constant 4))
val nineteen = max_constant(test_exp)
