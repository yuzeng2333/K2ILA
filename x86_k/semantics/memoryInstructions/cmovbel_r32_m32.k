// Autogenerated using stratification.
requires "x86-configuration.k"

module CMOVBEL-R32-M32
  imports X86-CONFIGURATION
  rule <k>
    execinstr (cmovbe:Opcode M:Mem, R2:R32,  .Operands) =>  execinstr (cmovbel:Opcode M:Mem, R2:R32,  .Operands)
  ...</k>

  context execinstr(cmovbel:Opcode HOLE:Mem, R2:R32,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (cmovbel:Opcode memOffset( MemOff:MInt):MemOffset, R2:R32,  .Operands) =>
      loadFromMemory( MemOff, 32) ~>
      execinstr (cmovbel memOffset( MemOff), R2,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem32:MInt):MemLoadValue ~> execinstr (cmovbel:Opcode memOffset( MemOff:MInt):MemOffset, R2:R32,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( mi(32, 0), (#ifMInt (eqMInt(getFlag("CF", RSMap), mi(1,1)) orBool eqMInt(getFlag("ZF", RSMap), mi(1,1))) #then Mem32 #else extractMInt( getParentValue(R2, RSMap), 32, 64) #fi))
      )
    </regstate>
endmodule
