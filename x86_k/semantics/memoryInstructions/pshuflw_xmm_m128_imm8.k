// Autogenerated using stratification.
requires "x86-configuration.k"

module PSHUFLW-XMM-M128-IMM8
  imports X86-CONFIGURATION

  context execinstr(pshuflw:Opcode Imm8:Imm, HOLE:Mem, R3:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (pshuflw:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset, R3:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (pshuflw Imm8, memOffset( MemOff), R3:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (pshuflw:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset, R3:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( extractMInt( getParentValue(R3, RSMap), 0, 128), concatenateMInt( extractMInt( Mem128, 0, 64), concatenateMInt( extractMInt( lshrMInt( Mem128, uvalueMInt(shiftLeftMInt( concatenateMInt( mi(126, 0), extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 0, 2)), uvalueMInt(mi(128, 4))))), 112, 128), concatenateMInt( extractMInt( lshrMInt( Mem128, uvalueMInt(shiftLeftMInt( concatenateMInt( mi(126, 0), extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4)), uvalueMInt(mi(128, 4))))), 112, 128), concatenateMInt( extractMInt( lshrMInt( Mem128, uvalueMInt(shiftLeftMInt( concatenateMInt( mi(126, 0), extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 4, 6)), uvalueMInt(mi(128, 4))))), 112, 128), extractMInt( lshrMInt( Mem128, uvalueMInt(shiftLeftMInt( concatenateMInt( mi(126, 0), extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 6, 8)), uvalueMInt(mi(128, 4))))), 112, 128))))))
      )
    </regstate>
endmodule
