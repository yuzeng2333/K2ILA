// Autogenerated using stratification.
requires "x86-configuration.k"

module UNPCKHPD-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(unpckhpd:Opcode HOLE:Mem, R2:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (unpckhpd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (unpckhpd memOffset( MemOff), R2:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (unpckhpd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( extractMInt( Mem128, 0, 64), extractMInt( getParentValue(R2, RSMap), 128, 192)))
      )
    </regstate>
endmodule
