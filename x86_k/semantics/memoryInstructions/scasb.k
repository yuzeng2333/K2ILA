// Autogenerated using stratification.
requires "x86-configuration.k"

module SCASB
  imports X86-CONFIGURATION

  rule <k>
    execinstr (scasb  .Operands) =>
      loadFromMemory( getRegisterValue(%rdi, RSMap), 8) ~>
      execinstr (scasb getRegisterValue(%al, RSMap),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>

  rule <k>
    memLoadValue(Mem8:MInt):MemLoadValue ~> execinstr (scasb V:MInt, .Operands) => .
  ...</k>
  <regstate>
RSMap:Map => updateMap(RSMap,
  convToRegKeys(%rdi) |-> addMInt(getRegisterValue(%rdi, RSMap), mi( 64, 1))

  "CF" |-> (#ifMInt (notBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 0, 1), mi(1, 1))) #then mi(1, 1) #else mi(1, 0) #fi)
  "AF" |-> xorMInt( xorMInt( extractMInt(Mem8, 3, 4), extractMInt(V, 3, 4)), extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 4, 5))
  "OF" |-> (#ifMInt ((eqMInt( negMInt( extractMInt(Mem8, 0, 1)), mi(1, 1)) ==Bool eqMInt( extractMInt(V, 0, 1), mi(1, 1))) andBool (notBool (eqMInt( negMInt( extractMInt(Mem8, 0, 1)), mi(1, 1)) ==Bool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 1, 2), mi(1, 1))))) #then mi(1, 1) #else mi(1, 0) #fi)

  "ZF" |-> (#ifMInt eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 1, 9), mi(8, 0)) #then mi(1, 1) #else mi(1, 0) #fi)
  "SF" |-> extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt(Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 1, 2)
  "PF" |-> (#ifMInt (notBool (((((((eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 8, 9), mi(1, 1)) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 7, 8), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 6, 7), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 5, 6), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 4, 5), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 3, 4), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 2, 3), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 1, 2), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)

)
    </regstate>
    requires eqMInt({RSMap["DF"]}:>MInt, mi(1, 0))

  rule <k>
    memLoadValue(Mem8:MInt):MemLoadValue ~> execinstr (scasb V:MInt, .Operands) => .
  ...</k>
  <regstate>
RSMap:Map => updateMap(RSMap,
  convToRegKeys(%rdi) |-> subMInt(getRegisterValue(%rdi, RSMap), mi( 64, 1))

  "CF" |-> (#ifMInt (notBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 0, 1), mi(1, 1))) #then mi(1, 1) #else mi(1, 0) #fi)
  "AF" |-> xorMInt( xorMInt( extractMInt(Mem8, 3, 4), extractMInt(V, 3, 4)), extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 4, 5))
  "OF" |-> (#ifMInt ((eqMInt( negMInt( extractMInt(Mem8, 0, 1)), mi(1, 1)) ==Bool eqMInt( extractMInt(V, 0, 1), mi(1, 1))) andBool (notBool (eqMInt( negMInt( extractMInt(Mem8, 0, 1)), mi(1, 1)) ==Bool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 1, 2), mi(1, 1))))) #then mi(1, 1) #else mi(1, 0) #fi)

  "ZF" |-> (#ifMInt eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 1, 9), mi(8, 0)) #then mi(1, 1) #else mi(1, 0) #fi)
  "SF" |-> extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt(Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 1, 2)
  "PF" |-> (#ifMInt (notBool (((((((eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 8, 9), mi(1, 1)) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 7, 8), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 6, 7), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 5, 6), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 4, 5), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 3, 4), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 2, 3), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem8)), mi(9, 1)), concatenateMInt( mi(1, 0), V)), 1, 2), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)

)
    </regstate>
    requires eqMInt({RSMap["DF"]}:>MInt, mi(1, 1))
endmodule
