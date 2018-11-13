fun countup (from : int, to : int) =
    if from = to then from :: []
    else from :: countup(from + 1 , to)

fun countdown (from : int, to : int) =
    if from = to then to :: []
    else from :: countdown(from - 1 , to)
			  
fun bad_max (xs : int list) =
    if null xs then 0 (* bad, fix later *)
    else if null (tl xs) then hd xs
    else if hd xs > bad_max(tl xs) then hd xs
    else bad_max(tl xs)

fun good_max (xs : int list) =
    if null xs then 0 (* still bad, still gonna fix later *)
    else if null (tl xs) then hd xs
    else
	let val list_max = good_max(tl xs)
	in
	    if hd xs > list_max
	    then hd xs
	    else list_max
	end
	    
