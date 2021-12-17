use "w1_def.sml";

fun
flatten empty = [] |
flatten (tree : 'a btree)= 
let
  fun postOrderFold (f,acc,node)=
  let
  fun loop (acc,empty,cont)=cont(acc) |
      loop (acc,btree(node_value,left_tree,right_tree),cont) = loop(acc,left_tree,fn (next_acc)=>loop(f(next_acc,node_value),right_tree,cont))
  in
    loop(acc,node,fn a=>a)
  end;
in
  postOrderFold(fn(acc,node_value)=>acc @[node_value],[],tree)
end;

flatten t
t
