// Autogenerated using stratification.
requires "x86-configuration.k"

module PMOVZXDQ-XMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (pmovzxdq R1:Xmm, R2:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( concatenateMInt( mi(32, 0), extractMInt( getParentValue(R1, RSMap), 192, 224)), concatenateMInt( mi(32, 0), extractMInt( getParentValue(R1, RSMap), 224, 256))))
)

    </regstate>
    
endmodule

module PMOVZXDQ-XMM-XMM-SEMANTICS
  imports PMOVZXDQ-XMM-XMM
endmodule
