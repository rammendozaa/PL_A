exception ListLengthMismatch

fun old_zip(l1, l2, l3)=
    if null l1 andalso null l2 andalso null l3 then []
    else
	if null l1 orelse null l2 orelse null l3
	then
	    raise ListLengthMismatch
	else
	    (hd l1, hd l2, hd l3) :: old_zip(tl l1, tl l2, tl l3)

fun shallow_zip(l1, l2, l3) =
    case l1 of
	[] =>
	(case l2 of
	     [] => (case l3 of
		       [] => []
		     | _ => raise ListLengthMismatch)
	    | _ => raise ListLengthMismatch) 
      | hd1 :: tl1 =>
	(case l2 of
	     [] => raise ListLengthMismatch
	   | hd2 :: tl2 =>
	     (case l3 of
		  [] => raise ListLengthMismatch
		| hd3 :: tl3 =>
		  (hd1, hd2, hd3) :: shallow_zip(tl1, tl2, tl3)))

fun zip list_triple =
    case list_triple of
	([],[],[]) => []
      | (a::tl1, b::tl2, c::tl3) => (a,b,c) :: zip(tl1, tl2, tl3)
      | _ => raise ListLengthMismatch

fun unzip list_triple =
    case list_triple of
	[] => ([],[],[])
      | (a,b,c) :: tl => let val (l1,l2,l3) = unzip tl
			 in
			     (a::l1, b::l2, c::l3)
			 end
			     
