// Autogenerated using stratification.
requires "x86-configuration.k"

module VFNMSUB231SD-XMM-XMM-M64
  imports X86-CONFIGURATION

  context execinstr(vfnmsub231sd:Opcode HOLE:Mem, R2:Xmm, R3:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vfnmsub231sd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 64) ~>
      execinstr (vfnmsub231sd memOffset( MemOff), R2:Xmm, R3:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem64:MInt):MemLoadValue ~> execinstr (vfnmsub231sd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(128, 0), concatenateMInt( extractMInt( getParentValue(R3, RSMap), 128, 192), vfmsub132_double(vfnmsub132_double((#ifMInt eqMInt( mincmp_double(concatenateMInt( mi(32, 0), extractMInt( getParentValue(R2, RSMap), 160, 192)), concatenateMInt( mi(32, 0), extractMInt( getParentValue(R2, RSMap), 224, 256))), mi(1, 1)) #then concatenateMInt( mi(32, 0), extractMInt( getParentValue(R2, RSMap), 160, 192)) #else concatenateMInt( mi(32, 0), extractMInt( getParentValue(R2, RSMap), 224, 256)) #fi), extractMInt( getParentValue(R2, RSMap), 192, 256), (#ifMInt eqMInt( mincmp_double(concatenateMInt( mi(32, 0), extractMInt( getParentValue(R2, RSMap), 160, 192)), concatenateMInt( mi(32, 0), extractMInt( getParentValue(R2, RSMap), 224, 256))), mi(1, 1)) #then concatenateMInt( mi(32, 0), extractMInt( getParentValue(R2, RSMap), 160, 192)) #else concatenateMInt( mi(32, 0), extractMInt( getParentValue(R2, RSMap), 224, 256)) #fi)), extractMInt( getParentValue(R3, RSMap), 192, 256), Mem64)))
      )
    </regstate>
endmodule
