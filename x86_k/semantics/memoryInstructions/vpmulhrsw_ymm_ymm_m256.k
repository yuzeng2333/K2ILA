// Autogenerated using stratification.
requires "x86-configuration.k"

module VPMULHRSW-YMM-YMM-M256
  imports X86-CONFIGURATION

  context execinstr(vpmulhrsw:Opcode HOLE:Mem, R2:Ymm, R3:Ymm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vpmulhrsw:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      loadFromMemory( MemOff, 256) ~>
      execinstr (vpmulhrsw memOffset( MemOff), R2:Ymm, R3:Ymm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem256:MInt):MemLoadValue ~> execinstr (vpmulhrsw:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 0, 16))), mi(32, svalueMInt(extractMInt( Mem256, 0, 16)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31), concatenateMInt( extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 16, 32))), mi(32, svalueMInt(extractMInt( Mem256, 16, 32)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31), concatenateMInt( extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 32, 48))), mi(32, svalueMInt(extractMInt( Mem256, 32, 48)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31), concatenateMInt( extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 48, 64))), mi(32, svalueMInt(extractMInt( Mem256, 48, 64)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31), concatenateMInt( extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 64, 80))), mi(32, svalueMInt(extractMInt( Mem256, 64, 80)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31), concatenateMInt( extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 80, 96))), mi(32, svalueMInt(extractMInt( Mem256, 80, 96)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31), concatenateMInt( extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 96, 112))), mi(32, svalueMInt(extractMInt( Mem256, 96, 112)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31), concatenateMInt( extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 112, 128))), mi(32, svalueMInt(extractMInt( Mem256, 112, 128)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31), concatenateMInt( extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 128, 144))), mi(32, svalueMInt(extractMInt( Mem256, 128, 144)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31), concatenateMInt( extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 144, 160))), mi(32, svalueMInt(extractMInt( Mem256, 144, 160)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31), concatenateMInt( extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 160, 176))), mi(32, svalueMInt(extractMInt( Mem256, 160, 176)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31), concatenateMInt( extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 176, 192))), mi(32, svalueMInt(extractMInt( Mem256, 176, 192)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31), concatenateMInt( extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 192, 208))), mi(32, svalueMInt(extractMInt( Mem256, 192, 208)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31), concatenateMInt( extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 208, 224))), mi(32, svalueMInt(extractMInt( Mem256, 208, 224)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31), concatenateMInt( extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 224, 240))), mi(32, svalueMInt(extractMInt( Mem256, 224, 240)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31), extractMInt( addMInt( lshrMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R2, RSMap), 240, 256))), mi(32, svalueMInt(extractMInt( Mem256, 240, 256)))), uvalueMInt(mi(32, 14))), mi(32, 1)), 15, 31))))))))))))))))
      )
    </regstate>
endmodule
