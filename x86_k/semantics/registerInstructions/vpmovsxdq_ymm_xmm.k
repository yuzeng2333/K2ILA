// Autogenerated using stratification.
requires "x86-configuration.k"

module VPMOVSXDQ-YMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vpmovsxdq R1:Xmm, R2:Ymm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( mi(64, svalueMInt(extractMInt( getParentValue(R1, RSMap), 128, 160))), concatenateMInt( mi(64, svalueMInt(extractMInt( getParentValue(R1, RSMap), 160, 192))), concatenateMInt( mi(64, svalueMInt(extractMInt( getParentValue(R1, RSMap), 192, 224))), mi(64, svalueMInt(extractMInt( getParentValue(R1, RSMap), 224, 256))))))
)

    </regstate>
    
endmodule

module VPMOVSXDQ-YMM-XMM-SEMANTICS
  imports VPMOVSXDQ-YMM-XMM
endmodule
