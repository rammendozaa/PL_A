(*High-level but not polymorphic *)
fun times_until_zero(f, x) =
    if x = 0 then 0 else 1 + times_until_zero(f,f x)
(* This always has to be an integer since it return a zero, takes a zero and has to return a 0*)


(* Polymorphic but not high-level *)
fun len xs =
    case xs of
	[] => 0
     | _::xs' => 1 + len xs' 
