// Autogenerated using stratification.
requires "x86-configuration.k"

module MOVSBW-R16-M8
  imports X86-CONFIGURATION

  context execinstr(movsbw:Opcode HOLE:Mem, R2:R16,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (movsbw:Opcode memOffset( MemOff:MInt):MemOffset, R2:R16,  .Operands) =>
      loadFromMemory( MemOff, 8) ~>
      execinstr (movsbw memOffset( MemOff), R2,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem8:MInt):MemLoadValue ~> execinstr (movsbw:Opcode memOffset( MemOff:MInt):MemOffset, R2:R16,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 48), mi(16, svalueMInt(Mem8)))
      )
    </regstate>
endmodule
