use "fizzbuzz.sml";
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
