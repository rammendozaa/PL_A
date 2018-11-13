(*1*)
fun is_older(fd : (int * int * int) , sd : (int * int * int)) =
    if(#1 fd < #1 sd)
    then
	true
    else if(#1 fd = #1 sd)
    then
	if(#2 fd < #2 sd)
	then
	    true
	else if(#2 fd = #2 sd)
	then
	    if(#3 fd < #3 sd)
	    then
		true
	    else
		false
	else
	    false
    else
	false
(*2*)
fun number_in_month( date : (int * int * int) list, m : int) =
    if null date then 0
    else
	if(#2 (hd date) = m)then
	    1 + number_in_month((tl date), m)
	else
	    0 + number_in_month((tl date), m)
(*3*)    
fun number_in_months(dates : (int * int * int) list, months : int list) =
    if null months then 0
    else
	number_in_month(dates, hd months) + number_in_months(dates, tl months)
(*4*)
fun dates_in_month(dates : (int * int * int) list, month : int) =
    if null dates then []
    else
	if (#2 (hd dates) = month) then (hd dates) :: dates_in_month((tl dates) , month)
	else
	    dates_in_month(tl dates, month)
(*5*)
fun dates_in_months(dates : (int * int * int) list, months : int list) =
    if null months then []
    else
	dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)
(*6*)
fun get_nth(valores : string list, pos : int) =
    if pos - 1 = 0 then hd valores
    else
	get_nth(tl valores, pos - 1)
(*7*)
fun date_to_string(date : (int * int * int)) =
    let
	val months = ["January", "February", "March" , "April", "May", "June", "July", "August", "September", "October", "November", "December"]
 	val mes = get_nth(months, #2 date)
    in
	mes ^ " " ^ Int.toString (#3 date) ^ ", " ^ Int.toString(#1 date)
    end

(* 8 *)

fun number_before_reaching_sum(sum : int, values : int list) =
    if(null values) then 0
    else
	let
	    fun find(index : int , valores : int list , suma : int) =
		if(suma <= 0)then index - 1
		else if
		    null valores
		then ~1
		else
		    find(index + 1, tl valores, (suma - hd valores))
	in
	    find(0, values, sum)
	end
	    
	    (*9*)
fun what_month(day : int) =
    let
	val months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
	number_before_reaching_sum(day, months) + 1
    end

(* 10 *)
fun month_range(day1 : int , day2 : int) =
    if day1 > day2 then []
    else if day1 = day2
    then
	what_month(day2):: month_range(day1 + 1 , day2)
    else
	what_month(day1):: month_range(day1 + 1 , day2)

(*11*)
fun oldest(dates : (int * int * int) list) =
    if null dates then NONE
    else
	let
	    fun max_date(dates : (int * int * int) list) =
		if null (tl dates) then hd dates
		else
		    let val max_d = max_date(tl dates)
		    in
			if is_older(hd dates, max_d) then hd dates
			else
			    max_d
		    end
	in
	    SOME(max_date(dates))
	end
	    
(*12*)
fun number_in_months_challenge(dates : (int * int * int) list, months : int list) =
    if null months then 0
    else
	let
	    fun rem(entrada : int list, final : int list) =
		if null entrada then final
		else
		    let
			fun esta(valor : int , prueba : int list) =
			    if (null prueba) then false
			    else
				if(valor = hd prueba) then true
				else
				    esta(valor, tl prueba)		
		    in
			if(esta(hd entrada, final)) then
			    rem(tl entrada, final)
			else
			    rem(tl entrada, hd entrada :: final)
		    end
	in
	    let val mes = rem(months,[])
	    in
		number_in_month(dates, hd mes) + number_in_months(dates, tl mes)
	    end
	end
	    
fun dates_in_months_challenge(dates : (int * int * int) list, months : int list) =
    if null months then []
    else
	let
	    fun flip(que : int list, salida : int list) =
		if null que then salida
		else
		    flip(tl que, hd que :: salida)
	    fun rem(entrada : int list, final : int list) =
		if null entrada then final
		else
		    let
			fun esta(valor : int , prueba : int list) =
			    if (null prueba) then false
			    else
				if(valor = hd prueba) then true
				else
				    esta(valor, tl prueba)		
		    in
			if(esta(hd entrada, final)) then
			    rem(tl entrada, final)
			else
			    rem(tl entrada, hd entrada :: final)
		    end
	in
	    let val mes = flip(rem(months,[]),[])
	    in
		dates_in_month(dates, hd mes) @ dates_in_months(dates, tl mes)
	    end
	end

	    (*13*)
fun reasonable_date(date : (int * int * int)) =
    if (#1 date <= 0) orelse (#2 date > 12 orelse #2 date <= 0) orelse (#3 date > 31 orelse #3 date <= 0) then false
    else
	let fun isleap(fecha : int) =
		if (fecha mod 4 = 0) then
		    if (fecha mod 100 = 0) then
			if (fecha mod 400 = 0) then
			    true
			else
			    false
		    else
			true
		else
		    false
	in
	    if(isleap(#1 date)) andalso (#2 date = 2) andalso (#3 date <= 29) then true
	    else
		let fun get_month_days(ini : int , m : int , meses : int list) =
			if (ini = m) then hd meses
			else
			    get_month_days(ini + 1 , m , tl meses)
		in
		    let
			val mess = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
		    in
			if(#3 date <= get_month_days(1, #2 date , mess)) then true
			else
			    false
		    end
		end
	end
	    
									     
