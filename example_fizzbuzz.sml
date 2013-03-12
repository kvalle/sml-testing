(* A simple fizzbuzz, just so we have something to test. *)

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
    end;


(* Tests start here. *)

use "testing.sml";
open SmlTests;

test("fizzbuzz of large prime is number",
     assert_equals_string("10006721", fizzbuzz 10006721));

test("fizzbuzz of 90 is fizzbuzz",
     assert_equals_string("FizzBuzz", fizzbuzz 90));
	
test("10 first values of standard fizzbuzz are correct",
     assert_equals_string_list(["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz"],
			       play_to 10 fizzbuzz));

run();
   
(* 
  Running this file should produce the following output (after 
  some lines of defined signatures):
 
    val it = "fizzbuzz of large prime is number" : string
    val it = "fizzbuzz of 90 is fizzbuzz" : string
    val it = "10 first values of standard fizzbuzz are correct" : string

    TESTS PASSED

    val it = "3 tests total" : string 
*)
