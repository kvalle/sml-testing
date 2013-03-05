use "testing.sml";
open SmlTests;

(* Suite of obviously failing tests. *)
(* Included to illustrate test output. *)

test("comparison of two string lists",
     assert_equals(["1","2","foo", "bar"],
		   ["foo","bar","baz"],
		   string_list_formatter));

test("comparison of two bools",
     assert_equals(false, true, bool_formatter));

test("comparison of string options",
     assert_equals(NONE, SOME "I am a string!",
		   string_option_formatter));

test("comparison using the equals-method without explicit formatter",
     assert_equals_any("a string", "a completely different string"));

(* And a couple of tests that won't fail. *)

test("fourty two is fourty two",
     assert_equals(42, 42, int_formatter));

test("check appending two int lists",
     assert_equals([1,2,3],
		   [1,2]@[3],
		   int_list_formatter));

run();

(* 
  Running this file should produce the following output:
  
    FAILED: comparison using the equals-method without explicit formatter
      -- Test failed
    FAILED: comparison of string options
      -- Expected 'NONE' but got 'SOME I am a string!'
    FAILED: comparison of two bools
      -- Expected 'false' but got 'true'
    FAILED: comparison of two string lists
      -- Expected '[1, 2, foo, bar]' but got '[foo, bar, baz]'

    4 test(s) failed

    val it = "6 tests total" : string
  
*)
