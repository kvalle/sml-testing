SML Testing
===========

Simple framework for testing SML code. 
The framework basically provide some `assert` functions, and some `formatters` used in these to provide the needed output should an assert fail.

### Usage

You write your tests like this:

```sml
use "testing.sml";
open SmlTests;

test("two plus three is five",
     assert_equals_int(2 + 3, 5));

test("doubling a list of ints",
     assert_equals_int_list([2, 4, 6],
                            List.map (fn x => x*2) [1,2,3]));   

run();
```

Write tests by calling the `test` function. 
Tests must return a call to the an `assert` function. 
Finally call the `run` function to run the tests.

### Output

See the example files for simple example usage.
This is what it looks like if all the tests pass:

```sml
- use "example_fizzbuzz.sml";
... 

TESTS PASSED

val it = "3 tests total" : string
val it = () : unit
```

And this is what it looks like when some of the tests fail:

```sml
- use "example_failing.sml";
...

FAILED: comparison using the equals-method without explicit formatter
  -- Test failed
FAILED: comparison of string options
  -- Expected 'NONE' but got 'SOME I am a string!'
FAILED: comparison of two bools
  -- Expected 'false' but got 'true'
FAILED: comparison of two string lists
  -- Expected '[1, 2, foo, bar]' but got '[foo, bar, baz]'

4 test(s) failed

val it = "6 tests total" : string
```

Not shown (replaced by `...`) are the type definitions of everything you define in your programs, as well as the test descriptions.

### Asserts

The asserts are defined in [asserts.sml](https://github.com/kvalle/sml-testing/blob/master/asserts.sml).

You'll find that some basic ones are pre-defined, such as `assert_true` (and `false`), `assert_equals` for a handful of datatypes, and an `assert_raises` that checks that your code raises the expected exception.

If (or rather *when*) you need to assert something new (e.g, that a number is prime or that a hand of cards holds a stright flush), use the `mk_assert_*` functions to new ones.

### Formatters

The formatters are defined in [formatters.sml](https://github.com/kvalle/sml-testing/blob/master/formatters.sml). They are basically functions which take in a value of some type, and returns a string representing this value.
These enable the asserts to display informative messages when tests fail, such as what the result was and what it had expected.

You will probably need to extend or write your own formatters for any custom datatypes you create.

----

A tiny disclaimer: *While the framework should not be dependent on anything complier specific, it is only tested with the SML/NJ distribution.*
