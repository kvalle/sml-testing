fun assert_equals (expected, actual, formatter) =
    if expected = actual
    then " -- PASS"
    else "Expected: '" ^ formatter (expected) ^ "' but got '" ^ formatter (actual) ^ "' -- FAIL"
											
fun assert_bool_equals(expected, actual) =
    if expected = actual then " -- PASS"
    else "Expected: " ^ Bool.toString (expected) ^ ", but was: " ^ Bool.toString (actual) ^ " -- FAIL"
												
fun assert_true (actual) = assert_bool_equals(true, actual)
fun assert_false (actual) = assert_bool_equals(false, actual)
				       
fun assert_raise (f, e) =
    (
      f();
      "Expected: " ^ exnName (e) ^ " to be thrown, but it wasn't -- FAIL"
    )
    handle e' =>
	   if exnName e = exnName e' then " -- PASS"
	   else "Expected: " ^ exnName (e) ^ " to be thrown "  ^ 
		"but " ^ exnName (e') ^ " was thrown -- FAIL"

fun assert_equal_fn_outputs(f1, f2, args_list, input_formatter, output_formatter) =
    let 
	fun inner(args_list, errors) =
	   case (args_list, errors) of
	       ([],[]) => " -- PASS"
	     | ([], errors) => "Outputs did not match. " ^ (String.concatWith " AND " errors) ^ " -- FAIL"
	     | (args::rest, errors) => 
	       let 
		   val out1 = f1(args)
		   val out2 = f2(args) 
	       in
		   if out1 = out2 then inner(rest, errors)
		   else 
		       let val message = "'" ^ input_formatter(args) ^ "' ==> '" ^ 
					 output_formatter(out1) ^ "' <> '" ^ output_formatter(out2) ^ "'"
		       in
			    inner(rest, message::errors)
		       end
	       end 
    in
	inner(args_list, [])
    end
