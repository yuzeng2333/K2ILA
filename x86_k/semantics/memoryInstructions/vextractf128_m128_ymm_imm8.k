// Autogenerated using stratification.
requires "x86-configuration.k"

module VEXTRACTF128-M128-YMM-IMM8
  imports X86-CONFIGURATION

  context execinstr(vextractf128:Opcode Imm8:Imm, R2:Ymm, HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vextractf128:Opcode Imm8:Imm, R2:Ymm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (vextractf128 Imm8, R2:Ymm, memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (vextractf128:Opcode Imm8:Imm, R2:Ymm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 7, 8), mi(1, 0)) #then extractMInt( getParentValue(R2, RSMap), 128, 256) #else extractMInt( getParentValue(R2, RSMap), 0, 128) #fi),
              MemOff,
              128
            )
          
  ...</k>
    <regstate> RSMap:Map </regstate>
endmodule
