// Autogenerated using stratification.
requires "x86-configuration.k"

module CMPSW
  imports X86-CONFIGURATION

  rule <k>
    execinstr (cmpsw  .Operands) =>
      loadFromMemory( getRegisterValue(%rdi, RSMap), 16) ~>
      execinstr (cmpsw   .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>

  rule <k>
    memLoadValue(Mem16_1:MInt):MemLoadValue ~> execinstr (cmpsw  .Operands) => 
        loadFromMemory( getRegisterValue(%rsi, RSMap), 16) ~> execinstr (cmpsw Mem16_1,  .Operands)                    
  ...</k>
    <regstate> RSMap:Map </regstate>


  rule <k>
    memLoadValue(Mem16_2:MInt):MemLoadValue ~> execinstr (cmpsw Mem16_1:MInt, .Operands) => .
  ...</k>
  <regstate>
RSMap:Map => updateMap(RSMap,
  convToRegKeys(%rdi) |-> addMInt(getRegisterValue(%rdi, RSMap), mi( 64, 2))
  convToRegKeys(%rsi) |-> addMInt(getRegisterValue(%rsi, RSMap), mi( 64, 2))

  "CF" |-> (#ifMInt (notBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 0, 1), mi(1, 1))) #then mi(1, 1) #else mi(1, 0) #fi)
  "AF" |-> xorMInt( xorMInt( extractMInt(Mem16_2, 11, 12), extractMInt(Mem16_1, 11, 12)), extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 12, 13))
  "OF" |-> (#ifMInt ((eqMInt( negMInt( extractMInt(Mem16_2, 0, 1)), mi(1, 1)) ==Bool eqMInt( extractMInt(Mem16_1 , 0, 1), mi(1, 1))) andBool (notBool (eqMInt( negMInt( extractMInt(Mem16_2, 0, 1)), mi(1, 1)) ==Bool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 1, 2), mi(1, 1))))) #then mi(1, 1) #else mi(1, 0) #fi)

  "ZF" |-> (#ifMInt eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 1, 17), mi(16, 0)) #then mi(1, 1) #else mi(1, 0) #fi)
  "SF" |-> extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 1, 2)
  "PF" |-> (#ifMInt (notBool (((((((eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 16, 17), mi(1, 1)) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 15, 16), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 14, 15), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 13, 14), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 12, 13), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 11, 12), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 10, 11), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 9, 10), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)
)
    </regstate>
    requires eqMInt({RSMap["DF"]}:>MInt, mi(1, 0))

 rule <k>
    memLoadValue(Mem16_2:MInt):MemLoadValue ~> execinstr (cmpsw Mem16_1:MInt, .Operands) => .
  ...</k>
  <regstate>
RSMap:Map => updateMap(RSMap,
  convToRegKeys(%rdi) |-> subMInt(getRegisterValue(%rdi, RSMap), mi( 64, 2))
  convToRegKeys(%rsi) |-> subMInt(getRegisterValue(%rsi, RSMap), mi( 64, 2))

  "CF" |-> (#ifMInt (notBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 0, 1), mi(1, 1))) #then mi(1, 1) #else mi(1, 0) #fi)
  "AF" |-> xorMInt( xorMInt( extractMInt(Mem16_2, 11, 12), extractMInt(Mem16_1, 11, 12)), extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 12, 13))
  "OF" |-> (#ifMInt ((eqMInt( negMInt( extractMInt(Mem16_2, 0, 1)), mi(1, 1)) ==Bool eqMInt( extractMInt(Mem16_1 , 0, 1), mi(1, 1))) andBool (notBool (eqMInt( negMInt( extractMInt(Mem16_2, 0, 1)), mi(1, 1)) ==Bool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 1, 2), mi(1, 1))))) #then mi(1, 1) #else mi(1, 0) #fi)

  "ZF" |-> (#ifMInt eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 1, 17), mi(16, 0)) #then mi(1, 1) #else mi(1, 0) #fi)
  "SF" |-> extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 1, 2)
  "PF" |-> (#ifMInt (notBool (((((((eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 16, 17), mi(1, 1)) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 15, 16), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 14, 15), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 13, 14), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 12, 13), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 11, 12), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 10, 11), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( Mem16_2)), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16_1)), 9, 10), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)
)
    </regstate>
    requires eqMInt({RSMap["DF"]}:>MInt, mi(1, 1))
endmodule
