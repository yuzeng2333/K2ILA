// Autogenerated using stratification.
requires "x86-configuration.k"

module VPUNPCKHDQ-YMM-YMM-M256
  imports X86-CONFIGURATION

  context execinstr(vpunpckhdq:Opcode HOLE:Mem, R2:Ymm, R3:Ymm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vpunpckhdq:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      loadFromMemory( MemOff, 256) ~>
      execinstr (vpunpckhdq memOffset( MemOff), R2:Ymm, R3:Ymm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem256:MInt):MemLoadValue ~> execinstr (vpunpckhdq:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( concatenateMInt( extractMInt( Mem256, 0, 32), extractMInt( getParentValue(R2, RSMap), 0, 32)), concatenateMInt( concatenateMInt( extractMInt( Mem256, 32, 64), extractMInt( getParentValue(R2, RSMap), 32, 64)), concatenateMInt( concatenateMInt( extractMInt( Mem256, 128, 160), extractMInt( getParentValue(R2, RSMap), 128, 160)), concatenateMInt( extractMInt( Mem256, 160, 192), extractMInt( getParentValue(R2, RSMap), 160, 192)))))
      )
    </regstate>
endmodule
