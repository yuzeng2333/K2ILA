// Autogenerated using stratification.
requires "x86-configuration.k"

module PUNPCKHDQ-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(punpckhdq:Opcode HOLE:Mem, R2:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (punpckhdq:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (punpckhdq memOffset( MemOff), R2:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (punpckhdq:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( concatenateMInt( extractMInt( Mem128, 0, 32), extractMInt( getParentValue(R2, RSMap), 128, 160)), concatenateMInt( extractMInt( Mem128, 32, 64), extractMInt( getParentValue(R2, RSMap), 160, 192))))
      )
    </regstate>
endmodule
