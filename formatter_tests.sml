use "tests.sml";

let
    val test = SmlTests.test
    val run = SmlTests.run
in
    run([
	   (* string list *)
	   
	   test("string list is empty list",
		assert_equals("[]", 
			      string_list_formatter [],
			      string_formatter)),
	   
	   test("string list is list with elements",
		assert_equals("[foo, bar]", 
			      string_list_formatter ["foo", "bar"],
			      string_formatter)),
	   
	   (* int list *)
	   
	   test("int list is empty list",
		assert_equals("[]", 
			      int_list_formatter [],
			      string_formatter)),
	   
	   test("int list is list with elements",
		assert_equals("[1, 2, 3]", 
			      int_list_formatter [1, 2, 3],
			      string_formatter)),

	   (* string list option *)

	   test("string list option is NONE",
		assert_equals("NONE", 
			      string_list_option_formatter NONE,
			      string_formatter)),
	   
	   test("string list option is empty list",
		assert_equals("SOME []", 
			      string_list_option_formatter (SOME []),
			      string_formatter)),
	   
	   test("string list option is list with elements",
		assert_equals("SOME [foo, bar]", 
			      string_list_option_formatter (SOME ["foo", "bar"]),
			      string_formatter)),
	   
	   (* int list option *)
	   
	   test("int list option is NONE",
		assert_equals("NONE", 
			      int_list_option_formatter NONE,
			      string_formatter)),
	   
	   test("int list option is empty list",
		assert_equals("SOME []", 
			      int_list_option_formatter (SOME []),
			      string_formatter)),
	   
	   test("int list option is list with elements",
		assert_equals("SOME [1, 2, 3]", 
			      int_list_option_formatter (SOME [1, 2, 3]),
			      string_formatter)),
	   
	   (* bool option *)
	   
	   test("bool option formatter for all outputs",
		assert_equals(["NONE", "SOME true", "SOME false"],
			      List.map bool_option_formatter [NONE, SOME true, SOME false],
			      string_list_formatter))

       ])
end
