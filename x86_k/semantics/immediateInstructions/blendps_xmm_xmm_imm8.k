// Autogenerated using stratification.
requires "x86-configuration.k"

module BLENDPS-XMM-XMM-IMM8
  imports X86-CONFIGURATION

  rule <k>
    execinstr (blendps Imm8:Imm, R2:Xmm, R3:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( extractMInt( getParentValue(R3, RSMap), 0, 128), concatenateMInt( (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 4, 5), mi(1, 0)) #then extractMInt( getParentValue(R3, RSMap), 128, 160) #else extractMInt( getParentValue(R2, RSMap), 128, 160) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 5, 6), mi(1, 0)) #then extractMInt( getParentValue(R3, RSMap), 160, 192) #else extractMInt( getParentValue(R2, RSMap), 160, 192) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 6, 7), mi(1, 0)) #then extractMInt( getParentValue(R3, RSMap), 192, 224) #else extractMInt( getParentValue(R2, RSMap), 192, 224) #fi), (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 7, 8), mi(1, 0)) #then extractMInt( getParentValue(R3, RSMap), 224, 256) #else extractMInt( getParentValue(R2, RSMap), 224, 256) #fi)))))
)

    </regstate>
    
endmodule

module BLENDPS-XMM-XMM-IMM8-SEMANTICS
  imports BLENDPS-XMM-XMM-IMM8
endmodule
