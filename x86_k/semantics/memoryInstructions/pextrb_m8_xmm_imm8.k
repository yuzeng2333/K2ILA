// Autogenerated using stratification.
requires "x86-configuration.k"

module PEXTRB-M8-XMM-IMM8
  imports X86-CONFIGURATION

  context execinstr(pextrb:Opcode Imm8:Imm, R2:Xmm, HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (pextrb:Opcode Imm8:Imm, R2:Xmm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 8) ~>
      execinstr (pextrb Imm8, R2:Xmm, memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem8:MInt):MemLoadValue ~> execinstr (pextrb:Opcode Imm8:Imm, R2:Xmm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              extractMInt( lshrMInt( extractMInt( getParentValue(R2, RSMap), 128, 256), uvalueMInt(shiftLeftMInt( concatenateMInt( mi(124, 0), extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 4, 8)), uvalueMInt(mi(128, 3))))), 120, 128),
              MemOff,
              8
            )
          
  ...</k>
    <regstate> RSMap:Map </regstate>
endmodule
