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
  fun loop (acc,empty,cont)=cont(acc) |
      loop (acc,btree(node_value,left_tree,right_tree),cont) = loop(acc,left_tree,fn (next_acc)=>loop(f(nex,node),right_tree,cont))
  in
    loop(acc,node,fn a=>a)
  end;
in
  postOrderFold(fn(acc,btree(node_value,_,_))=>acc @ node_value,[],tree)
end;