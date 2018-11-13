(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2
(*

no null, hd, tl, isSome, valOf

*)

(* put your solutions for problem 1 here *)

(* a *)

fun all_except_option(s : string, sL : string list) =
    let fun concat(elquebuscas : string, auxList : string list, entradas : string list, esta : int) =
	    case entradas of
		[] => if esta = 0 then NONE else SOME(auxList)
	      | x :: xs' => if same_string(elquebuscas, x) then concat(elquebuscas, auxList, xs', 1) else concat(elquebuscas,auxList @ [x] , xs', esta)
    in
	concat(s, [], sL, 0)
    end

(* b *)
fun get_substitutions1(sL : string list list , s : string) =
    case sL of
	[] => []
      | ([]) :: ys => get_substitutions1(ys, s)
      | (x :: xs') :: ys => let val sino = all_except_option(s, x :: xs')
			    in
				case sino of
				    NONE => get_substitutions1(ys, s)
				  | SOME str => str @ get_substitutions1(ys, s)
			    end

(* c *)

fun get_substitutions2(sL : string list list , s : string) =
    let fun concat(esteno : string, cadFin : string list, superCad : string list list) =
	    case superCad of
		[] => cadFin
	      | ([]) :: ys => concat(esteno, cadFin, ys)
	      | (x :: xs') :: ys => let val sino = all_except_option(esteno, x::xs')
				   in
				       case sino of
					   NONE => concat(esteno, cadFin, ys)
					 | SOME s => concat(esteno, cadFin @ s, ys)
				   end
    in
	concat(s, [], sL)
    end

(* d *)
fun similar_names(sL : string list list, names : {first : string, middle : string, last : string}) =
    let fun concat(auxList : {first : string, middle : string, last : string} list, listNombres : string list, midName : string, lastName : string) =
	    case listNombres of
		[] => auxList
	      | x :: xs' => concat(auxList @ [{first = x, middle = midName, last = lastName}], xs', midName, lastName)
    in
	case names of
	    {first = x , middle = y, last = z} => let val listNames = get_substitutions2(sL,x)
							 in
							     concat({first = x, middle = y, last = z} :: [], listNames, y, z)
							 end
    end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

	      (* put your solutions for problem 2 here *)
	      (* a *)
fun card_color(carta : card) =
    case carta of
	(Clubs , _) => Black
      | (Spades , _) => Black
      | _ => Red

		 (* b *)
fun card_value(carta : card) =
    case carta of
	(_ , Ace) => 11
      | (_ , Num i) => i
      | _ => 10

		 (* c *)
fun remove_card(cs : card list, c : card, exn) =
    let fun concatC(cBuscada : card, auxList : card list, entrada : card list, esta :int) =
	    case entrada of
		[] => if esta = 0 then raise exn else auxList
	      | x :: xs' => if (x = cBuscada andalso esta = 0) then concatC(cBuscada, auxList, xs', 1) else concatC(cBuscada, x :: auxList, xs', esta)
    in
	concatC(c, [], cs, 0)
    end

	(* d *)
fun all_same_color(cs : card list) =
    let fun recorrido(cardList : card list, color_bus : color , mismo_color : int) =
	    case cardList of
		[] => if mismo_color = 0 then false else true
	      | x :: xs' => if (card_color(x) = color_bus) then recorrido(xs', color_bus, 1) else false
    in
	case cs of
	    [] => true
	  | x :: xs' => let val color_ori = card_color(x)
			in
			    recorrido(xs', color_ori, 1)
			end
    end

	(* e *)
fun sum_cards(cs : card list) =
    let fun suma_total(cartas : card list, suma : int) =
	    case cartas of
		[] =>  suma
	      | x :: xs' => suma_total(xs', suma + card_value(x))
    in
	suma_total(cs, 0)
    end

	(* f *)
fun score(held : card list, goal : int) =
    let val mismo_o_no = all_same_color(held)
	val sumaTotal = sum_cards(held)
    in
	if(mismo_o_no) then
	    if(sumaTotal > goal) then
		(3 * (sumaTotal - goal)) div 2
	    else
		(goal - sumaTotal) div 2
	else
	    if(sumaTotal > goal) then
		3 * (sumaTotal - goal)
	    else
		(goal - sumaTotal)
    end

	(* g *)
fun officiate(deck : card list, whatDo : move list, goal : int) =
    let fun movimientos(held : card list, sacar : card list, queHace : move list, meta : int) =
	    case queHace of
		[] => score(held, meta)
	      | x::xs' => (case x of
			       Draw => (case sacar of
					    [] => score(held, meta)
					  | y :: ys' => let val suma = sum_cards(y::held)
							in
							    if suma > meta then
								score(y::held, meta)
							    else
								movimientos(y::held, ys', xs', meta)
							end)
			      |Discard C => (case held of
					       [] => raise IllegalMove
					     | z :: zs' => let val sinEsa = remove_card(held, C, IllegalMove)
							   in
							       movimientos(sinEsa, sacar, xs', meta)
							   end))
    in
	movimientos([], deck, whatDo, goal)
    end

	(* challenge *)
fun numberAces(cartas : card list) =
    case cartas of
	[] => 0
      | x :: xs' => case x of
			(_, Ace) => 1 + numberAces(xs')
		      | _ => numberAces(xs')

fun score_challenge(held : card list, goal : int) =
    let val mismo_o_no = all_same_color(held)
	val sumaTotalCA = sum_cards(held)
	val sumaTotalSA = (sum_cards(held) - (numberAces(held) * 10))
    in
	if(mismo_o_no) then
	    if(((3 * (sumaTotalCA - goal)) div 2) < ((goal - sumaTotalSA) div 2)) then (3 * (sumaTotalCA - goal) div 2) else ((goal - sumaTotalSA) div 2)
	else
	    if((3 * (sumaTotalCA - goal)) < (goal - sumaTotalSA)) then 3 * (sumaTotalCA - goal) else (goal - sumaTotalSA)
    end

fun officiate_challenge(deck : card list, whatDo : move list, goal : int) =
    let fun movimientos(held : card list, sacar : card list, queHace : move list, meta : int) =
	    case queHace of
		[] => score_challenge(held, meta)
	      | x::xs' => (case x of
			       Draw => (case sacar of
					    [] => score_challenge(held, meta)
					  | y :: ys' => let val suma = (sum_cards(y::held) - (numberAces(y::held) * 10))
							in
							    if suma > meta then
								score_challenge(y::held, meta)
							    else
								movimientos(y::held, ys', xs', meta)
							end)
			      |Discard C => (case held of
					       [] => raise IllegalMove
					     | z :: zs' => let val sinEsa = remove_card(held, C, IllegalMove)
							   in
							       movimientos(sinEsa, sacar, xs', meta)
							   end))
    in
	movimientos([], deck, whatDo, goal)
    end
(*
fun careful_player(cartas : card list, goal : int) =
    let fun movements(movi : move list, held : card list,  deck : card list, meta : int) =
	    case deck of
		[] => if (sum_cards(held) < meta - 10) then Draw :: movi else movi
	      | x :: xs' => case held of
				[] =>
			      | y :: ys =>
    in
	movements([], [], cartas, goal)
    end

*)
