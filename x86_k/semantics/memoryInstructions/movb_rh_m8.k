// Autogenerated using stratification.
requires "x86-configuration.k"

module MOVB-RH-M8
  imports X86-CONFIGURATION

  context execinstr(movb:Opcode HOLE:Mem, R2:Rh,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (movb:Opcode memOffset( MemOff:MInt):MemOffset, R2:Rh,  .Operands) =>
      loadFromMemory( MemOff, 8) ~>
      execinstr (movb memOffset( MemOff), R2:Rh,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem8:MInt):MemLoadValue ~> execinstr (movb:Opcode memOffset( MemOff:MInt):MemOffset, R2:Rh,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 48), Mem8), extractMInt( getParentValue(R2, RSMap), 56, 64))
      )
    </regstate>
endmodule
