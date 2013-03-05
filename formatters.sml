val string_formatter = fn s => s
val int_formatter = Int.toString
val bool_formatter = Bool.toString

fun a_list_formatter element_formatter list =
    case list of
	[] => "[]"
      | elements => "[" ^ (String.concatWith ", " (List.map element_formatter elements)) ^ "]"

fun a_option_formatter value_formatter option =
    case option of
	NONE => "NONE"
      | SOME value => "SOME " ^ value_formatter(value)

val string_list_formatter = a_list_formatter string_formatter 
val int_list_formatter = a_list_formatter int_formatter
val bool_list_formatter = a_list_formatter bool_formatter

val string_list_option_formatter = a_option_formatter string_list_formatter
val int_list_option_formatter = a_option_formatter int_list_formatter
val bool_list_option_formatter = a_option_formatter bool_list_formatter

val string_option_formatter = a_option_formatter string_formatter
val int_option_formatter = a_option_formatter int_formatter
val bool_option_formatter = a_option_formatter bool_formatter
