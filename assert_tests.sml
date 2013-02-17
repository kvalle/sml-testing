use "formatters.sml";
use "asserts.sml";

val test_assert_equals_is_equal =
    assert_equals(TEST_PASSED,
		  assert_equals("foo", "foo", string_formatter),
		  string_formatter)

val test_assert_equals_is_not_equal =
    assert_equals("Expected 'foo' but got 'bar'",
		  assert_equals("foo", "bar", string_formatter),
		  string_formatter)

exception FooExn
exception BarExn

val test_assert_raises_with_correct_exception =
    assert_equals(TEST_PASSED,
		  assert_raises(fn () => raise FooExn, FooExn),
		  string_formatter)

val test_assert_raises_without_exception_raised =
    assert_equals("No FooExn was raised",
		  assert_raises(fn () => (), FooExn),
		  string_formatter)


val test_assert_raises_with_wrong_exception =
    assert_equals("Wrong exception raised: BarExn",
		  assert_raises(fn () => raise BarExn, FooExn),
		  string_formatter)
