// Autogenerated using stratification.
requires "x86-configuration.k"

module PSUBQ-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(psubq:Opcode HOLE:Mem, R2:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (psubq:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (psubq memOffset( MemOff), R2:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (psubq:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 128, 192), extractMInt( Mem128, 0, 64)), subMInt( extractMInt( getParentValue(R2, RSMap), 192, 256), extractMInt( Mem128, 64, 128))))
      )
    </regstate>
endmodule
