// Autogenerated using stratification.
requires "x86-configuration.k"

module LZCNTW-R16-M16
  imports X86-CONFIGURATION

  context execinstr(lzcntw:Opcode HOLE:Mem, R2:R16,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (lzcntw:Opcode memOffset( MemOff:MInt):MemOffset, R2:R16,  .Operands) =>
      loadFromMemory( MemOff, 16) ~>
      execinstr (lzcntw memOffset( MemOff), R2,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem16:MInt):MemLoadValue ~> execinstr (lzcntw:Opcode memOffset( MemOff:MInt):MemOffset, R2:R16,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 48), (#ifMInt eqMInt( extractMInt( Mem16, 0, 1), mi(1, 1)) #then mi(16, 0) #else (#ifMInt eqMInt( extractMInt( Mem16, 1, 2), mi(1, 1)) #then mi(16, 1) #else (#ifMInt eqMInt( extractMInt( Mem16, 2, 3), mi(1, 1)) #then mi(16, 2) #else (#ifMInt eqMInt( extractMInt( Mem16, 3, 4), mi(1, 1)) #then mi(16, 3) #else (#ifMInt eqMInt( extractMInt( Mem16, 4, 5), mi(1, 1)) #then mi(16, 4) #else (#ifMInt eqMInt( extractMInt( Mem16, 5, 6), mi(1, 1)) #then mi(16, 5) #else (#ifMInt eqMInt( extractMInt( Mem16, 6, 7), mi(1, 1)) #then mi(16, 6) #else (#ifMInt eqMInt( extractMInt( Mem16, 7, 8), mi(1, 1)) #then mi(16, 7) #else (#ifMInt eqMInt( extractMInt( Mem16, 8, 9), mi(1, 1)) #then mi(16, 8) #else (#ifMInt eqMInt( extractMInt( Mem16, 9, 10), mi(1, 1)) #then mi(16, 9) #else (#ifMInt eqMInt( extractMInt( Mem16, 10, 11), mi(1, 1)) #then mi(16, 10) #else (#ifMInt eqMInt( extractMInt( Mem16, 11, 12), mi(1, 1)) #then mi(16, 11) #else (#ifMInt eqMInt( extractMInt( Mem16, 12, 13), mi(1, 1)) #then mi(16, 12) #else (#ifMInt eqMInt( extractMInt( Mem16, 13, 14), mi(1, 1)) #then mi(16, 13) #else (#ifMInt eqMInt( extractMInt( Mem16, 14, 15), mi(1, 1)) #then mi(16, 14) #else (#ifMInt eqMInt( extractMInt( Mem16, 15, 16), mi(1, 1)) #then mi(16, 15) #else mi(16, 16) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi))

"CF" |-> (#ifMInt eqMInt( (#ifMInt eqMInt( extractMInt( Mem16, 0, 1), mi(1, 1)) #then mi(16, 0) #else (#ifMInt eqMInt( extractMInt( Mem16, 1, 2), mi(1, 1)) #then mi(16, 1) #else (#ifMInt eqMInt( extractMInt( Mem16, 2, 3), mi(1, 1)) #then mi(16, 2) #else (#ifMInt eqMInt( extractMInt( Mem16, 3, 4), mi(1, 1)) #then mi(16, 3) #else (#ifMInt eqMInt( extractMInt( Mem16, 4, 5), mi(1, 1)) #then mi(16, 4) #else (#ifMInt eqMInt( extractMInt( Mem16, 5, 6), mi(1, 1)) #then mi(16, 5) #else (#ifMInt eqMInt( extractMInt( Mem16, 6, 7), mi(1, 1)) #then mi(16, 6) #else (#ifMInt eqMInt( extractMInt( Mem16, 7, 8), mi(1, 1)) #then mi(16, 7) #else (#ifMInt eqMInt( extractMInt( Mem16, 8, 9), mi(1, 1)) #then mi(16, 8) #else (#ifMInt eqMInt( extractMInt( Mem16, 9, 10), mi(1, 1)) #then mi(16, 9) #else (#ifMInt eqMInt( extractMInt( Mem16, 10, 11), mi(1, 1)) #then mi(16, 10) #else (#ifMInt eqMInt( extractMInt( Mem16, 11, 12), mi(1, 1)) #then mi(16, 11) #else (#ifMInt eqMInt( extractMInt( Mem16, 12, 13), mi(1, 1)) #then mi(16, 12) #else (#ifMInt eqMInt( extractMInt( Mem16, 13, 14), mi(1, 1)) #then mi(16, 13) #else (#ifMInt eqMInt( extractMInt( Mem16, 14, 15), mi(1, 1)) #then mi(16, 14) #else (#ifMInt eqMInt( extractMInt( Mem16, 15, 16), mi(1, 1)) #then mi(16, 15) #else mi(16, 16) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi), mi(16, 16)) #then mi(1, 1) #else mi(1, 0) #fi)

"PF" |-> (undefMInt)

"AF" |-> (undefMInt)

"ZF" |-> (#ifMInt eqMInt( (#ifMInt eqMInt( extractMInt( Mem16, 0, 1), mi(1, 1)) #then mi(16, 0) #else (#ifMInt eqMInt( extractMInt( Mem16, 1, 2), mi(1, 1)) #then mi(16, 1) #else (#ifMInt eqMInt( extractMInt( Mem16, 2, 3), mi(1, 1)) #then mi(16, 2) #else (#ifMInt eqMInt( extractMInt( Mem16, 3, 4), mi(1, 1)) #then mi(16, 3) #else (#ifMInt eqMInt( extractMInt( Mem16, 4, 5), mi(1, 1)) #then mi(16, 4) #else (#ifMInt eqMInt( extractMInt( Mem16, 5, 6), mi(1, 1)) #then mi(16, 5) #else (#ifMInt eqMInt( extractMInt( Mem16, 6, 7), mi(1, 1)) #then mi(16, 6) #else (#ifMInt eqMInt( extractMInt( Mem16, 7, 8), mi(1, 1)) #then mi(16, 7) #else (#ifMInt eqMInt( extractMInt( Mem16, 8, 9), mi(1, 1)) #then mi(16, 8) #else (#ifMInt eqMInt( extractMInt( Mem16, 9, 10), mi(1, 1)) #then mi(16, 9) #else (#ifMInt eqMInt( extractMInt( Mem16, 10, 11), mi(1, 1)) #then mi(16, 10) #else (#ifMInt eqMInt( extractMInt( Mem16, 11, 12), mi(1, 1)) #then mi(16, 11) #else (#ifMInt eqMInt( extractMInt( Mem16, 12, 13), mi(1, 1)) #then mi(16, 12) #else (#ifMInt eqMInt( extractMInt( Mem16, 13, 14), mi(1, 1)) #then mi(16, 13) #else (#ifMInt eqMInt( extractMInt( Mem16, 14, 15), mi(1, 1)) #then mi(16, 14) #else (#ifMInt eqMInt( extractMInt( Mem16, 15, 16), mi(1, 1)) #then mi(16, 15) #else mi(16, 16) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi) #fi), mi(16, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> (undefMInt)

"OF" |-> (undefMInt)
      )
    </regstate>
endmodule
