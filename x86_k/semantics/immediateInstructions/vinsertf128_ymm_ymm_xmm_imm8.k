// Autogenerated using stratification.
requires "x86-configuration.k"

module VINSERTF128-YMM-YMM-XMM-IMM8
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vinsertf128 Imm8:Imm, R2:Xmm, R3:Ymm, R4:Ymm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R4) |-> (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 7, 8), mi(1, 0)) #then concatenateMInt( extractMInt( getParentValue(R3, RSMap), 0, 128), extractMInt( getParentValue(R2, RSMap), 128, 256)) #else concatenateMInt( extractMInt( getParentValue(R2, RSMap), 128, 256), extractMInt( getParentValue(R3, RSMap), 128, 256)) #fi)
)

    </regstate>
    
endmodule

module VINSERTF128-YMM-YMM-XMM-IMM8-SEMANTICS
  imports VINSERTF128-YMM-YMM-XMM-IMM8
endmodule
