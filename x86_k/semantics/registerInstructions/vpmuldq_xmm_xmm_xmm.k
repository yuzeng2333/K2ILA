// Autogenerated using stratification.
requires "x86-configuration.k"

module VPMULDQ-XMM-XMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vpmuldq R1:Xmm, R2:Xmm, R3:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(128, 0), concatenateMInt( mulMInt( mi(64, svalueMInt(extractMInt( getParentValue(R2, RSMap), 160, 192))), mi(64, svalueMInt(extractMInt( getParentValue(R1, RSMap), 160, 192)))), mulMInt( mi(64, svalueMInt(extractMInt( getParentValue(R2, RSMap), 224, 256))), mi(64, svalueMInt(extractMInt( getParentValue(R1, RSMap), 224, 256))))))
)

    </regstate>
    
endmodule

module VPMULDQ-XMM-XMM-XMM-SEMANTICS
  imports VPMULDQ-XMM-XMM-XMM
endmodule
