// Autogenerated using stratification.
requires "x86-configuration.k"

module VPEXTRQ-M64-XMM-IMM8
  imports X86-CONFIGURATION

  context execinstr(vpextrq:Opcode Imm8:Imm, R2:Xmm, HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vpextrq:Opcode Imm8:Imm, R2:Xmm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 64) ~>
      execinstr (vpextrq Imm8, R2:Xmm, memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem64:MInt):MemLoadValue ~> execinstr (vpextrq:Opcode Imm8:Imm, R2:Xmm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              extractMInt( lshrMInt( extractMInt( getParentValue(R2, RSMap), 128, 256), uvalueMInt(shiftLeftMInt( concatenateMInt( mi(127, 0), extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 7, 8)), uvalueMInt(mi(128, 6))))), 64, 128),
              MemOff,
              64
            )
          
  ...</k>
    <regstate> RSMap:Map </regstate>
endmodule
