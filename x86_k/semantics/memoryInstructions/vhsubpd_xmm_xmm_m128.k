// Autogenerated using stratification.
requires "x86-configuration.k"

module VHSUBPD-XMM-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(vhsubpd:Opcode HOLE:Mem, R2:Xmm, R3:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vhsubpd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (vhsubpd memOffset( MemOff), R2:Xmm, R3:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (vhsubpd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(128, 0), concatenateMInt( sub_double(extractMInt( Mem128, 64, 128), extractMInt( Mem128, 0, 64)), sub_double(extractMInt( getParentValue(R2, RSMap), 192, 256), extractMInt( getParentValue(R2, RSMap), 128, 192))))
      )
    </regstate>
endmodule
