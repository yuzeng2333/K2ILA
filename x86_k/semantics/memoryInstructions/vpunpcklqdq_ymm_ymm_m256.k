// Autogenerated using stratification.
requires "x86-configuration.k"

module VPUNPCKLQDQ-YMM-YMM-M256
  imports X86-CONFIGURATION

  context execinstr(vpunpcklqdq:Opcode HOLE:Mem, R2:Ymm, R3:Ymm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vpunpcklqdq:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      loadFromMemory( MemOff, 256) ~>
      execinstr (vpunpcklqdq memOffset( MemOff), R2:Ymm, R3:Ymm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem256:MInt):MemLoadValue ~> execinstr (vpunpcklqdq:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( concatenateMInt( extractMInt( Mem256, 64, 128), extractMInt( getParentValue(R2, RSMap), 64, 128)), concatenateMInt( extractMInt( Mem256, 192, 256), extractMInt( getParentValue(R2, RSMap), 192, 256)))
      )
    </regstate>
endmodule
