// Autogenerated using stratification.
requires "x86-configuration.k"

module VEXTRACTF128-XMM-YMM-IMM8
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vextractf128 Imm8:Imm, R2:Ymm, R3:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(128, 0), (#ifMInt eqMInt( extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 7, 8), mi(1, 0)) #then extractMInt( getParentValue(R3, RSMap), 128, 256) #else extractMInt( getParentValue(R3, RSMap), 0, 128) #fi))
)

    </regstate>
    
endmodule

module VEXTRACTF128-XMM-YMM-IMM8-SEMANTICS
  imports VEXTRACTF128-XMM-YMM-IMM8
endmodule
