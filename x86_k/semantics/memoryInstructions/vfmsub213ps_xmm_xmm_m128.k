// Autogenerated using stratification.
requires "x86-configuration.k"

module VFMSUB213PS-XMM-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(vfmsub213ps:Opcode HOLE:Mem, R2:Xmm, R3:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vfmsub213ps:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (vfmsub213ps memOffset( MemOff), R2:Xmm, R3:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (vfmsub213ps:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(128, 0), concatenateMInt( vfmsub132_single(extractMInt( getParentValue(R2, RSMap), 128, 160), extractMInt( Mem128, 0, 32), extractMInt( getParentValue(R3, RSMap), 128, 160)), concatenateMInt( vfmsub132_single(extractMInt( getParentValue(R2, RSMap), 160, 192), extractMInt( Mem128, 32, 64), extractMInt( getParentValue(R3, RSMap), 160, 192)), concatenateMInt( vfmsub132_single(extractMInt( getParentValue(R2, RSMap), 192, 224), extractMInt( Mem128, 64, 96), extractMInt( getParentValue(R3, RSMap), 192, 224)), vfmsub132_single(extractMInt( getParentValue(R2, RSMap), 224, 256), extractMInt( Mem128, 96, 128), extractMInt( getParentValue(R3, RSMap), 224, 256))))))
      )
    </regstate>
endmodule
