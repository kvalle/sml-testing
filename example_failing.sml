use "testing.sml";
open SmlTests;

(* Suite of obviously failing tests. *)
(* Included to illustrate test output. *)

test("comparison of two string lists",
     assert_equals_string_list(["1","2","foo", "bar"],
			       ["foo","bar","baz"]));

test("comparison of two bools",
     assert_equals_bool(false, true));

test("comparison of string options",
     assert_equals_string_option(NONE, SOME "I am a string!"));

test("comparison using the equals-method without explicit formatter",
     assert_equals_any("a string", "a completely different string"));

(* And a couple of tests that won't fail. *)

test("fourty two is fourty two",
     assert_equals_int(42, 42));

test("check appending two int lists",
     assert_equals_int_list([1,2,3],
			    [1,2]@[3]));

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
