// Autogenerated using stratification.
requires "x86-configuration.k"

module VCVTPS2PH-M128-YMM-IMM8
  imports X86-CONFIGURATION

  context execinstr(vcvtps2ph:Opcode Imm8:Imm, R2:Ymm, HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vcvtps2ph:Opcode Imm8:Imm, R2:Ymm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (vcvtps2ph Imm8, R2:Ymm, memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (vcvtps2ph:Opcode Imm8:Imm, R2:Ymm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              concatenateMInt( cvt_single_to_fp16_rm(extractMInt( getParentValue(R2, RSMap), 0, 32), handleImmediateWithSignExtend(Imm8, 8, 8)), concatenateMInt( cvt_single_to_fp16_rm(extractMInt( getParentValue(R2, RSMap), 32, 64), handleImmediateWithSignExtend(Imm8, 8, 8)), concatenateMInt( cvt_single_to_fp16_rm(extractMInt( getParentValue(R2, RSMap), 64, 96), handleImmediateWithSignExtend(Imm8, 8, 8)), concatenateMInt( cvt_single_to_fp16_rm(extractMInt( getParentValue(R2, RSMap), 96, 128), handleImmediateWithSignExtend(Imm8, 8, 8)), concatenateMInt( cvt_single_to_fp16_rm(extractMInt( getParentValue(R2, RSMap), 128, 160), handleImmediateWithSignExtend(Imm8, 8, 8)), concatenateMInt( cvt_single_to_fp16_rm(extractMInt( getParentValue(R2, RSMap), 160, 192), handleImmediateWithSignExtend(Imm8, 8, 8)), concatenateMInt( cvt_single_to_fp16_rm(extractMInt( getParentValue(R2, RSMap), 192, 224), handleImmediateWithSignExtend(Imm8, 8, 8)), cvt_single_to_fp16_rm(extractMInt( getParentValue(R2, RSMap), 224, 256), handleImmediateWithSignExtend(Imm8, 8, 8))))))))),
              MemOff,
              128
            )
          
  ...</k>
    <regstate> RSMap:Map </regstate>
endmodule
