val TEST_PASSED = "OK"

fun assert_equals (expected, actual, formatter) =
    if expected = actual then TEST_PASSED
    else "Expected '" ^ formatter (expected) ^ "' but got '" ^ formatter (actual) ^ "'"						
fun assert_equals_bool expected actual = assert_equals(expected, actual, Bool.toString)
fun assert_true (actual) = assert_equals_bool true
fun assert_false (actual) = assert_equals_bool false
					     
fun assert_raises (f, args, e) =
    (f args; "No " ^ exnName (e) ^ " was raised") 
    handle e' => if exnName e = exnName e' then TEST_PASSED
		 else "Wrong exception raised: " ^ exnName (e')
											
