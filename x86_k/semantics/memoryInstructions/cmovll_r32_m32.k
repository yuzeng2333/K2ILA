// Autogenerated using stratification.
requires "x86-configuration.k"

module CMOVLL-R32-M32
  imports X86-CONFIGURATION

  context execinstr(cmovll:Opcode HOLE:Mem, R2:R32,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (cmovll:Opcode memOffset( MemOff:MInt):MemOffset, R2:R32,  .Operands) =>
      loadFromMemory( MemOff, 32) ~>
      execinstr (cmovll memOffset( MemOff), R2,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem32:MInt):MemLoadValue ~> execinstr (cmovll:Opcode memOffset( MemOff:MInt):MemOffset, R2:R32,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( mi(32, 0), (#ifMInt (notBool (eqMInt(getFlag("SF", RSMap), mi(1,1)) ==Bool eqMInt(getFlag("OF", RSMap), mi(1,1)))) #then Mem32 #else extractMInt( getParentValue(R2, RSMap), 32, 64) #fi))
      )
    </regstate>
endmodule
