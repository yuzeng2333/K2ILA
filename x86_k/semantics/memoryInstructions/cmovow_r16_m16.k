// Autogenerated using stratification.
requires "x86-configuration.k"

module CMOVOW-R16-M16
  imports X86-CONFIGURATION

  context execinstr(cmovow:Opcode HOLE:Mem, R2:R16,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (cmovow:Opcode memOffset( MemOff:MInt):MemOffset, R2:R16,  .Operands) =>
      loadFromMemory( MemOff, 16) ~>
      execinstr (cmovow memOffset( MemOff), R2,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem16:MInt):MemLoadValue ~> execinstr (cmovow:Opcode memOffset( MemOff:MInt):MemOffset, R2:R16,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 48), (#ifMInt eqMInt(getFlag("OF", RSMap), mi(1,1)) #then Mem16 #else extractMInt( getParentValue(R2, RSMap), 48, 64) #fi))
      )
    </regstate>
endmodule
