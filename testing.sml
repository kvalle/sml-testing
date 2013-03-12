use "asserts.sml";

signature TESTS =
sig
    val test : string * string -> string
    val run : unit -> string
end
    
structure SmlTests :> TESTS =
struct

val suite : (string * string) list ref = ref [];

fun test (desc, result) = 
    (suite := (desc, result)::(!suite);
    desc)

fun print_errors tests = 
    case tests of 
	[] => ()
      | (description,result)::rest => 
	(print("FAILED: " ^ description ^ "\n  -- " ^ result ^ "\n");
	 print_errors(rest))

fun run () = 
    let 
	val failed = List.filter (fn (_,result) => result <> TEST_PASSED) (!suite)
	val return = Int.toString(length (!suite)) ^ " tests total"
    in
	case failed of 
	    [] => (print("\nTESTS PASSED\n\n"); 
		   return)
	  | _ => (print("\n");
		  print_errors(failed);
		  print("\n" ^ Int.toString(length(failed)) ^" test(s) failed\n\n"); 
		  return)
    end
	
end
