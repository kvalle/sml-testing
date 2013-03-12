use "testing.sml";
open SmlTests;

test("two plus three is five",
     assert_equals_int(2 + 3, 5));

test("doubling a list of ints",
     assert_equals_int_list([2, 4, 6],
			    List.map (fn x => x*2) [1,2,3]));

run();
