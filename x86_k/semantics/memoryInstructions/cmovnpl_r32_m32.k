// Autogenerated using stratification.
requires "x86-configuration.k"

module CMOVNPL-R32-M32
  imports X86-CONFIGURATION

  context execinstr(cmovnpl:Opcode HOLE:Mem, R2:R32,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (cmovnpl:Opcode memOffset( MemOff:MInt):MemOffset, R2:R32,  .Operands) =>
      loadFromMemory( MemOff, 32) ~>
      execinstr (cmovnpl memOffset( MemOff), R2,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem32:MInt):MemLoadValue ~> execinstr (cmovnpl:Opcode memOffset( MemOff:MInt):MemOffset, R2:R32,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( mi(32, 0), (#ifMInt (notBool eqMInt(getFlag("PF", RSMap), mi(1,1))) #then Mem32 #else extractMInt( getParentValue(R2, RSMap), 32, 64) #fi))
      )
    </regstate>
endmodule
