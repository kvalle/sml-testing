use "asserts.sml";
use "formatters.sml";


signature TESTS =
sig
    val test : string * string -> unit
    val run : unit -> unit
end
    
structure SmlTests :> TESTS =
struct

val suite : (string * string) list ref = ref [];

fun test (desc, result) = 
    suite := (desc, result)::(!suite);

fun print_errors tests = 
    case tests of 
	[] => ()
      | (description,result)::rest => 
	(print("FAILED: " ^ description ^ "\n  -- " ^ result ^ "\n");
	 print_errors(rest))

fun run () = 
    let 
	val failed = List.filter (fn (_,result) => result <> TEST_PASSED) (!suite)
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
