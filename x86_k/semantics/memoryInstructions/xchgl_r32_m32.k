// Autogenerated using stratification.
requires "x86-configuration.k"

module XCHGL-R32-M32
  imports X86-CONFIGURATION

  context execinstr(xchgl:Opcode HOLE:Mem, R2:R32,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (xchgl:Opcode memOffset( MemOff:MInt):MemOffset, R2:R32,  .Operands) =>
      loadFromMemory( MemOff, 32) ~>
      execinstr (xchgl memOffset( MemOff), R2,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem32:MInt):MemLoadValue ~> execinstr (xchgl:Opcode memOffset( MemOff:MInt):MemOffset, R2:R32,  .Operands) =>
      
            storeToMemory(
              extractMInt( getParentValue(R2, RSMap), 32, 64),
              MemOff,
              32
            )
          
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( mi(32, 0), Mem32)
      )
    </regstate>
endmodule
