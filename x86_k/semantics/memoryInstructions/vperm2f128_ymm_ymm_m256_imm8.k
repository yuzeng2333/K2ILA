// Autogenerated using stratification.
requires "x86-configuration.k"

module VPERM2F128-YMM-YMM-M256-IMM8
  imports X86-CONFIGURATION

  context execinstr(vperm2f128:Opcode Imm8:Imm, HOLE:Mem, R3:Ymm, R4:Ymm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vperm2f128:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset, R3:Ymm, R4:Ymm,  .Operands) =>
      loadFromMemory( MemOff, 256) ~>
      execinstr (vperm2f128 Imm8, memOffset( MemOff), R3:Ymm, R4:Ymm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem256:MInt):MemLoadValue ~> execinstr (vperm2f128:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset, R3:Ymm, R4:Ymm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R4) |-> (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 0, 1), mi(1, 1)) #then (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 4, 5), mi(1, 1)) #then concatenateMInt( mi(128, 0), mi(128, 0)) #else concatenateMInt( mi(128, 0), (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 6, 8), mi(2, 0)) #then extractMInt( getParentValue(R3, RSMap), 128, 256) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 6, 8), mi(2, 1)) #then extractMInt( getParentValue(R3, RSMap), 0, 128) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 6, 8), mi(2, 2)) #then extractMInt( Mem256, 128, 256) #else extractMInt( Mem256, 0, 128) #fi) #fi) #fi)) #fi) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 4, 5), mi(1, 1)) #then concatenateMInt( (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4), mi(2, 0)) #then extractMInt( getParentValue(R3, RSMap), 128, 256) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4), mi(2, 1)) #then extractMInt( getParentValue(R3, RSMap), 0, 128) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4), mi(2, 2)) #then extractMInt( Mem256, 128, 256) #else extractMInt( Mem256, 0, 128) #fi) #fi) #fi), mi(128, 0)) #else concatenateMInt( (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4), mi(2, 0)) #then extractMInt( getParentValue(R3, RSMap), 128, 256) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4), mi(2, 1)) #then extractMInt( getParentValue(R3, RSMap), 0, 128) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4), mi(2, 2)) #then extractMInt( Mem256, 128, 256) #else extractMInt( Mem256, 0, 128) #fi) #fi) #fi), (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 6, 8), mi(2, 0)) #then extractMInt( getParentValue(R3, RSMap), 128, 256) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 6, 8), mi(2, 1)) #then extractMInt( getParentValue(R3, RSMap), 0, 128) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 6, 8), mi(2, 2)) #then extractMInt( Mem256, 128, 256) #else extractMInt( Mem256, 0, 128) #fi) #fi) #fi)) #fi) #fi)
      )
    </regstate>
endmodule
