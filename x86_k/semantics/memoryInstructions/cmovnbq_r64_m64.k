// Autogenerated using stratification.
requires "x86-configuration.k"

module CMOVNBQ-R64-M64
  imports X86-CONFIGURATION

  context execinstr(cmovnbq:Opcode HOLE:Mem, R2:R64,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (cmovnbq:Opcode memOffset( MemOff:MInt):MemOffset, R2:R64,  .Operands) =>
      loadFromMemory( MemOff, 64) ~>
      execinstr (cmovnbq memOffset( MemOff), R2,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem64:MInt):MemLoadValue ~> execinstr (cmovnbq:Opcode memOffset( MemOff:MInt):MemOffset, R2:R64,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> (#ifMInt (notBool eqMInt(getFlag("CF", RSMap), mi(1,1))) #then Mem64 #else getParentValue(R2, RSMap) #fi)
      )
    </regstate>
endmodule
