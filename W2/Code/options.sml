fun better_max (xs : int list) =
    if null xs then NONE
    else
	let val max = better_max(tl xs)
	in
	    if isSome max andalso valOf max > hd xs then max
	    else SOME (hd xs)
	end
	    
fun best_max( xs : int list) =
    if null xs then NONE
    else let
	fun max_notempty(xs : int list) =
	    if null (tl xs) then hd xs
	    else let val max = max_notempty(tl xs)
		 in
		     if hd xs > max then hd xs
		     else max
		 end
    in
	SOME (max_notempty(xs))
    end
	     
