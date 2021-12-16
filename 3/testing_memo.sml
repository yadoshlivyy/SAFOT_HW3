type 'a memory = (int * 'a) list ref

fun memory_put memory (i, x) = 
    memory := (i, x) :: !memory

fun memory_get memory i =
    List.find (fn e => #1 e = i) !memory
