// Autogenerated using stratification.
requires "x86-configuration.k"

module PUNPCKHWD-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(punpckhwd:Opcode HOLE:Mem, R2:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (punpckhwd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (punpckhwd memOffset( MemOff), R2:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (punpckhwd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( concatenateMInt( extractMInt( Mem128, 0, 16), extractMInt( getParentValue(R2, RSMap), 128, 144)), concatenateMInt( concatenateMInt( extractMInt( Mem128, 16, 32), extractMInt( getParentValue(R2, RSMap), 144, 160)), concatenateMInt( concatenateMInt( extractMInt( Mem128, 32, 48), extractMInt( getParentValue(R2, RSMap), 160, 176)), concatenateMInt( extractMInt( Mem128, 48, 64), extractMInt( getParentValue(R2, RSMap), 176, 192))))))
      )
    </regstate>
endmodule
