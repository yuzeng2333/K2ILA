// Autogenerated using stratification.
requires "x86-configuration.k"

module PABSD-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(pabsd:Opcode HOLE:Mem, R2:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (pabsd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (pabsd memOffset( MemOff), R2:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (pabsd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( (#ifMInt ugtMInt( extractMInt( Mem128, 0, 32), mi(32, 2147483647)) #then addMInt(mi(32, 1), negMInt( extractMInt( Mem128, 0, 32))) #else extractMInt( Mem128, 0, 32) #fi), concatenateMInt( (#ifMInt ugtMInt( extractMInt( Mem128, 32, 64), mi(32, 2147483647)) #then addMInt(mi(32, 1), negMInt( extractMInt( Mem128, 32, 64))) #else extractMInt( Mem128, 32, 64) #fi), concatenateMInt( (#ifMInt ugtMInt( extractMInt( Mem128, 64, 96), mi(32, 2147483647)) #then addMInt(mi(32, 1), negMInt( extractMInt( Mem128, 64, 96))) #else extractMInt( Mem128, 64, 96) #fi), (#ifMInt ugtMInt( extractMInt( Mem128, 96, 128), mi(32, 2147483647)) #then addMInt(mi(32, 1), negMInt( extractMInt( Mem128, 96, 128))) #else extractMInt( Mem128, 96, 128) #fi)))))
      )
    </regstate>
endmodule
