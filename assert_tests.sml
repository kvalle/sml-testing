use "tests.sml";

exception FooExn
exception BarExn
	      
val _ = run([test("assert_equals with equal output PASSED",
		  assert_equals(TEST_PASSED,
				assert_equals("foo", "foo", string_formatter),
				string_formatter)),
	     
	     test("assert_equals is not equal output error",
		  assert_equals("Expected 'foo' but got 'bar'",
				assert_equals("foo", "bar", string_formatter),
				string_formatter)),
	     
	     test("assert_raises with correct exception passes",
		  assert_equals(TEST_PASSED,
				assert_raises(fn () => raise FooExn, FooExn),
				string_formatter)),
	     
	     test("assert_raises without exception raised gives error",
		  assert_equals("No FooExn was raised",
				assert_raises(fn () => (), FooExn),
				string_formatter)),
	     
	     test("assert_raises with wrong exception gives error",
		  assert_equals("Wrong exception raised: BarExn",
				assert_raises(fn () => raise BarExn, FooExn),
				string_formatter))
	   ])
