SML Testing
===========

Simple framework for testing SML code. 
Provides some `assert_*` functions, and the ability to only output feedback from those tests that fail, if any. 

See the file [`examples.sml`](https://github.com/kvalle/sml-testing/blob/master/fizzbuzz_tests.sml) for simple example usage.

	> use "examples.sml";
	... 
    val it = "fizzbuzz of large prime is number" : string
    val it = "fizzbuzz of 90 is fizzbuzz" : string
    val it = "10 first values of standard fizzbuzz are correct" : string
  
    TESTS PASSED
  
    val it = "3 tests total" : string
    val it = () : unit

----

*While the framework should not be dependent on anything complier specific, it is only tested with the SML/NJ distribution.*
