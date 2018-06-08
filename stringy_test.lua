require "stringy"

---------
-- split
---------
b = stringy.split("asdfsk", "s")
assert(#b == 3, #b)

assert('a|b|c' == (table.concat(stringy.split("a\tb\tc", "\t"), "|")))
assert(stringy.split("asdf", "s")[1] == "a")

assert('a||b||c' == (table.concat(stringy.split("aXXbXXc", "XX"), "|")))

---------
-- strip
---------
assert(stringy.strip(" asdf ") == "asdf")
assert(stringy.strip("asdf ") == "asdf")
assert(stringy.strip(" asdf  ") == "asdf")
assert(stringy.strip("asdf") == "asdf")
assert(stringy.strip("asdf") == "asdf")
assert(stringy.strip("\nasdf\r\n") == "asdf")
assert(stringy.strip(" asdf ") == "asdf")

--------------
-- startswith
--------------
assert(stringy.startswith("asdf", "a"))
assert(stringy.startswith("asdf", "asd"))
assert(stringy.startswith("asdf", "asdf"))
assert(stringy.startswith("asdf", ""))
assert(stringy.startswith("\0asdf", "\0"))
assert(stringy.startswith("\000asdf", "\000a"))

assert(not stringy.startswith("asdf", "asdfg"))
assert(not stringy.startswith("asdf", "b"))
assert(not stringy.startswith("asdf", "f"))
assert(not stringy.startswith("asdf", "\0"))

--------------
-- endswith
--------------
assert(stringy.endswith("asdf", "f"))
assert(stringy.endswith("asdf", "sdf"))
assert(stringy.endswith("asdf", "asdf"))
assert(stringy.endswith("asdf", "asdf"))
assert(stringy.endswith("asdf", ""))
assert(stringy.endswith("a\0df", "\0df"))

assert(not stringy.endswith("asdf", "\0"))
assert(not stringy.endswith("asdf", "asd"))
assert(not stringy.endswith("asdf", "a"))
assert(not stringy.endswith("a\0df", "a\0s"))
