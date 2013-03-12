use "testing.sml";

open SmlTests;

exception FooExn;
exception BarExn;

test("assert_equals with equal output PASSED",
     assert_equals_string(TEST_PASSED,
			  assert_equals_string("foo", "foo")));

test("assert_equals is not equal output error",
     assert_equals_string("Expected 'foo' but got 'bar'",
		   assert_equals_string("foo", "bar")));

test("assert_equals_any passes if arguments are equal",
     assert_equals_string(TEST_PASSED, 
		   assert_equals_any((42,"hi"), (42,"hi"))));

test("assert_equals_any fails if arguments are different",
     assert_equals_string(TEST_FAILED, 
		   assert_equals_any("foo", "bar")));

test("assert_raises with correct exception passes",
     assert_equals_string(TEST_PASSED,
		   assert_raises(fn () => raise FooExn, (), FooExn)));

test("assert_raises without exception raised gives error",
     assert_equals_string("No FooExn was raised",
		   assert_raises(fn () => (), (), FooExn)));

test("assert_raises with wrong exception gives error",
     assert_equals_string("Wrong exception raised: BarExn",
		   assert_raises(fn () => raise BarExn, (), FooExn)));

test("assert_raises calls fn with provided arguments",
     assert_equals_string(TEST_PASSED,
		   assert_raises(fn (a,b,c) => if a=1 andalso b="foo" andalso c
					       then raise FooExn
					       else "ok",
				 (1, "foo", true),
				 FooExn)));

test("assert_equals_bool with true and true passees",
     assert_equals_string(TEST_PASSED,
		   assert_equals_bool true true));

test("assert_true with true passes",
     assert_equals_string(TEST_PASSED,
		   assert_true true));

test("assert_true with false fails",
     assert_equals_string("Expected 'true' but got 'false'",
		   assert_true false));

run();
