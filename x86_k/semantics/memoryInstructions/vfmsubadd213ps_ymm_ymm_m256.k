// Autogenerated using stratification.
requires "x86-configuration.k"

module VFMSUBADD213PS-YMM-YMM-M256
  imports X86-CONFIGURATION

  context execinstr(vfmsubadd213ps:Opcode HOLE:Mem, R2:Ymm, R3:Ymm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vfmsubadd213ps:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      loadFromMemory( MemOff, 256) ~>
      execinstr (vfmsubadd213ps memOffset( MemOff), R2:Ymm, R3:Ymm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem256:MInt):MemLoadValue ~> execinstr (vfmsubadd213ps:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( concatenateMInt( vfmsub213_single(extractMInt( getParentValue(R3, RSMap), 0, 32), extractMInt( getParentValue(R2, RSMap), 0, 32), extractMInt( Mem256, 0, 32)), vfmadd213_single(extractMInt( getParentValue(R3, RSMap), 32, 64), extractMInt( getParentValue(R2, RSMap), 32, 64), extractMInt( Mem256, 32, 64))), concatenateMInt( concatenateMInt( vfmsub213_single(extractMInt( getParentValue(R3, RSMap), 64, 96), extractMInt( getParentValue(R2, RSMap), 64, 96), extractMInt( Mem256, 64, 96)), vfmadd213_single(extractMInt( getParentValue(R3, RSMap), 96, 128), extractMInt( getParentValue(R2, RSMap), 96, 128), extractMInt( Mem256, 96, 128))), concatenateMInt( concatenateMInt( vfmsub213_single(extractMInt( getParentValue(R3, RSMap), 128, 160), extractMInt( getParentValue(R2, RSMap), 128, 160), extractMInt( Mem256, 128, 160)), vfmadd213_single(extractMInt( getParentValue(R3, RSMap), 160, 192), extractMInt( getParentValue(R2, RSMap), 160, 192), extractMInt( Mem256, 160, 192))), concatenateMInt( vfmsub213_single(extractMInt( getParentValue(R3, RSMap), 192, 224), extractMInt( getParentValue(R2, RSMap), 192, 224), extractMInt( Mem256, 192, 224)), vfmadd213_single(extractMInt( getParentValue(R3, RSMap), 224, 256), extractMInt( getParentValue(R2, RSMap), 224, 256), extractMInt( Mem256, 224, 256))))))
      )
    </regstate>
endmodule
