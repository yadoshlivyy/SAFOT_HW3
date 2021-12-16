# Dry Part

## Question 1

### Part 1

- Product is Tuple in MyPy
- Mapping is Callable type in MyPy
- Disjoint Union is Union type in MyPy
- Record is Named tuple in MyPy

### Part 2

- Product example

```python
i: Tuple[int,str] = (1,"bubu")
```

- Mapping example

```python
i: Callable[[int,str],int] = lambda x,y = len(y)+x
```

- Disjoint Union example

```python
i: int | str = 1
i = "bubu"
```

- Record example

```python
Point = namedtuple('Point', ['x', 'y'])
p = Point(x=1, y=2)
```

### Part 3

- bottom no reference in given link , None is correct return value

### Part 4

- top is Any in given documentation

## Question 3

- Strongly typed
- Dynamically typed
- Gradually typed
- Non Discriminal constructors
- Have Highly advanced type constructors
- inferred typing

## Question 5

## Q5.2

1. To expand our implementation for negative numbers we can simply wrap each number (except maybe zero, since it doesn't have to have a sign) in `Cons (sign, number)` where `sign` is a symbol that defines the sign of the number and `number` defines the value. `PLUS` operation for numbers of the same sign can be done as before by unpacking the value from both numbers and preserving the sign. `PLUS` for numbers of different signs can be done as follows: Find which number's value is greater by iterating over lists (collapsing) in both values. The number with greater value will define the sign and the value that's left from it by the end of iteration will define the difference (value part of the result of the operation).
2. For rational numbers, we can first apply changes we described for negative numbers (since rational numbers can, in particular, be negative). Then instead of storing a single list in each list, we can store 2 lists, one for the numerator and another for the denominator. Then for implementing the `PLUS` operation we can normalize denominators by utilizing the `mul()` function (see the implementation of `POWER` in `d5.sml`) and then perform the `PLUS` operation as described above on nominator.
