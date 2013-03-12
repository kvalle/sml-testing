use "formatters.sml";

val TEST_PASSED = "Test passed"
val TEST_FAILED = "Test failed"

fun mk_assert_formatted pred_fn formatter (expected, actual) =
    if pred_fn(expected, actual) then TEST_PASSED
    else "Expected '" ^ formatter (expected) ^ "' but got '" ^ formatter (actual) ^ "'"

fun mk_assert_unformatted pred_fn (expected, actual) =
    if pred_fn(expected, actual) then TEST_PASSED else TEST_FAILED

fun assert_equals formatter args = mk_assert_formatted (fn (e,a) => e=a) formatter args
fun assert_equals_any args = mk_assert_unformatted (fn (e,a) => e=a) args
val assert_equals_int = assert_equals int_formatter
val assert_equals_string = assert_equals string_formatter
val assert_equals_string_list = assert_equals string_list_formatter

fun assert_equals_bool expected actual = assert_equals Bool.toString (expected, actual)
val assert_true = assert_equals_bool true
val assert_false = assert_equals_bool false
					     
fun assert_raises (f, args, e) =
    (f args; "No " ^ exnName (e) ^ " was raised") 
    handle e' => if exnName e = exnName e' then TEST_PASSED
		 else "Wrong exception raised: " ^ exnName (e')
