fun compose(f, g) = fn x => f(g x)

(* compose function using compose operator "o" 

f o g 			    

 *)
fun sqrt_of_abs_one i = Math.sqrt (Real.fromInt(abs i))
fun sqrt_of_abs_two i = (Math.sqrt o Real.fromInt o abs) i
val sqrt_of_abs_three = Math.sqrt o Real.fromInt o abs
(* |> !> - helps make the code more readable. From left to right 
"Pipeline operator" 
*)
infix !>
fun x !> f = f x
(* takes i and gets the absolute value of it, then makes it a real
which is what the square root function needs and then passes result
to Math.sqrt 
*)
fun sqrt_of_abs i = i !> abs !> Real.fromInt !> Math.sqrt
		      
fun backup1 (f, g) = fn x => case f x of
				 NONE => g x
			       | SOME y => y 

fun backup2 (f, g) = fn x => f x handle _ => g x
