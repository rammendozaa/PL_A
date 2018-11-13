fun map(f, xs) =
    case xs of
	[] => []
      | x :: xs'  => (f x) :: map(f, xs')
(* Applies f to every element of the list xs *)

				
val x1 = map((fn x => x + 1), [1,5,9,20])
val x2 = map(hd, [[1,2,3],[3,2,1],[2,1,3],[1,2,3]])

fun filter(f, xs) =
    case xs of
	[] => []
      | x :: xs'  => if (f x) then
			 x :: filter(f, xs')
		     else
			 filter(f, xs')

fun is_even v =
    (v mod 2 = 0)

fun all_even xs = filter(is_even, xs)

fun all_even_second xs = filter((fn (_,v) => is_even v), xs)
