fun filter (f, xs) =
    case xs of
	[] => []
      | x :: xs' => if f x then x :: filter(f, xs') else filter(f, xs')

fun allShorterThan1 (xs, s) =
    filter(fn x => String.size x < (print "!" ; String.size s), xs)

fun allShorterThan2 (xs, s) =
    let
	val tama = (print "!" ; String.size s)
    in
	filter(fn x => String.size x < tama, xs)
    end

val _ = print "\nallShorterThan1: "
val x1 = allShorterThan1(["1", "333", "22","4444"], "xxx")
val _ = print "\nallShorterThan2: "
val x2 = allShorterThan2(["1", "333", "22","4444"], "xxx")
	
