// Autogenerated using stratification.
requires "x86-configuration.k"

module SCASQ
  imports X86-CONFIGURATION

  rule <k>
    execinstr (cmpsq  .Operands) =>
      loadFromMemory( getRegisterValue(%rdi, RSMap), 64) ~>
      execinstr (cmpsq   .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>

  rule <k>
    memLoadValue(Mem64_1:MInt):MemLoadValue ~> execinstr (cmpsq  .Operands) => 
        loadFromMemory( getRegisterValue(%rsi, RSMap), 64) ~> execinstr (cmpsq Mem64_1,  .Operands)                    
  ...</k>
    <regstate> RSMap:Map </regstate>


  rule <k>
    memLoadValue(Mem64_2:MInt):MemLoadValue ~> execinstr (cmpsq Mem64_1:MInt, .Operands) => .
  ...</k>
  <regstate>
RSMap:Map => updateMap(RSMap,
  convToRegKeys(%rdi) |-> addMInt(getRegisterValue(%rdi, RSMap), mi( 64, 8))
  convToRegKeys(%rsi) |-> addMInt(getRegisterValue(%rsi, RSMap), mi( 64, 8))

  "CF" |-> (#ifMInt (notBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 0, 1), mi(1, 1))) #then mi(1, 1) #else mi(1, 0) #fi)
  "AF" |-> xorMInt( xorMInt( extractMInt( Mem64_2, 59, 60), extractMInt( Mem64_1, 59, 60)), extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 60, 61))
  "OF" |-> (#ifMInt ((eqMInt( negMInt( extractMInt( Mem64_2, 0, 1)), mi(1, 1)) ==Bool eqMInt( extractMInt( Mem64_1, 0, 1), mi(1, 1))) andBool (notBool (eqMInt( negMInt( extractMInt( Mem64_2, 0, 1)), mi(1, 1)) ==Bool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 1, 2), mi(1, 1))))) #then mi(1, 1) #else mi(1, 0) #fi)

  "ZF" |-> (#ifMInt eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 1, 65), mi(64, 0)) #then mi(1, 1) #else mi(1, 0) #fi)
  "SF" |-> extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 1, 2)
  "PF" |-> (#ifMInt (notBool (((((((eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 64, 65), mi(1, 1)) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 63, 64), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 62, 63), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 61, 62), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 60, 61), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 59, 60), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 58, 59), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 57, 58), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)
)
    </regstate>
    requires eqMInt({RSMap["DF"]}:>MInt, mi(1, 0))

  rule <k>
    memLoadValue(Mem64_2:MInt):MemLoadValue ~> execinstr (cmpsq Mem64_1:MInt, .Operands) => .
  ...</k>
  <regstate>
RSMap:Map => updateMap(RSMap,
  convToRegKeys(%rdi) |-> subMInt(getRegisterValue(%rdi, RSMap), mi( 64, 8))
  convToRegKeys(%rsi) |-> subMInt(getRegisterValue(%rsi, RSMap), mi( 64, 8))

  "CF" |-> (#ifMInt (notBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 0, 1), mi(1, 1))) #then mi(1, 1) #else mi(1, 0) #fi)
  "AF" |-> xorMInt( xorMInt( extractMInt( Mem64_2, 59, 60), extractMInt( Mem64_1, 59, 60)), extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 60, 61))
  "OF" |-> (#ifMInt ((eqMInt( negMInt( extractMInt( Mem64_2, 0, 1)), mi(1, 1)) ==Bool eqMInt( extractMInt( Mem64_1, 0, 1), mi(1, 1))) andBool (notBool (eqMInt( negMInt( extractMInt( Mem64_2, 0, 1)), mi(1, 1)) ==Bool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 1, 2), mi(1, 1))))) #then mi(1, 1) #else mi(1, 0) #fi)

  "ZF" |-> (#ifMInt eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 1, 65), mi(64, 0)) #then mi(1, 1) #else mi(1, 0) #fi)
  "SF" |-> extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 1, 2)
  "PF" |-> (#ifMInt (notBool (((((((eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 64, 65), mi(1, 1)) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 63, 64), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 62, 63), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 61, 62), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 60, 61), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 59, 60), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 58, 59), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem64_2)), mi(65, 1)), concatenateMInt( mi(1, 0), Mem64_1)), 57, 58), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)
)
    </regstate>
    requires eqMInt({RSMap["DF"]}:>MInt, mi(1, 1))
endmodule
