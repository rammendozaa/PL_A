datatype suit = Club | Diamond | Spade | Heart
datatype rank = Jack | Queen | King | Ace | Num of int
datatype id = StudentNum of int
	    | Name of string * string option * string

datatype exp = Constant of int
	     | Negate of exp
	     | Add of exp * exp
	     | Multiply of exp * exp

fun eval e =
    case e of
	Constant i => i
      | Negate e2 => ~(eval e2)
      | Add(e1, e2) => (eval e1) + (eval e2)
      | Multiply(e1, e2) => (eval e1) * (eval e2)

fun number_of_adds e =
    case e of
	Constant i => 0
      | Negate e2 => ~ (number_of_adds e2)
      | Add(e1 , e2) => 1 + (number_of_adds e1) + (number_of_adds e2) 
      | Multiply(e1 , e2) => (number_of_adds e1) + (number_of_adds e2)

val example_exp : exp = Add(Constant (12 + 7) , Negate (Constant 4))
val example_ans : int = eval example_exp
val another = number_of_adds(Multiply(example_exp, example_exp))
			    
