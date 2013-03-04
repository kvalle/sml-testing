(* A simple fizzbuzz, to have something to test. *)

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


(* Fizzbuzz tests *)

use "testing.sml";
open SmlTests;

test("fizzbuzz of large prime is number",
	 assert_equals("10006721", fizzbuzz 10006721, string_formatter));

test("fizzbuzz of 90 is fizzbuzz",
	 assert_equals("FizzBuzz", fizzbuzz 90, string_formatter));
	
test("10 first values of standard fizzbuzz are correct",
	 assert_equals(["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz"],
		       play_to 10 fizzbuzz,
		       string_list_formatter));

run()