use "formatters.sml";

val TEST_PASSED = "Test passed"
val TEST_FAILED = "Test failed"

(* Generator functions for asserts *)

fun mk_assert_formatted pred_fn formatter (expected, actual) =
    if pred_fn(expected, actual) then TEST_PASSED
    else "Expected '" ^ formatter (expected) ^ "' but got '" ^ formatter (actual) ^ "'"

fun mk_assert_unformatted pred_fn (expected, actual) =
    if pred_fn(expected, actual) then TEST_PASSED else TEST_FAILED

(* Assert equality *)

fun assert_equals formatter args = mk_assert_formatted (fn (e,a) => e=a) formatter args

fun assert_equals_any args = mk_assert_unformatted (fn (e,a) => e=a) args
val assert_equals_int           = assert_equals int_formatter
val assert_equals_int_list      = assert_equals int_list_formatter
val assert_equals_int_option    = assert_equals int_option_formatter
val assert_equals_string        = assert_equals string_formatter
val assert_equals_string_list   = assert_equals string_list_formatter
val assert_equals_string_option = assert_equals string_option_formatter
val assert_equals_bool          = assert_equals bool_formatter
val assert_equals_bool_list     = assert_equals bool_list_formatter
val assert_equals_bool_option   = assert_equals bool_option_formatter

(* Assert true/false *)

fun assert_true actual = assert_equals_bool(true, actual)
fun assert_false actual = assert_equals_bool(false, actual)
		
(* Assert that an execption is raised *)
			     
fun assert_raises (f, args, e) =
    (f args; "No " ^ exnName (e) ^ " was raised") 
    handle e' => if exnName e = exnName e' then TEST_PASSED
		 else "Wrong exception raised: " ^ exnName (e')
