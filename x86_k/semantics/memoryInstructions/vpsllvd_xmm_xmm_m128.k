// Autogenerated using stratification.
requires "x86-configuration.k"

module VPSLLVD-XMM-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(vpsllvd:Opcode HOLE:Mem, R2:Xmm, R3:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vpsllvd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (vpsllvd memOffset( MemOff), R2:Xmm, R3:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (vpsllvd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(128, 0), concatenateMInt( shiftLeftMInt( extractMInt( getParentValue(R2, RSMap), 128, 160), uvalueMInt(extractMInt( Mem128, 0, 32))), concatenateMInt( shiftLeftMInt( extractMInt( getParentValue(R2, RSMap), 160, 192), uvalueMInt(extractMInt( Mem128, 32, 64))), concatenateMInt( shiftLeftMInt( extractMInt( getParentValue(R2, RSMap), 192, 224), uvalueMInt(extractMInt( Mem128, 64, 96))), shiftLeftMInt( extractMInt( getParentValue(R2, RSMap), 224, 256), uvalueMInt(extractMInt( Mem128, 96, 128)))))))
      )
    </regstate>
endmodule
