use "testing.sml";

open SmlTests;

(* string list *)

test("string list is empty list",
     assert_equals_string("[]", 
			  string_list_formatter []));

test("string list is list with elements",
     assert_equals_string("[foo, bar]", 
			  string_list_formatter ["foo", "bar"]));

(* int list *)

test("int list is empty list",
     assert_equals_string("[]", 
			  int_list_formatter []));

test("int list is list with elements",
     assert_equals_string("[1, 2, 3]", 
			  int_list_formatter [1, 2, 3]));

(* string list option *)

test("string list option is NONE",
     assert_equals_string("NONE", 
			  string_list_option_formatter NONE));

test("string list option is empty list",
     assert_equals_string("SOME []", 
			  string_list_option_formatter (SOME [])));

test("string list option is list with elements",
     assert_equals_string("SOME [foo, bar]", 
			  string_list_option_formatter (SOME ["foo", "bar"])));

(* int list option *)

test("int list option is NONE",
     assert_equals_string("NONE", 
			  int_list_option_formatter NONE));

test("int list option is empty list",
     assert_equals_string("SOME []", 
			  int_list_option_formatter (SOME [])));

test("int list option is list with elements",
     assert_equals_string("SOME [1, 2, 3]", 
			  int_list_option_formatter (SOME [1, 2, 3])));

(* bool option *)

test("bool option formatter for all outputs",
     assert_equals_string_list(["NONE", "SOME true", "SOME false"],
		       List.map bool_option_formatter [NONE, SOME true, SOME false]));

run();
