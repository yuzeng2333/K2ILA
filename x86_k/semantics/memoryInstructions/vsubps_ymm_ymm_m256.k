// Autogenerated using stratification.
requires "x86-configuration.k"

module VSUBPS-YMM-YMM-M256
  imports X86-CONFIGURATION

  context execinstr(vsubps:Opcode HOLE:Mem, R2:Ymm, R3:Ymm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vsubps:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      loadFromMemory( MemOff, 256) ~>
      execinstr (vsubps memOffset( MemOff), R2:Ymm, R3:Ymm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem256:MInt):MemLoadValue ~> execinstr (vsubps:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( sub_single(extractMInt( getParentValue(R2, RSMap), 0, 32), extractMInt( Mem256, 0, 32)), concatenateMInt( sub_single(extractMInt( getParentValue(R2, RSMap), 32, 64), extractMInt( Mem256, 32, 64)), concatenateMInt( sub_single(extractMInt( getParentValue(R2, RSMap), 64, 96), extractMInt( Mem256, 64, 96)), concatenateMInt( sub_single(extractMInt( getParentValue(R2, RSMap), 96, 128), extractMInt( Mem256, 96, 128)), concatenateMInt( sub_single(extractMInt( getParentValue(R2, RSMap), 128, 160), extractMInt( Mem256, 128, 160)), concatenateMInt( sub_single(extractMInt( getParentValue(R2, RSMap), 160, 192), extractMInt( Mem256, 160, 192)), concatenateMInt( sub_single(extractMInt( getParentValue(R2, RSMap), 192, 224), extractMInt( Mem256, 192, 224)), sub_single(extractMInt( getParentValue(R2, RSMap), 224, 256), extractMInt( Mem256, 224, 256)))))))))
      )
    </regstate>
endmodule
