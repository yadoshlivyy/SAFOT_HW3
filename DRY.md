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
