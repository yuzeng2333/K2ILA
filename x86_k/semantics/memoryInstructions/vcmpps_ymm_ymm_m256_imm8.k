// Autogenerated using stratification.
requires "x86-configuration.k"

module VCMPPS-YMM-YMM-M256-IMM8
  imports X86-CONFIGURATION

  context execinstr(vcmpps:Opcode Imm8:Imm, HOLE:Mem, R3:Ymm, R4:Ymm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vcmpps:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset, R3:Ymm, R4:Ymm,  .Operands) =>
      loadFromMemory( MemOff, 256) ~>
      execinstr (vcmpps Imm8, memOffset( MemOff), R3:Ymm, R4:Ymm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem256:MInt):MemLoadValue ~> execinstr (vcmpps:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset, R3:Ymm, R4:Ymm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R4) |-> concatenateMInt( (#ifMInt eqMInt( cmp_single_pred(extractMInt( getParentValue(R3, RSMap), 0, 32), extractMInt( Mem256, 0, 32), handleImmediateWithSignExtend(Imm8, 8, 8)), mi(1, 1)) #then mi(32, 4294967295) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt eqMInt( cmp_single_pred(extractMInt( getParentValue(R3, RSMap), 32, 64), extractMInt( Mem256, 32, 64), handleImmediateWithSignExtend(Imm8, 8, 8)), mi(1, 1)) #then mi(32, 4294967295) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt eqMInt( cmp_single_pred(extractMInt( getParentValue(R3, RSMap), 64, 96), extractMInt( Mem256, 64, 96), handleImmediateWithSignExtend(Imm8, 8, 8)), mi(1, 1)) #then mi(32, 4294967295) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt eqMInt( cmp_single_pred(extractMInt( getParentValue(R3, RSMap), 96, 128), extractMInt( Mem256, 96, 128), handleImmediateWithSignExtend(Imm8, 8, 8)), mi(1, 1)) #then mi(32, 4294967295) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt eqMInt( cmp_single_pred(extractMInt( getParentValue(R3, RSMap), 128, 160), extractMInt( Mem256, 128, 160), handleImmediateWithSignExtend(Imm8, 8, 8)), mi(1, 1)) #then mi(32, 4294967295) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt eqMInt( cmp_single_pred(extractMInt( getParentValue(R3, RSMap), 160, 192), extractMInt( Mem256, 160, 192), handleImmediateWithSignExtend(Imm8, 8, 8)), mi(1, 1)) #then mi(32, 4294967295) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt eqMInt( cmp_single_pred(extractMInt( getParentValue(R3, RSMap), 192, 224), extractMInt( Mem256, 192, 224), handleImmediateWithSignExtend(Imm8, 8, 8)), mi(1, 1)) #then mi(32, 4294967295) #else mi(32, 0) #fi), (#ifMInt eqMInt( cmp_single_pred(extractMInt( getParentValue(R3, RSMap), 224, 256), extractMInt( Mem256, 224, 256), handleImmediateWithSignExtend(Imm8, 8, 8)), mi(1, 1)) #then mi(32, 4294967295) #else mi(32, 0) #fi))))))))
      )
    </regstate>
endmodule
