// Autogenerated using stratification.
requires "x86-configuration.k"

module VPBLENDD-YMM-YMM-YMM-IMM8
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vpblendd Imm8:Imm, R2:Ymm, R3:Ymm, R4:Ymm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R4) |-> concatenateMInt( (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 0, 1), mi(1, 0)) #then extractMInt( getParentValue(R3, RSMap), 0, 32) #else extractMInt( getParentValue(R2, RSMap), 0, 32) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 1, 2), mi(1, 0)) #then extractMInt( getParentValue(R3, RSMap), 32, 64) #else extractMInt( getParentValue(R2, RSMap), 32, 64) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 3), mi(1, 0)) #then extractMInt( getParentValue(R3, RSMap), 64, 96) #else extractMInt( getParentValue(R2, RSMap), 64, 96) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 3, 4), mi(1, 0)) #then extractMInt( getParentValue(R3, RSMap), 96, 128) #else extractMInt( getParentValue(R2, RSMap), 96, 128) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 4, 5), mi(1, 0)) #then extractMInt( getParentValue(R3, RSMap), 128, 160) #else extractMInt( getParentValue(R2, RSMap), 128, 160) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 5, 6), mi(1, 0)) #then extractMInt( getParentValue(R3, RSMap), 160, 192) #else extractMInt( getParentValue(R2, RSMap), 160, 192) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 6, 7), mi(1, 0)) #then extractMInt( getParentValue(R3, RSMap), 192, 224) #else extractMInt( getParentValue(R2, RSMap), 192, 224) #fi), (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 7, 8), mi(1, 0)) #then extractMInt( getParentValue(R3, RSMap), 224, 256) #else extractMInt( getParentValue(R2, RSMap), 224, 256) #fi))))))))
)

    </regstate>
    
endmodule

module VPBLENDD-YMM-YMM-YMM-IMM8-SEMANTICS
  imports VPBLENDD-YMM-YMM-YMM-IMM8
endmodule
