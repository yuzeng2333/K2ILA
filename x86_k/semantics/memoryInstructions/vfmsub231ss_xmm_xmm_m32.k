// Autogenerated using stratification.
requires "x86-configuration.k"

module VFMSUB231SS-XMM-XMM-M32
  imports X86-CONFIGURATION

  context execinstr(vfmsub231ss:Opcode HOLE:Mem, R2:Xmm, R3:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vfmsub231ss:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 32) ~>
      execinstr (vfmsub231ss memOffset( MemOff), R2:Xmm, R3:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem32:MInt):MemLoadValue ~> execinstr (vfmsub231ss:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(128, 0), concatenateMInt( extractMInt( getParentValue(R3, RSMap), 128, 224), vfmsub132_single(extractMInt( getParentValue(R2, RSMap), 224, 256), extractMInt( getParentValue(R3, RSMap), 224, 256), Mem32)))
      )
    </regstate>
endmodule
