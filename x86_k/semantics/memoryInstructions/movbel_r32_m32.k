// Autogenerated using stratification.
requires "x86-configuration.k"

module MOVBEL-R32-M32
  imports X86-CONFIGURATION
  rule <k>
    execinstr (movbe:Opcode M:Mem, R2:R32,  .Operands) => execinstr (movbel:Opcode M:Mem, R2:R32,  .Operands) 
  ...</k>

  context execinstr(movbel:Opcode HOLE:Mem, R2:R32,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (movbel:Opcode memOffset( MemOff:MInt):MemOffset, R2:R32,  .Operands) =>
      loadFromMemory( MemOff, 32) ~>
      execinstr (movbel memOffset( MemOff), R2,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem32:MInt):MemLoadValue ~> execinstr (movbel:Opcode memOffset( MemOff:MInt):MemOffset, R2:R32,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( mi(32, 0), concatenateMInt( concatenateMInt( concatenateMInt( extractMInt( Mem32, 24, 32), extractMInt( Mem32, 16, 24)), extractMInt( Mem32, 8, 16)), extractMInt( Mem32, 0, 8)))
      )
    </regstate>
endmodule
