// Autogenerated using stratification.
requires "x86-configuration.k"

module CMOVNOW-R16-M16
  imports X86-CONFIGURATION

  context execinstr(cmovnow:Opcode HOLE:Mem, R2:R16,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (cmovnow:Opcode memOffset( MemOff:MInt):MemOffset, R2:R16,  .Operands) =>
      loadFromMemory( MemOff, 16) ~>
      execinstr (cmovnow memOffset( MemOff), R2,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem16:MInt):MemLoadValue ~> execinstr (cmovnow:Opcode memOffset( MemOff:MInt):MemOffset, R2:R16,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 48), (#ifMInt (notBool eqMInt(getFlag("OF", RSMap), mi(1,1))) #then Mem16 #else extractMInt( getParentValue(R2, RSMap), 48, 64) #fi))
      )
    </regstate>
endmodule
