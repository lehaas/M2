-- files of the form B*.m2 are meant to test basic features of the interpreter
-- exhaustively.  The tests are presented in the correct sequence, so
-- that each test really tests only one untested feature.

-- this file is for testing built-in functions

assert = x -> if not x then error "assertion failed "

-- test {}
assert( class {1,2,3} === List )
assert( # {1,2,3} === 3 )

-- test toSequence
assert( toSequence {1,2,3} === (1,2,3) )
assert( toSequence (1,2,3) === (1,2,3) )

-- test seq
assert( # seq (1,2,3) === 1 )
assert( class seq 3 === Sequence )
assert( (1,2,3,4) === (1,2,3,4) )
assert( (1,2,3,4) =!= (1,2,4,3) )

-- test ..
assert( 1 .. 5 === (1,2,3,4,5) )
assert( 0 .. 5 === (0,1,2,3,4,5) )
assert( -3 .. 1 === (-3,-2,-1,0,1) )
assert( 1 .. 1 === seq 1 )

-- test newClass
aa = {1,2,3}
bb = newClass(MutableList, aa)
assert( not  mutable aa )
assert( mutable bb )
bb#1 = 44
assert( bb#1 === 44 )
assert( aa#1 === 2 )

-- test list
assert( toList (1,2,3) === {1,2,3} )
assert( toList () === {} )
assert( toList {} === {} )
assert( toList {1} === {1} )
assert( toList {1,2} === {1,2} )
aa = newClass(MutableList, {1,2,3})
bb = toList aa
aa#2 = 444
assert( not  mutable bb )
assert( aa#2 === 444 )
assert( bb#2 === 3 )

-- test =!=
assert( { 1. } =!= { 1 } )
assert( (1,2) =!= (1.,2.) )

-- test not 
assert( not  false )
assert( not not true )
assert( not  true === false )
assert( not  false === true )

-- test try
assert( try error "" else true )
--i = 5
--try i :=6 else i :=7
--assert(i === 5)

-- test or
true or assert false
assert( true or true )
assert( true or false )
assert( false or true )
assert( false or false === false )

--i = 5
--false or (i := true)
--assert(i === 5)

-- test and
false and assert false
assert( true and true )
assert(not  (true and false))
assert(not  (false and true))
assert(not  (false and false))

-- i = 5
-- true and (i := true)
-- assert(i === 5)

-- test mutable
assert( not  mutable {1,2,3} )

-- test copy
assert( copy {1,3,5} === {1,3,5} )

-- test reverse
assert( reverse (1,2,3) === (3,2,1) )

-- test splice
assert( splice (0,(1,2),(3,4)) === (0,1,2,3,4) )
assert( splice {0,(1,2),(3,4)} === {0,1,2,3,4} )
assert( mutable splice newClass(MutableList, {1..3,5..7}) )
assert( not  mutable splice {1..3,5..7} )

-- test .
aa = new MutableHashTable
aa.d = 4
( d -> aa.d = 5 ) ()
assert( aa.d === 5 )

-- test |
assert( 12|5 === 13 )

-- test &
assert( 12&5 === 4 )

-- test if
if true then okay else assert false
if false then assert false else okay
if false then assert false
-- i=5
-- if true then i :=6
-- if false then i :=6
-- if false then i :=6 else i :=6
-- if true then i :=6 else i :=6
-- assert(i === 5)
