// Autogenerated using stratification.
requires "x86-configuration.k"

module VPSRLVD-YMM-YMM-M256
  imports X86-CONFIGURATION

  context execinstr(vpsrlvd:Opcode HOLE:Mem, R2:Ymm, R3:Ymm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vpsrlvd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      loadFromMemory( MemOff, 256) ~>
      execinstr (vpsrlvd memOffset( MemOff), R2:Ymm, R3:Ymm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem256:MInt):MemLoadValue ~> execinstr (vpsrlvd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( lshrMInt( extractMInt( getParentValue(R2, RSMap), 0, 32), uvalueMInt(extractMInt( Mem256, 0, 32))), concatenateMInt( lshrMInt( extractMInt( getParentValue(R2, RSMap), 32, 64), uvalueMInt(extractMInt( Mem256, 32, 64))), concatenateMInt( lshrMInt( extractMInt( getParentValue(R2, RSMap), 64, 96), uvalueMInt(extractMInt( Mem256, 64, 96))), concatenateMInt( lshrMInt( extractMInt( getParentValue(R2, RSMap), 96, 128), uvalueMInt(extractMInt( Mem256, 96, 128))), concatenateMInt( lshrMInt( extractMInt( getParentValue(R2, RSMap), 128, 160), uvalueMInt(extractMInt( Mem256, 128, 160))), concatenateMInt( lshrMInt( extractMInt( getParentValue(R2, RSMap), 160, 192), uvalueMInt(extractMInt( Mem256, 160, 192))), concatenateMInt( lshrMInt( extractMInt( getParentValue(R2, RSMap), 192, 224), uvalueMInt(extractMInt( Mem256, 192, 224))), lshrMInt( extractMInt( getParentValue(R2, RSMap), 224, 256), uvalueMInt(extractMInt( Mem256, 224, 256))))))))))
      )
    </regstate>
endmodule
