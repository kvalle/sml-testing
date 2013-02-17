val string_formatter = fn s => s
val int_formatter = Int.toString

fun string_list_option_formatter some_list =
    case some_list of
	NONE => "NONE"
      | SOME [] => ""
      | SOME (x::[]) => x
      | SOME (x::rest) => x ^ ", " ^ string_list_option_formatter(SOME rest)
										       
fun int_list_option_formatter some_list =
    case some_list of
	NONE => "NONE"
      | SOME [] => ""
      | SOME (x::[]) => Int.toString(x)
      | SOME (x::rest) => Int.toString(x) ^ ", " ^ int_list_option_formatter(SOME rest)

fun string_list_formatter list =
    case list of
	[] => "EMPTY"
      | x::[] => x
      | x::rest => x ^ ", " ^ string_list_formatter (rest)

