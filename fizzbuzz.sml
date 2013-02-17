fun general_fizzbuzz a b x = 
    case (x mod a = 0, x mod b = 0) of
	(true , true ) => "FizzBuzz"
      | (true , false) => "Fizz"
      | (false, true ) => "Buzz"
      | (false, false) => Int.toString x
				       
val fizzbuzz = general_fizzbuzz 3 5
				       
fun play_to limit fb =
    let
	fun inner (x, acc) = 
	    if x <= 0 then acc
	    else inner (x-1, (fb x)::acc)
    in
	inner (limit, [])
    end
