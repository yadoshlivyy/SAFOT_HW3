datatype 'a btree = empty | btree of 'a * 'a btree * 'a btree;

signature S1 = sig
  val map : 'a btree -> ('a -> 'b) -> 'b btree
  val flatten : 'a btree -> 'a list
  val unfold : ('b -> ('a * 'b * 'b) option) -> 'b -> 'a btree
end;

fun
flatten empty = [] |
flatten (tree : 'a btree)= 
let
  fun postOrderFold (f,acc,node)=
  let
    (* fun loop (acc,) *)
    val i = 4
  in
    [empty] 
  end;
in
  postOrderFold(fn(acc,node)=>acc @ node,[],tree)
end;