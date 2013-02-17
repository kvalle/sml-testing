use "asserts.sml";
use "formatters.sml";

signature TESTS =
sig
    val test : string * string -> string * string
    val run : (string * string) list -> unit
end
    
structure SmlTests :> TESTS =
struct

fun test t = t

fun print_errors tests = 
    case tests of 
	[] => ()
      | (description,result)::rest => 
	(print("FAILED: " ^ description ^ "\n  -- " ^ result ^ "\n");
	 print_errors(rest))

fun run tests = 
    let 
	val failed = List.filter (fn (_,result) => result <> TEST_PASSED) tests
    in
	case failed of 
	    [] => (print("\nTESTS PASSED\n\n"); 
		   ())
	  | _ => (print("\n");
		  print_errors(failed);
		  print("\n" ^ Int.toString(length(failed)) ^" test(s) failed\n\n"); 
		  ())
    end
	
end
