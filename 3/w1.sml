use "w1_def.sml";

fun
flatten empty = [] |
flatten (tree : 'a btree)= 
let
  fun preOrderFold (f,acc,node)=
  let
  fun loop (acc,empty,cont)=cont(acc) |
      loop (acc,btree(node_value,left_tree,right_tree),cont) = loop(f(acc,node_value),left_tree,fn (next_acc)=>loop(next_acc,right_tree,cont))
  in
    loop(acc,node,fn a=>a)
  end;
in
  preOrderFold(fn(acc,node_value)=>acc @[node_value],[],tree)
end;

