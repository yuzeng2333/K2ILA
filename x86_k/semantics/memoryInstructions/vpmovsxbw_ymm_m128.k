// Autogenerated using stratification.
requires "x86-configuration.k"

module VPMOVSXBW-YMM-M128
  imports X86-CONFIGURATION

  context execinstr(vpmovsxbw:Opcode HOLE:Mem, R2:Ymm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vpmovsxbw:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (vpmovsxbw memOffset( MemOff), R2:Ymm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (vpmovsxbw:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( mi(16, svalueMInt(extractMInt( Mem128, 0, 8))), concatenateMInt( mi(16, svalueMInt(extractMInt( Mem128, 8, 16))), concatenateMInt( mi(16, svalueMInt(extractMInt( Mem128, 16, 24))), concatenateMInt( mi(16, svalueMInt(extractMInt( Mem128, 24, 32))), concatenateMInt( mi(16, svalueMInt(extractMInt( Mem128, 32, 40))), concatenateMInt( mi(16, svalueMInt(extractMInt( Mem128, 40, 48))), concatenateMInt( mi(16, svalueMInt(extractMInt( Mem128, 48, 56))), concatenateMInt( mi(16, svalueMInt(extractMInt( Mem128, 56, 64))), concatenateMInt( mi(16, svalueMInt(extractMInt( Mem128, 64, 72))), concatenateMInt( mi(16, svalueMInt(extractMInt( Mem128, 72, 80))), concatenateMInt( mi(16, svalueMInt(extractMInt( Mem128, 80, 88))), concatenateMInt( mi(16, svalueMInt(extractMInt( Mem128, 88, 96))), concatenateMInt( mi(16, svalueMInt(extractMInt( Mem128, 96, 104))), concatenateMInt( mi(16, svalueMInt(extractMInt( Mem128, 104, 112))), concatenateMInt( mi(16, svalueMInt(extractMInt( Mem128, 112, 120))), mi(16, svalueMInt(extractMInt( Mem128, 120, 128))))))))))))))))))
      )
    </regstate>
endmodule
