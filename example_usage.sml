use "testing.sml";
open SmlTests;

test("two plus three is five",
     assert_equals(2 + 3, 5, int_formatter));

test("doubling a list of ints",
     assert_equals([2, 4, 6],
		   List.map (fn x => x*2) [1,2,3],
		   int_list_formatter));

run();
