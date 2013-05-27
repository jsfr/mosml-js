fun even 0 = true
  | even x = odd(x-1)
and odd  0 = false
  | odd  x = even(x-1);

val it = (even 10; even 11)

datatype 'a X = X of string;

val stripX = fn X u => u;
val it = fn _ => stripX (X "OK");
val it = it () : string;

val stripX666 = fn X "666" => X "000" | x => x;

val it = fn _ => stripX666 (X "666");
val it = it () : int X;

val it = fn _ => stripX666 (X "OK");
val it = it () : int X;

datatype XXX =
    A of int * int
  | B of int * int;

val a12 = A(1,2)
and b12 = B(1,2);

fun strip (A x) = x
  | strip (B x) = x;

val it = a12 = b12;
val it = strip a12 = strip b12;