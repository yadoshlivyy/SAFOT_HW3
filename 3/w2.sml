use "w2_def.sml";

structure W2 :> S2 =
struct
  exception SeqErr

  fun get_seq_val Nil = raise SeqErr
    | get_seq_val (Cons (x, xs)) = x

  type 'a memory = (int * 'a) list ref

  fun memory_put memory (i, x) = 
      memory := (i, x) :: !memory

  fun memory_get memory i =
      case List.find (fn (ei, _) => ei = i) (!memory) of
          SOME (_, x) => x
        | NONE => raise SeqErr

  type 'a biseq = ('a seq) * int * (('a seq) memory)
  fun new Nil = (Nil, 0, ref [])
    | new s = (s, 0, ref [(0, s)])
  fun empty (Nil, _, _) = true
    | empty _ = false
  fun curr (Nil, _, _) = raise SeqErr
    | curr (Cons (x, xs), _, _) = x
  fun next (Nil, _, _) = raise SeqErr
    | next (Cons (x, xs), i, mem) =
        if i+1 < List.length (!mem) then
          (memory_get mem (i+1), i + 1, mem)
        else
          let
            val next_seq = xs()
          in
            memory_put mem (i+1, next_seq);
            (next_seq, i+1, mem)
          end
  fun prev (Nil, _, _) = raise SeqErr
    | prev (Cons (x, xs), i, mem) =
        if i-1 >= 0 then
          (memory_get mem (i-1), i - 1, mem)
        else raise SeqErr
end;