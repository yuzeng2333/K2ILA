// Autogenerated using stratification.
requires "x86-configuration.k"

module VINSERTPS-XMM-XMM-M32-IMM8
  imports X86-CONFIGURATION

  context execinstr(vinsertps:Opcode Imm8:Imm, HOLE:Mem, R3:Xmm, R4:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vinsertps:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset, R3:Xmm, R4:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 32) ~>
      execinstr (vinsertps Imm8, memOffset( MemOff), R3:Xmm, R4:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem32:MInt):MemLoadValue ~> execinstr (vinsertps:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset, R3:Xmm, R4:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R4) |-> concatenateMInt( mi(128, 0), concatenateMInt( concatenateMInt( concatenateMInt( (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 4, 5), mi(1, 1)) #then mi(32, 0) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4), mi(2, 0)) #then extractMInt( getParentValue(R3, RSMap), 128, 160) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4), mi(2, 1)) #then extractMInt( getParentValue(R3, RSMap), 128, 160) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4), mi(2, 2)) #then extractMInt( getParentValue(R3, RSMap), 128, 160) #else Mem32 #fi) #fi) #fi) #fi), (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 5, 6), mi(1, 1)) #then mi(32, 0) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4), mi(2, 0)) #then extractMInt( getParentValue(R3, RSMap), 160, 192) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4), mi(2, 1)) #then extractMInt( getParentValue(R3, RSMap), 160, 192) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4), mi(2, 2)) #then Mem32 #else extractMInt( getParentValue(R3, RSMap), 160, 192) #fi) #fi) #fi) #fi)), (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 6, 7), mi(1, 1)) #then mi(32, 0) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4), mi(2, 0)) #then extractMInt( getParentValue(R3, RSMap), 192, 224) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4), mi(2, 1)) #then Mem32 #else extractMInt( getParentValue(R3, RSMap), 192, 224) #fi) #fi) #fi)), (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 7, 8), mi(1, 1)) #then mi(32, 0) #else (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4), mi(2, 0)) #then Mem32 #else extractMInt( getParentValue(R3, RSMap), 224, 256) #fi) #fi)))
      )
    </regstate>
endmodule
