// Autogenerated using stratification.
requires "x86-configuration.k"

module VLDDQU-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(vlddqu:Opcode HOLE:Mem, R2:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vlddqu:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (vlddqu memOffset( MemOff), R2:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (vlddqu:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( mi(128, 0), Mem128)
      )
    </regstate>
endmodule
