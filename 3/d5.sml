use "d2_def.sml";
use "d5_def.sml";

functor Unary (S: ITEM_OR_LIST_OF_ITEMS_AND_LISTS): UNARY = struct
  type t = S.t
  val zero = S.empty
  val one = S.push (S.empty, S.empty)
  fun plus (t1, t2) =
    if S.vacuous t2 then t1
    else plus (S.push (t1, S.empty), S.head t2)
  fun power (t, n) = 
    let
      fun mul (t1, t2) = 
        if (S.vacuous t2) orelse (S.vacuous t1) then zero
        else if (S.vacuous (S.head t1)) then t2
        else if (S.vacuous (S.head t2)) then t1
        else plus (t1, mul (t1, S.head t2)) 
    in
      if S.vacuous t then zero
      else if S.vacuous n then one
      else mul (t, power (t, S.head n))
    end
end;
