// Autogenerated using stratification.
requires "x86-configuration.k"

module VPMULHUW-XMM-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(vpmulhuw:Opcode HOLE:Mem, R2:Xmm, R3:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vpmulhuw:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (vpmulhuw memOffset( MemOff), R2:Xmm, R3:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (vpmulhuw:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(128, 0), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 128, 144)), concatenateMInt( mi(16, 0), extractMInt( Mem128, 0, 16))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 144, 160)), concatenateMInt( mi(16, 0), extractMInt( Mem128, 16, 32))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 160, 176)), concatenateMInt( mi(16, 0), extractMInt( Mem128, 32, 48))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 176, 192)), concatenateMInt( mi(16, 0), extractMInt( Mem128, 48, 64))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 192, 208)), concatenateMInt( mi(16, 0), extractMInt( Mem128, 64, 80))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 208, 224)), concatenateMInt( mi(16, 0), extractMInt( Mem128, 80, 96))), 0, 16), concatenateMInt( extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 224, 240)), concatenateMInt( mi(16, 0), extractMInt( Mem128, 96, 112))), 0, 16), extractMInt( mulMInt( concatenateMInt( mi(16, 0), extractMInt( getParentValue(R2, RSMap), 240, 256)), concatenateMInt( mi(16, 0), extractMInt( Mem128, 112, 128))), 0, 16)))))))))
      )
    </regstate>
endmodule
