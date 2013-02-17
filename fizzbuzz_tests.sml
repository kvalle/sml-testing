use "fizzbuzz.sml";
use "asserts.sml";
use "formatters.sml";

val test_fizzbuzz_of_large_prime_is_number = 
    assert_equals("10006721", fizzbuzz 10006721, string_formatter)

val test_fizzbuzz_of_90_is_fizzbuzz =
    assert_equals("FizzBuzz", fizzbuzz 90, string_formatter)

val test_10_first_values_of_standard_fizzbuzz =
    assert_equals(["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz"],
		  play_to 10 fizzbuzz,
		  string_list_formatter)
