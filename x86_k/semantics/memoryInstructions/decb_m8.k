// Autogenerated using stratification.
requires "x86-configuration.k"

module DECB-M8
  imports X86-CONFIGURATION

  context execinstr(decb:Opcode HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (decb:Opcode memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 8) ~>
      execinstr (decb memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem8:MInt):MemLoadValue ~> execinstr (decb:Opcode memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              subMInt( Mem8, mi(8, 1)),
              MemOff,
              8
            )
          
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
"PF" |-> (#ifMInt (notBool (((((((eqMInt( extractMInt( subMInt( Mem8, mi(8, 1)), 7, 8), mi(1, 1)) xorBool eqMInt( extractMInt( subMInt( Mem8, mi(8, 1)), 6, 7), mi(1, 1))) xorBool eqMInt( extractMInt( subMInt( Mem8, mi(8, 1)), 5, 6), mi(1, 1))) xorBool eqMInt( extractMInt( subMInt( Mem8, mi(8, 1)), 4, 5), mi(1, 1))) xorBool eqMInt( extractMInt( subMInt( Mem8, mi(8, 1)), 3, 4), mi(1, 1))) xorBool eqMInt( extractMInt( subMInt( Mem8, mi(8, 1)), 2, 3), mi(1, 1))) xorBool eqMInt( extractMInt( subMInt( Mem8, mi(8, 1)), 1, 2), mi(1, 1))) xorBool eqMInt( extractMInt( subMInt( Mem8, mi(8, 1)), 0, 1), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)

"AF" |-> (#ifMInt eqMInt( extractMInt( Mem8, 4, 8), mi(4, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"ZF" |-> (#ifMInt eqMInt( subMInt( Mem8, mi(8, 1)), mi(8, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> extractMInt( subMInt( Mem8, mi(8, 1)), 0, 1)

"OF" |-> (#ifMInt (eqMInt( extractMInt( Mem8, 0, 1), mi(1, 1)) andBool eqMInt( extractMInt( Mem8, 1, 8), mi(7, 0))) #then mi(1, 1) #else mi(1, 0) #fi)
      )
    </regstate>
endmodule
