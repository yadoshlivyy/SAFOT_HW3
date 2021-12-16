use "d2_def.sml";

functor Tree (S: ITEM_OR_LIST_OF_ITEMS_AND_LISTS) : TREE = struct
    open S
    exception DestructionOfLeaf
    exception NoNext
    val leaf = item
    fun add_child (t1, t2) = push (t1, t2)
    fun tree t = push (t, empty)
    fun first_child t = head t
    fun next_sibling t = 
        if vacuous (tail t) then raise NoNext
        else tail t 
end;

functor ListOfLists (S: S_EXPRESSION) : ITEM_OR_LIST_OF_ITEMS_AND_LISTS = struct
    open S
    exception Empty
    exception NotAList
    val empty = NIL
    fun vacuous t = eq (t, empty) 
    fun item s = leaf s
    fun push (t1, t2) =
        if atom t2 then
            raise NotAList
        else
            cons (t1, t2) 
    fun head t =
        if vacuous t then
            raise Empty
        else if atom t then
            raise NotAList
        else
            car t
    fun tail t =
        if vacuous t then
            raise Empty
        else if atom t then
            raise NotAList
        else
            cdr t
end;

structure S_Expression : S_EXPRESSION = struct
    datatype symbol = Symbol of string
    datatype t = Atom of symbol | NIL | Cons of t * t
    exception DestructionOfAtom
    fun leaf s = Atom (s)
    fun cons (t1, t2) = Cons (t1, t2)
    fun car (Atom (_)) = raise DestructionOfAtom
        | car (Cons (t1, _)) = t1
        | car NIL = NIL
    fun cdr (Atom (_)) = raise DestructionOfAtom
        | cdr (Cons (t1, _)) = t1
        | cdr NIL = NIL
    fun atom (Atom (s)) = true
        | atom (Cons (_, _)) = false
        | atom NIL = true
    fun eq (Atom (s1), Atom (s2)) = s1 = s2
        | eq (Cons (a1, a2), Cons (b1, b2)) = 
            (eq (a1, b1)) andalso (eq (a2, b2))
        | eq (NIL, NIL) = true
        | eq _ = false
    val NIL = NIL
    val T = leaf (Symbol "T")
end;

