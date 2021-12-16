use "w2_def.sml";

structure W2 :> S2 =
struct
  exception SeqErr

  datatype 'a biseq = Nil 
    | BCons of 'a * (unit -> 'a biseq) * (unit -> 'a biseq)

  (* fun new (Cons (a, b)) = (Cons (a, b(), b())) *)
  fun curr (BCons (a, _, _)) = a
  fun prev (BCons (_, p, _)) = p()
  fun next (BCons (_, _, n)) = n()
  fun empty (BCons (_, _, _)) = false
end;

datatype 'a biseq = Nil 
  | BCons of 'a * (unit -> 'a biseq) * (unit -> 'a biseq)