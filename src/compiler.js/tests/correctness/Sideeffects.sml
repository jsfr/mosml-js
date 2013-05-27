
(* Moscow ML handle the first three tests correct. *)
fun csnd x y = y

local val r = ref "WRONG" in
val test1 = csnd (r := "OK"; ()) (!r);
end

local
    val r = ref "WRONG"
    val fr = ref (fn () => (r := "OK"; csnd))
in
val test2 = (!fr ()) () !r;
end


exception Right and Wrong

val test3 = csnd (raise Right) (raise Wrong)
            handle Right => "OK"
                 | Wrong => "WRONG"



(* But it's downhill from here... *)
local
    fun f y = (raise Right; fn x => x)
in
val test4 = (f 7 (raise Wrong))
            handle Right => "OK"
                 | Wrong => "WRONG"

end

local
    val r = ref "WRONG"
    fun f y = #2 (r := "OK", fn x => x)
in
val test5 = (f 7 (!r), !r)
end