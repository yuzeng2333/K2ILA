// Autogenerated using stratification.
requires "x86-configuration.k"

module CMOVNGQ-R64-M64
  imports X86-CONFIGURATION

  context execinstr(cmovngq:Opcode HOLE:Mem, R2:R64,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (cmovngq:Opcode memOffset( MemOff:MInt):MemOffset, R2:R64,  .Operands) =>
      loadFromMemory( MemOff, 64) ~>
      execinstr (cmovngq memOffset( MemOff), R2,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem64:MInt):MemLoadValue ~> execinstr (cmovngq:Opcode memOffset( MemOff:MInt):MemOffset, R2:R64,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> (#ifMInt (eqMInt(getFlag("ZF", RSMap), mi(1,1)) orBool (notBool (eqMInt(getFlag("SF", RSMap), mi(1,1)) ==Bool eqMInt(getFlag("OF", RSMap), mi(1,1))))) #then Mem64 #else getParentValue(R2, RSMap) #fi)
      )
    </regstate>
endmodule
