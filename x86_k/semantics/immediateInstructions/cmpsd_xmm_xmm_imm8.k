// Autogenerated using stratification.
requires "x86-configuration.k"

module CMPSD-XMM-XMM-IMM8
  imports X86-CONFIGURATION

  rule <k>
    execinstr (cmpsd Imm8:Imm, R2:Xmm, R3:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( extractMInt( getParentValue(R3, RSMap), 0, 192), (#ifMInt eqMInt( cmp_double_pred(extractMInt( getParentValue(R3, RSMap), 192, 256), extractMInt( getParentValue(R2, RSMap), 192, 256), handleImmediateWithSignExtend(Imm8, 8, 8)), mi(1, 1)) #then mi(64, 18446744073709551615) #else mi(64, 0) #fi))
)

    </regstate>
    
endmodule

module CMPSD-XMM-XMM-IMM8-SEMANTICS
  imports CMPSD-XMM-XMM-IMM8
endmodule
