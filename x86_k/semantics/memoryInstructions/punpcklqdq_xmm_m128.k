// Autogenerated using stratification.
requires "x86-configuration.k"

module PUNPCKLQDQ-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(punpcklqdq:Opcode HOLE:Mem, R2:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (punpcklqdq:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (punpcklqdq memOffset( MemOff), R2:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (punpcklqdq:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( extractMInt( Mem128, 64, 128), extractMInt( getParentValue(R2, RSMap), 192, 256)))
      )
    </regstate>
endmodule
