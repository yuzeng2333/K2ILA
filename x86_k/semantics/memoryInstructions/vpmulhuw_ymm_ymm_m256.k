// Autogenerated using stratification.
requires "x86-configuration.k"

module VPMULHUW-YMM-YMM-M256
  imports X86-CONFIGURATION

  context execinstr(vpmulhuw:Opcode HOLE:Mem, R2:Ymm, R3:Ymm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vpmulhuw:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      loadFromMemory( MemOff, 256) ~>
      execinstr (vpmulhuw memOffset( MemOff), R2:Ymm, R3:Ymm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem256:MInt):MemLoadValue ~> execinstr (vpmulhuw:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 0, 16)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 0, 16))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 16, 32)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 16, 32))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 32, 48)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 32, 48))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 48, 64)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 48, 64))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 64, 80)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 64, 80))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 80, 96)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 80, 96))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 96, 112)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 96, 112))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 112, 128)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 112, 128))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 128, 144)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 128, 144))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 144, 160)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 144, 160))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 160, 176)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 160, 176))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 176, 192)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 176, 192))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 192, 208)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 192, 208))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 208, 224)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 208, 224))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 224, 240)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 224, 240))), 0, 16), extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 240, 256)), concatenateMInt( mi(16, 0), extractMInt( Mem256, 240, 256))), 0, 16))))))))))))))))
      )
    </regstate>
endmodule
