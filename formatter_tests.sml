use "formatters.sml";
use "asserts.sml";

(* string list *)

val test_string_list_is_empty_list = 
    assert_equals("[]", 
		  string_list_formatter [],
		  string_formatter)
		 
val test_string_list_is_list_with_elements = 
    assert_equals("[foo, bar]", 
		  string_list_formatter ["foo", "bar"],
		  string_formatter)

(* int list *)

val test_int_list_is_empty_list = 
    assert_equals("[]", 
		  int_list_formatter [],
		  string_formatter)
		 
val test_int_list_is_list_with_elements = 
    assert_equals("[1, 2, 3]", 
		  int_list_formatter [1, 2, 3],
		  string_formatter)

(* string list option *)

val test_string_list_option_is_NONE = 
    assert_equals("NONE", 
		  string_list_option_formatter NONE,
		  string_formatter)

val test_string_list_option_is_empty_list = 
    assert_equals("SOME []", 
		  string_list_option_formatter (SOME []),
		  string_formatter)

val test_string_list_option_is_list_with_elements = 
    assert_equals("SOME [foo, bar]", 
		  string_list_option_formatter (SOME ["foo", "bar"]),
		  string_formatter)

(* int list option *)

val test_int_list_option_is_NONE = 
    assert_equals("NONE", 
		  int_list_option_formatter NONE,
		  string_formatter)

val test_int_list_option_is_empty_list = 
    assert_equals("SOME []", 
		  int_list_option_formatter (SOME []),
		  string_formatter)

val test_int_list_option_is_list_with_elements = 
    assert_equals("SOME [1, 2, 3]", 
		  int_list_option_formatter (SOME [1, 2, 3]),
		  string_formatter)
