fun nondecreasing xs =
    case xs of
	[] => true
      | _ :: [] => true	 (* you dont need the value, you just need to know that its there *)
      | x :: (y :: xs')  => x <= y andalso nondecreasing (y :: xs') 

datatype sgn = P | N | Z

fun multsgn (x1, x2) =
    let fun sign x = if x = 0 then Z else if x > 0 then P else N
    in
	case (sign x1, sign x2) of
	    (Z, _) => Z
	  | (_, Z) => Z
	  | (P, P) => P
	  | (N, N) => P
			  (* | _ => N *) (* 
Because we know the remaining cases will result in negative
*)
	  | (N, P) => N
	  | (P, N) => N
    end
			  
fun len xs =
    case xs of
	[] => 0
     | _ :: xs' => 1 + len xs'
