// Autogenerated using stratification.
requires "x86-configuration.k"

module VSUBPD-YMM-YMM-M256
  imports X86-CONFIGURATION

  context execinstr(vsubpd:Opcode HOLE:Mem, R2:Ymm, R3:Ymm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vsubpd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      loadFromMemory( MemOff, 256) ~>
      execinstr (vsubpd memOffset( MemOff), R2:Ymm, R3:Ymm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem256:MInt):MemLoadValue ~> execinstr (vsubpd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( sub_double(extractMInt( getParentValue(R2, RSMap), 0, 64), extractMInt( Mem256, 0, 64)), concatenateMInt( sub_double(extractMInt( getParentValue(R2, RSMap), 64, 128), extractMInt( Mem256, 64, 128)), concatenateMInt( sub_double(extractMInt( getParentValue(R2, RSMap), 128, 192), extractMInt( Mem256, 128, 192)), sub_double(extractMInt( getParentValue(R2, RSMap), 192, 256), extractMInt( Mem256, 192, 256)))))
      )
    </regstate>
endmodule
